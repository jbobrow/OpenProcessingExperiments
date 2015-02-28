
/**
 * Serial Read & Write to LogFile
 *
 * Read data from Arduino through serial port and appends the data to a text file provided.
 * Code by: Naveen Karuthedath, Barry Chris & Aradhan
 * Slightly modified by Guillaume Carret for use with a temperature controller
*/

import processing.serial.*;
Serial sPort;  
String sData;

String file1 = "C:/Templog.csv";
String comPort = "COM4";
int logDelay = 10000; //ms delay

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
    logData(file1,sData,true);
    delay(logDelay);
  }
}

void logData( String fileName, String newData, boolean appendData)
 {
    BufferedWriter bw=null;
    try { //try to open the file
    FileWriter fw = new FileWriter(fileName, appendData);
    bw = new BufferedWriter(fw);
    bw.write(newData+ System.getProperty("line.separator")));// + System.getProperty("line.separator"));
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
