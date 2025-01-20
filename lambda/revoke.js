import {
  EC2Client,
  DescribeSecurityGroupRulesCommand,
  RevokeSecurityGroupIngressCommand,
  RevokeSecurityGroupEgressCommand,
} from "@aws-sdk/client-ec2";

export const handler = async (event) => {
  const client = new EC2Client();
  const command1 = new DescribeSecurityGroupRulesCommand({
    Filters: [
      {
        Name: "group-id",
        Values: ["sg-07200b79f45edf4e7"],
      },
    ],
  });

  const result1 = await client.send(command1);

  const command2 = new RevokeSecurityGroupIngressCommand({
    GroupId: "sg-07200b79f45edf4e7",
    SecurityGroupRuleIds: result1.SecurityGroupRules.filter(
      (v) => !v.IsEgress
    ).map((v) => v.SecurityGroupRuleId),
  });

  const command3 = new RevokeSecurityGroupEgressCommand({
    GroupId: "sg-07200b79f45edf4e7",
    SecurityGroupRuleIds: result1.SecurityGroupRules.filter(
      (v) => v.IsEgress
    ).map((v) => v.SecurityGroupRuleId),
  });

  await client.send(command2);
  await client.send(command3);
};
