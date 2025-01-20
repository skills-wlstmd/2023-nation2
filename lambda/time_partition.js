export const handler = async (event, context) => {
  const output = event.records.map((record) => {
    let data = JSON.parse(Buffer.from(record.data, "base64").toString());
    const time = new Date(data.timestamp);

    time.setHours(time.getHours() + 9);

    data = {
      ...data,
      year: time.getFullYear().toString(),
      month: (time.getMonth() + 1).toString(),
      day: time.getDate().toString(),
      hour: time.getHours().toString(),
      minute: time.getMinutes().toString(),
      second: time.getSeconds().toString(),
      processingtime: data.processingtime.endsWith("ms")
        ? parseFloat(data.processingtime.replace("ms", ""))
        : parseFloat(data.processingtime.replace("μs", "")) / 1000,
    };

    delete data.timestamp;

    return {
      recordId: record.recordId,
      result: "Ok",
      data: Buffer.from(JSON.stringify(data)).toString("base64"),
      metadata: {
        partitionKeys: {
          year: time.getFullYear().toString(),
          month: (time.getMonth() + 1).toString(),
          day: time.getDate().toString(),
          hour: time.getHours().toString(),
          minute: time.getMinutes().toString(),
        },
      },
    };
  });

  return { records: output };
};
