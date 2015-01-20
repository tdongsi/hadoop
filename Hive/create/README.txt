# These scripts and procedure are tested with Cloudera VM only.

# Put the text file to HDFS
hdfs dfs -mkdir /user/cloudera/college
hdfs dfs -put ./college.data /user/cloudera/college
hdfs dfs -put ./student.data /user/cloudera/college
hdfs dfs -put ./apply.data /user/cloudera/college

# Run the script
hive -f college.sql
hive -f rating.sql

# To verify, go to hive
hive

# In hive

# For college.sql
hive> use college;
hive> show tables;
hive> select * from college;
