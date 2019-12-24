#################
# Provider
#################
variable "region" {
  description = "The region used to launch this module resources."
  default     = ""
}

variable "profile" {
  description = "The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD_PROFILE environment variable."
  default     = ""
}
variable "shared_credentials_file" {
  description = "This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used."
  default     = ""
}

variable "skip_region_validation" {
  description = "Skip static validation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet)."
  default     = false
}

#################
# Rds Instance
#################
variable "create_instance" {
  description = "Whether to create security group. If false, you can use a existing RDS instance by setting `existing_instance_id`."
  default     = true
}

variable "engine" {
  description = "RDS Database type. Value options: MySQL, SQLServer, PostgreSQL, and PPAS"
  default     = ""
}

variable "engine_version" {
  description = "RDS Database version. Value options can refer to the latest docs [CreateDBInstance](https://www.alibabacloud.com/help/doc-detail/26228.htm) `EngineVersion`"
  default     = ""
}

variable "db_instance_class" {
  description = "RDS Instance type. For details, see [Instance Types](https://www.alibabacloud.com/help/doc-detail/26312.htm)."
  default     = ""
}

variable "db_instance_storage" {
  description = "The storage capacity of the instance. Unit: GB. The storage capacity increases at increments of 5 GB. For more information, see [Instance Types](https://www.alibabacloud.com/help/doc-detail/26312.htm)."
  type        = number
  default     = 20
}

variable "instance_name" {
  description = "The name of DB instance. A random name prefixed with 'terraform-rds-' will be set if it is empty."
  default     = ""
}

variable "instance_charge_type" {
  description = "Valid values are `Prepaid`, `Postpaid`, Default to `Postpaid`."
  default     = "Postpaid"
}

variable "existing_instance_id" {
  description = "The Id of an existing RDS instance. If set, the `create` will be ignored."
  default     = ""
}

variable "db_name" {
  description = "Name of the database requiring a uniqueness check. It may consist of lower case letters, numbers, and underlines, and must start with a letter and have no more than 64 characters."
  default     = "dbtestname"
}

variable "character_set" {
  description = "Select utf8, gbk, latin1 or utf8mb4"
  default     = "utf8"
}

variable "name" {
  description = "Operation account requiring a uniqueness check. It may consist of lower case letters, numbers, and underlines, and must start with a letter and have no more than 16 characters."
  default     = "user1"
}

variable "password" {
  description = "Operation password. It may consist of letters, digits, or underlines, with a length of 6 to 32 characters."
  default     = "upw123"
}

variable "type" {
  description = "Privilege type of account.Normal: Common privilege. Super: High privilege.Default to Normal. It is is valid for MySQL 5.5/5.6 only."
  default     = "Normal"
}


variable "account_name" {
  description = "A specified account name."
  default     = "account1"
}

variable "privilege" {
  description = "The privilege of one account access database."
  default     = "ReadOnly"
}

variable "db_names" {
  description = "List of specified database name."
  type        = list(string)
  default     = []
}

variable "instance_storage" {
  description = "The allocated storage in gigabytes"
  default     = "20"
}

variable "instance_type" {
  description = "DB Instance type, for example: mysql.n1.micro.1. fall list is : https://www.alibabacloud.com/help/zh/doc-detail/26312.htm"
  default     = "rds.mysql.s2.large"
}

variable "period" {
  description = "The duration that you will buy DB instance (in month). It is valid when instance_charge_type is PrePaid. Valid values: [1~9], 12, 24, 36. Default to 1"
  default     = 1
}

variable "zone_id" {
  description = "The Zone to launch the DB instance. "
  default     = "cn-hangzhou-b"
}

variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate"
  type        = list(string)
  default     = []
}

variable "vswitch_id" {
  description = "The virtual switch ID to launch DB instances in one VPC."
  default     = ""
}

variable "security_ips" {
  description = " List of IP addresses allowed to access all databases of an instance. The list contains up to 1,000 IP addresses, separated by commas. Supported formats include 0.0.0.0/0, 10.23.12.24 (IP), and 10.23.12.24/24 (Classless Inter-Domain Routing (CIDR) mode. /24 represents the length of the prefix in an IP address. The range of the prefix length is [1,32])."
  type        = list(string)
  default     = []
}

variable "allocate_public_connection" {
  description = "Whether to allocate public connection for a RDS instance. If true, the connection_prefix can not be empty."
  type        = bool
  default     = true
}
variable "connection_prefix" {
  description = "Prefix of an Internet connection string. A random name prefixed with 'tf-rds-' will be set if it is empty."
  type        = string
  default     = ""
}

variable "port" {
  description = " Internet connection port. Valid value: [3001-3999]. Default to 3306."
  default     = 3306
}

variable "backup_period" {
  description = "DB Instance backup period."
  type        = list(string)
  default     = []
}

variable "backup_time" {
  description = " DB instance backup time, in the format of HH:mmZ- HH:mmZ. "
  default     = "02:00Z-03:00Z"
}

variable "retention_period" {
  description = "Instance backup retention days. Valid values: [7-730]. Default to 7."
  default     = 7
}

variable "log_backup" {
  description = "Whether to backup instance log. Default to true."
  default     = true
}

variable "log_retention_period" {
  description = "Instance log backup retention days. Valid values: [7-730]. Default to 7. It can be larger than 'retention_period'."
  default     = 7
}
#append
variable "create_database" {
  default = true
}

variable "create_account" {
  default = true
}
variable "databases" {
  description = "add databases"
  type        = list(map(string))
  default     = []
}
variable "db_description" {
  description = "Description of the database"
  default     = ""
}
variable "db_character_set" {
  description = "Character set."
  default     = "utf8"
}


variable "readonly_engine" {
  description = "The database engine to use"
  default     = "MySQL"
}

variable "readonly_engine_version" {
  description = "The engine version to use"
  default     = "5.7"
}

variable "readonly_instance_storage" {
  description = "The allocated storage in gigabytes"
  default     = "20"
}

variable "readonly_instance_type" {
  description = "DB Instance type, for example: mysql.n1.micro.1. fall list is : https://www.alibabacloud.com/help/zh/doc-detail/26312.htm"
  default     = "rds.mysql.s2.large"
}
variable "readonly_zone_id" {
  description = "The Zone to launch the DB instance. "
  default     = "cn-hangzhou-b"
}
variable "new_db_readonly_instance" {
  description = "Adding DB   readonly instance"
  default     = false
}

variable "new_connection" {
  description = "Adding db connections"
  default     = false
}
variable "connection_list" {
  description = "add connection"
  type        = list(map(string))
  default     = []
}

variable "vswitch_ids" {
  description = "A list of virtual switch IDs to launch in."
  type        = list(string)
  default     = []
}
