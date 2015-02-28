
/**
 * Serial Read & Write to LogFile
 *
 * Read data from Arduino through serial port and appends the data to a text file provided.
 * Code by: Naveen Karuthedath, Barry Chris & Aradhan
 * debugged by adding some import java.....for processing 2.03
*/

import processing.serial.*;
import java.util.List;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
Serial sPort;  
String sData;

String file1 = "E:/ArduinoLog.txt";
String comPort = "COM5"; //change this to /dev/ttyACM0 for linux, make sure your device is not sending
                         // anything while it is detected by the os,so not send when just powered on
int logDelay = 1000; //ms delay

void setup()
{
  size(640,480);//window size
  //if serial port is available
  try {
   sPort = new Serial(this, comPort, 9600);
   // don’t read the serial buffer until a new line char
   // should use Serial.println("") in arduino code
   sPort.bufferUntil('\n');   
  } finally {} 
  
}

void draw()
{
  // If data is available,
  if (sPort.available() > 0) {  
    sData =  sPort.readStringUntil('\n');    
    //sData =  sPort.readString(); 
    logData(file1,getDateTime() + sData,true);
    delay(logDelay);
  }
}

void logData( String fileName, String newData, boolean appendData)
 {
    BufferedWriter bw=null;
    try { //try to open the file
    FileWriter fw = new FileWriter(fileName, appendData);
    bw = new BufferedWriter(fw);
    bw.write(newData);// + System.getProperty("line.separator"));
    } catch (IOException e) {
    } finally {
    if (bw != null){ //if file was opened try to close
        try {
        bw.close();
        } catch (IOException e) {}
    }
    }
}

String getDateTime()
{
      SimpleDateFormat df = new SimpleDateFormat("[ dd/MM/yyyy HH:mm:ss ] ");
      Calendar date = Calendar.getInstance(); // the current date and time
      return(df.format(date.getTime()));
}

//Arduino Sample Code:
/*void setup() {
  Serial.begin(9600);
}

void loop() {
  Serial.println("Test-data..");
  delay(200);
}
*/

