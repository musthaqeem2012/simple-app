
import java.io.File*;
import java.sql.*; 
import groovy.sql.Sql;
def GetDBDetails() {
	println("inside")
def props = new Properties()

File propsFile = new File('dbprop.properties')
props.load(propsFile.newDataInputStream())
String sEnvType="QA"
String sDBURL
String sDBUname
String sDBPwd
String sDBDriver
if(sEnvType=="QA")
{
 sDBURL=props.getProperty('db.QADBURL')
 sDBUname=props.getProperty('db.QADBUname')
 sDBPwd=props.getProperty('db.QADBPwd')
 sDBDriver=props.getProperty('db.QADBDriver') 
}
else
{
 sDBURL=props.getProperty('db.DevDBURL')
 sDBUname=props.getProperty('db.DevDBUname')
 sDBPwd=props.getProperty('db.DevDBPwd')
 sDBDriver=props.getProperty('db.DevDBDriver')  
}
	println("Im inside groovy")
	/*
      // Creating a connection to the database
      def sql = Sql.newInstance(sDBUrl,sDBUname, 
         sDBPwd, sDBDriver)  
			
      sql.eachRow('select * from employee') {
         tp -> 
         println([tp.FIRST_NAME,tp.LAST_NAME,tp.age,tp.sex,tp.INCOME])
      }  
		
      sql.close()
      */
   }
return this
