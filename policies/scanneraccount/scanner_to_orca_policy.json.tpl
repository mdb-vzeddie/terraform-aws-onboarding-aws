{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Inspect",
            "Effect": "Allow",
            "Action": [
                "ec2:AllocateAddress",
                "ec2:ReleaseAddress",
                "ec2:ImportKeyPair",
                "ec2:CreateVolume",
                "ec2:RunInstances",
                "ec2:RequestSpotInstances",
                "ec2:RequestSpotFleet",
                "ec2:CreateNetworkInterface",
                "ec2:CreateKeyPair",
                "ec2:DeleteKeyPair",
                "ec2:CreateSubnet",
                "ec2:CreateRouteTable",
                "ec2:CreateRoute",
                "ec2:AssociateRouteTable",
                "ec2:CreateNatGateway",
                "ec2:CreateInternetGateway",
                "ec2:AttachInternetGateway",
                "ec2:CreateVpc",
                "ec2:ModifyVpcAttribute",
                "ec2:CreateSecurityGroup",
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:RevokeSecurityGroupIngress",
                "ec2:AuthorizeSecurityGroupEgress",
                "ec2:RevokeSecurityGroupEgress",
                "ec2:ModifyInstanceAttribute",
                "ec2:CreateTags",
                "ec2:CancelSpotInstanceRequests",
                "ec2:DeleteSubnet",
                "ec2:DeleteNatGateway",
                "ec2:DetachInternetGateway",
                "ec2:DisassociateRouteTable"
            ],
            "Resource": "*"
        },
        {
            "Sid": "Delete",
            "Effect": "Allow",
            "Action": [
                "ec2:DeleteInternetGateway",
                "ec2:DeleteRouteTable",
                "ec2:DeleteRoute",
                "ec2:DeleteVpc",
                "ec2:AttachVolume",
                "ec2:DetachVolume",
                "ec2:DeleteSnapshot",
                "ec2:DeleteVolume",
                "ec2:DeleteSecurityGroup",
                "ec2:TerminateInstances",
                "ec2:ModifyVolume",
                "ec2:ModifyVolumeAttribute",
                "ec2:CancelSpotFleetRequests",
                "ec2:ModifySpotFleetRequest"
            ],
            "Resource": "*",
            "Condition": {
                "StringLike": {
                    "ec2:ResourceTag/Orca": "*"
                }
            }
        },
        {
            "Sid": "InvokeLambda",
            "Effect": "Allow",
            "Action": [
                "lambda:InvokeFunction"
            ],
            "Resource": "arn:${partition}:lambda:*:*:function:Orca*"
        },
        {
            "Sid": "ReadLambdaLogs",
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "logs:DescribeLogStreams",
                "logs:PutLogEvents",
                "logs:GetLogEvents"
            ],
            "Resource": "arn:${partition}:logs:*:*:log-group:Orca*"
        },
        {
            "Sid": "CreateSvcLinked",
            "Effect": "Allow",
            "Action": [
                "iam:CreateServiceLinkedRole"
            ],
            "Resource": "arn:${partition}:iam::*:role/aws-service-role/spot.amazonaws.com/AWSServiceRoleForEC2Spot*",
            "Condition": {
                "StringLike": {
                    "iam:AWSServiceName": "spot.amazonaws.com"
                }
            }
        }
    ]
}
