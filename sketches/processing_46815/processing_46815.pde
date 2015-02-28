
import controlP5.*;
import sojamo.drop.*;

ControlP5 controlP5;
Textarea convertionList;
controlP5.Button btRunApp;
controlP5.Button btIntroOk;
Slider speedSlider;
SDrop drop;
RecordFrames recordFrames;

PApplet app = this;
String[] filePathArray;
int gifSpeed = 2;
boolean declareRecordFrames = false;
boolean controllersIntroVisible = true;
boolean controllersSuccessVisible = true;

int currentState;
int INTRO = 0;
int RUNAPP = 1;
int LOADSUCCESSDATA = 2;
int SUCCESSMESSAGE = 3;
int RESETAPP = 4;

void setup() {
  size(400, 550);
  frameRate(30);
  //background(0);
  
  controlP5 = new ControlP5(app);
  drop = new SDrop(app);
  
  convertionList = controlP5.addTextarea("label1", "", 10, 10, 370, 380);
  
  controlP5.addSlider("gifSpeed",1,3,20,450,16,60).setId(1);
  speedSlider = (Slider)controlP5.controller("gifSpeed");
  speedSlider.setNumberOfTickMarks(3);
  speedSlider.setSliderMode(Slider.FLEXIBLE);
  
  btRunApp = controlP5.addButton("run",2,300,450,80,19);
  btRunApp.setId(2);
  
  btIntroOk = controlP5.addButton("ok",3,300,450,80,19);
  btIntroOk.setId(3);
  
  appInit();
  
}

void draw() {
  
  background(0);
  
  switch(currentState){

    //INTRO////////////////////////////
    case 0:
      // display message, should be cute
      if(declareRecordFrames) {
        controllersIntroVisible(false);
        recordFrames = new RecordFrames(app, filePathArray, gifSpeed);
        declareRecordFrames = false;
        currentState = RUNAPP;
      }
      
    break;
    
    //RUNAPP////////////////////////////
    case 1:
      recordFrames.makeGif();
      if ( recordFrames.isFinishedRecording() ) {
        currentState = LOADSUCCESSDATA;
      }
      
    break;
    
    //LOADSUCCESSDATA///////////////////////////
    case 2:
      controllersSuccessVisible(true);
      convertionList.setHeight(350);
      convertionList.setText(recordFrames.successMessage());
      convertionList.setPosition(10.0, 30.0);
      currentState = SUCCESSMESSAGE;
    break;
    
    //SUCCESSMESSAGE////////////////////////////
    case 3:
      //if I press OK, then I reset data / turn off controllers / send to INTRO
    break;

    //RESETAPP////////////////////////////
    case 4:
      println("CASE 4");
      controllersSuccessVisible(false);
      appInit();
      //currentState = INTRO;
    break;
    
  }
  
}

void dropEvent(DropEvent theDropEvent) {

  if(theDropEvent.isFile()) {
    
    if(filePathArray.length == 0) {
      controllersIntroVisible(true);
    }
    
    File myFile = theDropEvent.file();
    
    if(myFile.isFile()) {  
      filePathArray = append(filePathArray, theDropEvent.filePath());

    } else if(myFile.isDirectory()) {
      File[] tempArray = theDropEvent.listFilesAsArray(myFile,true);
      for(int i=0; i < tempArray.length; i++) {
        filePathArray = append(filePathArray, tempArray[i].toString());
      }
      
    }
    
    convertionList.setText(createList());
    
  }

}

void controlEvent(ControlEvent theEvent) {
  // events from controlP5 will trigger a controlEvent
  // inside your sketch. 
}

public void run(int theValue) {
  println("PRESSSED RUN");
  declareRecordFrames = true;
}

public void ok(int theValue) {
  println("PRESSSED OK");
  currentState = RESETAPP;
}


String createList() {
  String filePathCopy = "";
  for (int i = 0; i < filePathArray.length; i++) {
    filePathCopy = filePathCopy + filePathArray[i] + "\n";
  }
  return(filePathCopy);
}

void appInit() {
  filePathArray = new String[0];
  controllersIntroVisible(false);
  controllersSuccessVisible(false);
  convertionList.setText("");
  currentState = INTRO;
}

void controllersIntroVisible (boolean vis) {
  if(vis != controllersIntroVisible) {
    if(vis == true) {
      println("SHOW");
      convertionList.show();
      speedSlider.show();
      btRunApp.show();
      btRunApp.setPosition(300.0, 450.0);
      controllersIntroVisible = true;
    } else {
      println("HIDE");
      convertionList.hide();
      speedSlider.hide();
      btRunApp.hide();
      btRunApp.setPosition(1000.0, 1000.0);
      controllersIntroVisible = false;
    }
  }
}

void controllersSuccessVisible (boolean vis) {
  if(vis != controllersSuccessVisible) {
    if(vis == true) {
      convertionList.show();
      btIntroOk.show();
      btIntroOk.setPosition(300.0, 450.0);
      controllersSuccessVisible = true;
    } else {
      convertionList.hide();
      btIntroOk.hide();
      btIntroOk.setPosition(1000.0, 1000.0);
      controllersSuccessVisible = false;
    }
  }
}


// RECORD FRAMES CLASS /////////////////////

import gifAnimation.*;

public class RecordFrames {
  
  GifMaker gifExport;
  
  PApplet app;
  boolean isGifMakerDeclared = false;
  boolean isGifDone = false;
  boolean isFinishedRecording = false;
  boolean isQuadCameraFormat = false;
  int index = 0;
  
  String[] sourceImageName = new String[0];
  String[] sourceErrorNotJpg = new String[0];
  String[] sourceErrorBadData = new String[0];
  PImage sourceImage;
  int sourceW;
  int sourceH;
  int sourceXpos;
  int sourceYpos;
  
  int gifSpeedSlow = 1000;
  int gifSpeedMedium = 500;
  int gifSpeedFast = 10;
  int gifFrameRate = gifSpeedFast; //in case speed is not set in controller
  String gifName;
  int gifLongSide = 400;
  int gifShortSide = 300;
  int gifW;
  int gifH;
  
  RecordFrames(PApplet tempPApplet, String[] tempSourceImageName, int tempGifSpeed) {
    
    if (tempGifSpeed == 0) {
      gifFrameRate = gifSpeedSlow;
    } else if (tempGifSpeed == 1) {
      gifFrameRate = gifSpeedMedium;
    } else if (tempGifSpeed == 2) {
      gifFrameRate = gifSpeedFast;
    }
    
    for(int i=0; i < tempSourceImageName.length; i++) {
      if(tempSourceImageName[i].endsWith(".jpg") == true || tempSourceImageName[i].endsWith(".JPG") == true) {
        sourceImageName = append(sourceImageName, tempSourceImageName[i]);
      } else {
        sourceErrorNotJpg = append(sourceErrorNotJpg, tempSourceImageName[i]);
      }
    }
    
    //println("sourceImageName");
    //println(sourceImageName);
    //println("sourceErrorNotJpg");
    //println(sourceErrorNotJpg);
    //sourceImageName = tempSourceImageName;
    
    app = tempPApplet;

  }
  
  void makeGif() {
    
    if (isGifMakerDeclared == false) {
      
      sourceImage = loadImage(sourceImageName[index]);
      //println("sourceImage " + sourceImageName[index] + " is " + isQuadCameraFormat());
      
      //if source image is not corrupted && if image meets specific sizes, then continue
      if (sourceImage.width != -1 && isQuadCameraFormat()) { //width = -1 means it's bad image data. Weird, I know.
        setGifInit();
        setGifName();
        setGifOrientation();
        
        gifExport = new GifMaker(app, (gifName + ".gif"));
        gifExport.setRepeat(0);
        gifExport.setQuality(10);
        gifExport.setSize(gifW, gifH);
        
        isGifMakerDeclared = true;
        
      } else { 
        //skip process, add file path to BAD_DATA array, index++
        sourceErrorBadData = append(sourceErrorBadData, sourceImageName[index]);
        index++;
      }
      
    } else {
      
      positionFrame();
      recordFrame();
      
      if(isGifDone) {
        isGifMakerDeclared = false;
        isGifDone = false;
        index++;
        
      }
      
    }
    
  }
  
  void setGifInit() {
    sourceW = sourceImage.width;
    sourceH = sourceImage.height;
    sourceXpos = 0;
    sourceYpos = 0;
  }
  
  void setGifName() {
    if(sourceImageName[index].endsWith(".jpg") == true || sourceImageName[index].endsWith(".JPG") == true) {
      gifName = sourceImageName[index].substring(0, sourceImageName[index].length()-4);
    }
  }
  
  void setGifOrientation() {
    if((sourceImage.width % gifShortSide) == 0 && (sourceImage.height % gifLongSide) == 0) {
      gifW = gifShortSide;
      gifH = gifLongSide;
    }
    if((sourceImage.width % gifLongSide) == 0 && (sourceImage.height % gifShortSide) == 0) {
      gifW = gifLongSide;
      gifH = gifShortSide;
    }
  }
  
  void positionFrame() {
    background(0);
    image(sourceImage, sourceXpos, sourceYpos);
    if(abs(sourceXpos) < abs(sourceW)) {
      sourceXpos = sourceXpos - gifW;  
    }
    if(abs(sourceXpos) >= abs(sourceW)) {
      sourceXpos = 0;
      sourceYpos = sourceYpos - gifH;
    } 
  }
  
  void recordFrame() { 
    gifExport.setDelay(gifFrameRate);
    gifExport.addFrame();
    if(abs(sourceYpos) >= abs(sourceH)) {
      gifExport.finish();
      isGifDone = true;
    }
  }
  
  boolean isFinishedRecording() {
    if (index == sourceImageName.length ) {
      isFinishedRecording = true;
      //println("sourceErrorBadData");
      //println(sourceErrorBadData);
    }
    return isFinishedRecording;
  }
  
  String successMessage() {
    String successMessage = "\nSUCCESS\n\n------------------\n\nThe following files had problems: \n\n";
    for (int i = 0; i < sourceErrorNotJpg.length; i++) {
      successMessage = successMessage + sourceErrorNotJpg[i] + "\n";
    }
    for (int i = 0; i < sourceErrorBadData.length; i++) {
      successMessage = successMessage + sourceErrorBadData[i] + "\n";
    }
    return(successMessage);
  }
  
  boolean isQuadCameraFormat() {
    if( ((sourceImage.width % gifShortSide) == 0 && (sourceImage.height % gifLongSide) == 0) || ((sourceImage.width % gifLongSide) == 0 && (sourceImage.height % gifShortSide) == 0)) {
      isQuadCameraFormat = true;
    } else {
      isQuadCameraFormat = false;
    }
    return isQuadCameraFormat;
  }
  
}               
