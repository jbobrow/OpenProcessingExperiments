
import processing.serial.*;
import controlP5.*;

Serial dreadPort;
OutputStream output;
PImage img;

ControlP5 controlP5;
Button photoButton;
PFont font = createFont("Arial", 14);

String photoName;
String photoNameNumber;
int photoNumber = 1;
boolean cameraSave = false;
boolean photoOpen = false;
boolean photoSwitch = false;

String filePath = "remoteCamera";
String fileStatus;
String folderName = timeStamp();

int frameLocationX = 50;
int frameLocationY = 50;
int frameLocationSet = 0;

String[] serialString;
String serialCheck;
String portName = "DreaduinoBluetooth";
int portNumber;
int serialIndex;

int dataIn = 0;
int charC = 67;
int charA = 65;
int charM = 77;
int charP = 80;
int charI = 73;
int charE = 69;
int charO = 79;
int charF = 70;
int[] checkData = new int[3];
int[] checkEOF = new int[3];



void setup()
{
  size(640, 580);
  background(40); 
  frame.setResizable(true);

  findSerialPort();

  dreadPort = new Serial(this, Serial.list()[portNumber], 115200);
  dreadPort.clear();

  setupControlP5();

  statusUpdate();

  println("remoteCamera");
  println("ready");
}



void draw() 
{
  if (frameLocationSet < 2) {
    frame.setLocation(frameLocationX, frameLocationY);
    frameLocationSet ++;
  } 

  if (photoSwitch) remotePhoto();
}



void serialEvent(Serial myPort) 
{ 
  dataIn = myPort.read();

  checkData[2] = checkData[1];
  checkData[1] = checkData[0];
  checkData[0] = dataIn;


  if (checkData[2] == charC && checkData[1] == charA && checkData[0] == charM) {    

    photoNameNumber = nf(photoNumber, 5);
    photoName = ("img" + photoNameNumber + ".jpg");
    filePath = (folderName + "/" + photoName);

    println("saving");
    cameraSave = true;
    statusUpdate();
  }

  if (checkData[2] == charP && checkData[1] == charI && checkData[0] == charC) {    
    println("sending");

    openPhoto();
    return;
  }

  if (photoOpen) writePhoto();
}



void findSerialPort()
{
  serialString = Serial.list();

  println(serialString);  

  for (int i = serialString.length - 1; i > 0; i--) {

    serialCheck = serialString[i];
    serialIndex = serialCheck.indexOf(portName);

    if (serialIndex > -1)  portNumber = i;
  }
}



void statusUpdate() 
{
  noStroke();
  fill(40); 
  rect(0, 481, 640, 100);

  fill(255);
  text(filePath, 300, 512); 

  if (cameraSave) fileStatus = "saving";
  if (photoOpen) fileStatus = "sending";
  if (!cameraSave && !photoOpen) fileStatus = "ready";  

  fill(255);
  text(fileStatus, 300, 547);
}



void openPhoto() 
{
  if (!photoOpen) {

    cameraSave = false;
    photoOpen = true;

    output = createOutput("rcamera/" + filePath);

    statusUpdate();
  }
}



void writePhoto() 
{
  try {

    output.write(dataIn);

    checkEOF[2] = checkEOF[1];
    checkEOF[1] = checkEOF[0];
    checkEOF[0] = dataIn;

    if (checkEOF[2] == charE && checkEOF[1] == charO && checkEOF[0] == charF) {    

      closePhoto();

      println(photoName + " received");
      println("ready");
      photoOpen = false;
      statusUpdate();
    }
  }

  catch (IOException e) {
    e.printStackTrace();
  }
} 



void closePhoto() 
{
  try {

    output.flush();
    output.close();
    photoOpen = false;

    statusUpdate();

    photoNumber ++;

    displayPhoto();
  } 

  catch (IOException e) {
    e.printStackTrace();
  }
}



void displayPhoto() 
{
  noStroke();
  fill(40); 
  rect(0, 0, 640, 480);

  img = loadImage("rcamera/" + filePath);
  image(img, 0, 0);
}



void setupControlP5()
{
  controlP5 = new ControlP5(this);
  controlP5.setControlFont(font);

  photoButton = controlP5.addButton("photo", 0, 120, 500, 58, 58);
  photoButton.setSwitch(photoSwitch);
  photoButton.setColorBackground(color(150, 0, 0, 255));
}

void controlEvent(ControlEvent theEvent)
{
  if (theEvent.controller().name()=="photo") remotePhoto();
}



void remotePhoto() {

  dreadPort.write('P');
  photoSwitch = false;
}

String timeStamp() {

  String timestamp = year()+"_"+month()+"_"+day()+"_"+hour()+"_"+minute();
  return timestamp;
}



void keyPressed() {
  if (key == ' ' && !photoSwitch) {

    photoSwitch = true;
    remotePhoto();
  }
}
