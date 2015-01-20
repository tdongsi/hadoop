# These scripts and procedure are tested with Cloudera VM only.

#######################################
# Method 1: go through HDFS
#######################################

# Put the data files (as csv files) to HDFS
hdfs dfs -mkdir /user/cloudera/college
hdfs dfs -put ./college.data /user/cloudera/college
hdfs dfs -put ./student.data /user/cloudera/college
hdfs dfs -put ./apply.data /user/cloudera/college

# Run the script
hive -f college.sql
hive -f rating.sql

# To verify, go to hive
hive

#######################################
# Now in hive CLI, for example

# For college.sql
hive> use college;
hive> show tables;
hive> select * from college;



#######################################
# Method 2: use local data file
#######################################
hive -f college_local.sql

