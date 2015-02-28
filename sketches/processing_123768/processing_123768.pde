

String inputFileName;
String inputFileNames[];
int    currentFlowerIndex;
DropdownList p1;
//above is new
import controlP5.*;
ControlP5 cp5, controlP5;

import gifAnimation.*;
import processing.video.*;
GifMaker gifExport;
int maxImages = 500;
int router = 0;
int r=1;
int value = 0;
Movie movie;
int ii = 0;
int fh = 0;
PImage[] gifs = new PImage[maxImages];
PImage[] frameHolder = new PImage[200];
String FFile;
String currentMovie;
String textArea="";

//these are all of the variables we need to run the coverflow
int imgCount = 500;
//int router = 1;
float imgX[] = new float[imgCount];
float imgY = 0;
float imgZ[] = new float[imgCount];
float imgWidth;
float imgHeight;
float Distance;
int tracker = 0;
float DistanceTracker[] = new float[imgCount];
ControlWindow controlWindow;
String timestamp;
String textValue = "";
Textarea myTextarea;
//int interval;
//int sequence;
int sizeExport = 20;
Knob myKnobA;
int sizeout = 50;
int jump = 0;
int maxframes = 200;
int interval = 1;
int sequence = 20;

void setup()
{
  size(1280, 900, P3D);
  controlP5 = new ControlP5(this);
  
  controlWindow = controlP5.addControlWindow("", 800, 20, 500, 175)
    .hideCoordinates()
    .setBackground(color(2))
    //.setUndecorated(false);
   // controlWindow.papplet().frame.setAlwaysOnTop(true);
    ;
  
  controlP5.addTab("output")
      .moveTo(controlWindow)
     .setColorBackground(color(0, 160, 100))
     .setColorLabel(color(255))
     .setColorActive(color(255,128,0))
     ;
     
      controlP5.addSlider("jump")
     .moveTo(controlWindow)
     .setPosition(110, 50)
     .setRange(0,100)
     ;
     
      controlP5.addSlider("maxframes")
     .moveTo(controlWindow)
     .setPosition(110, 40)
     .setRange(0,500)
     ;
     
 controlP5.addSlider("sizeout")
     .moveTo(controlWindow)
     .setPosition(110,80)
     .setRange(0,100)
     ;
   
 controlP5.addSlider("interval")
     .moveTo(controlWindow)
     .setPosition(110,60)
     .setRange(1,20)
     ;
     
     controlP5.addSlider("sequence")
     .moveTo(controlWindow)
     .setPosition(110,70)
     .setRange(0,300)
     ;
       
 // controlP5.addTab("diff")
 //     .moveTo(controlWindow)
 //    .setColorBackground(color(0, 160, 100))
 //    .setColorLabel(color(255))
 //    .setColorActive(color(255,128,0))
  //   ;
     
     
       
// controlP5.getTab("default") 
  //   .moveTo(controlWindow)
    // .activateEvent(true)
    // .setLabel("level1")
    // .setId(1)
    // ;
     
//controlP5.getTab("output")
   //  .activateEvent(true)
  //   .setId(2)
     ;
     
//controlP5.getTab("diff")
  //   .activateEvent(true)
    // .setId(3)
      ;
  p1 = controlP5.addDropdownList("videoSelect", 0, 30, 100, 150)
  .moveTo(controlWindow);
  
 //   controlP5.addTextfield("jump")
 //    .moveTo(controlWindow)
 //    .setPosition(110,20)
 //    .setSize(40,10)
    // .setLable("0")
     //.setFont(font)
     //.setFocus(true)
 //    .setColor(color(255,0,0))
 //    ;
     
//        controlP5.addTextfield("max.frames")
//     .moveTo(controlWindow)
//     .setPosition(160,20)
//     .setSize(40,10)
//     .setStringValue("100")
//     .setValueLabel("100")
     //.setFont(font)
     //.setFocus(true)
//     .setColor(color(255,0,0))
//     ;
     
 //        controlP5.addTextfield("sequence")
 //    .moveTo(controlWindow)
 //    .setPosition(110,45)
 //    .setSize(40,10)
     //.setStringValue("20")
     //.setFont(font)
    // .setFocus(true)
//     .setColor(color(255,0,0))
 //    ;
     
   //     controlP5.addTextfield("interval")
   //  .moveTo(controlWindow)
   //  .setPosition(160,45)
   //  .setSize(40,10)
   //  .setStringValue("2")
     //.setFont(font)
     //.setFocus(true)
    // .setColor(color(255,0,0))
    // ;
     
 
     
      controlP5.addButton("reload")
      .moveTo(controlWindow)
     .setValue(0)
     .setPosition(110,20)
     .setSize(40,12)
     ;
 //       controlP5.addButton("update")
 //     .moveTo(controlWindow)
 //    .setValue(2)
 //    .setPosition(210,45)
 //    .setSize(40,12)
 //    ;
     
//       controlP5.addRadioButton("radioButton")
//         .setValue(4)
 //        .moveTo(controlWindow)
   //      .setPosition(210,45)
     //    .setSize(20,10)
  //       .setColorForeground(color(120))
  //       .setColorActive(color(255))
  //       .setColorLabel(color(255))
  //       .setItemsPerRow(1)
  //       .setSpacingColumn(25)
  //       .addItem("grab",1)
  //       ;
     
     controlP5.addButton("clear")
     .moveTo(controlWindow)
     .setValue(1)
     .setPosition(470,0)
     .setSize(30,12)
     ;
     
 
       
  //myKnobA = controlP5.addKnob("knob")
     //           .moveTo(controlWindow)
        //       .setId(6)
        //       .setRange(0,200)
        //       .setValue(50)
        //       .setPosition(100,20)
        //       .setRadius(50)
        //       .setViewStyle(Knob.ARC)
        //       .setDragDirection(Knob.VERTICAL)
        //       ;

   cp5 = new ControlP5(this);
  
  myTextarea = cp5.addTextarea("txt")
                  .moveTo(controlWindow)
                  .setPosition(260,0)
                  .setSize(200,170)
                 // .setFont(createFont("arial",12))
                  .setLineHeight(14)
                  .setColor(color(128))
                  .setColorBackground(color(255,100))
                  .setColorForeground(color(255,100))
                  //.setBorderColor(43)
                  //.setBorderColor(33)
                  
                  ;

    //controlP5.getController("knob").moveTo("output");
                    
    controlWindow.papplet().frame.setAlwaysOnTop(true);                 

  opener(); //opener loads the file information into the drop-down menu
  frameRate(24);
  String path = sketchPath + "/data";
  inputFileNames = listFileNames (path);
  println("gifAnimation " + Gif.version());
   timestamp = year() + nf(month(),2) + nf(day(),2) + "-"  + nf(hour(),2) + nf(minute(),2) + nf(second(),2);
  println(timestamp);
  gifExport = new GifMaker(this, "export"+timestamp+".gif");
  //gifExport.setQuality(2);
  gifExport.setRepeat(0);
 // gifExport.setSize(100,100);
 // gifExport.setTransparent(255, 255, 255);
}

void setupImages() {
  imageMode(CENTER);
}

void calcImagePos(int i) {
  imgX[i] = map(i, 0, 300, 0, width);
  Distance = dist(imgX[i], imgY, mouseX, mouseY);
  //println(Distance);
  imgZ[i] = -Distance;
  imgWidth = 1500;
  imgHeight = imgWidth * 0.75;
  //  tracker=imgZ[i];
}

void displayImages(int i) {
  pushMatrix();
  //  println("this is where the magic happens");
  translate(imgX[i], height/3, imgZ[i]);
  //translate(imgX[i], height/3, imgZ[i]*2);
  if (gifs[i] == null) 
  {
  }
  else {
    //println("should print to screen right here");
    // image(gifs[r],0,370);
    image(gifs[i], 0, 0, imgWidth/4, imgHeight/4);
  }

  // image(gifs[i], 0, 0, imgWidth/3, imgHeight/3);
  popMatrix();
}  

void draw() {
 //this is the control panel area of draw.  
  
  background(0);


  if (router == 4) {
    //   println("router is in four");
    for (int i = 3; i < maxImages-2; i++) {
      calcImagePos(i);
      displayImages(i);
    }
  }

  if (router == 2) {
    // stop the movie     
    println("we're in router2");
  //  myTextarea.setText("we're in router 2"); 
    
    
    movie.stop();
    router = 3;
  }

  if (router == 1) {
    movie.loop();
    //println("we're in here");
  }

  if (router == 3) {
    println("we're in router3");  
    frameRate(120);
    setupImages(); 
    router = 4;
  }
}

void mouseClicked() {
  tracker=3;
  for (int i = 3; i < maxImages-3; i++) {
    if (imgZ[i] < imgZ[i+1]) {
      tracker = i;
    }
  }
  if (gifs[tracker] == null) {
    println("the frame returns as null here!!!");
  }
  else {
    println("THE INDEX NUMBER IS !!!!!   "+ tracker);
    textArea = textArea+ "\n ADDING FRAME # "+tracker+" TO STACK\n";
    myTextarea.setText(textArea);
    //gifExport.addFrame(gifs[tracker]);
    frameHolder[fh]=gifs[tracker];
    fh=fh+1;
  }

  println("*********end of set********");
}

void keyPressed() {
  if (key=='c'){
         textArea = textArea+ "\n ADDING A SEQUENCE TO THE STACK. . .:\n\n";
    myTextarea.setText(textArea);
       tracker=3;
  for (int i = 3; i < maxImages-3; i++) {
    if (imgZ[i] < imgZ[i+1]) {
      tracker = i;
    }
  }
  if (gifs[tracker] == null) {
    println("the frame returns as null here!!!");
  }
  else {
    println("THE INDEX NUMBER IS !!!!!   "+ tracker);
    textArea = textArea+ "CURRENT FRAME ## "+tracker+"\n";
    myTextarea.setText(textArea);
  //  gifExport.addFrame(gifs[tracker]);

  }
// interval = int(controlP5.get(Textfield.class,"interval").getText());
// sequence = int(controlP5.get(Textfield.class,"sequence").getText());
  println("*********end of set********");
 for (int i = tracker; i<sequence+tracker; i=i+interval){
   
  //  gifExport.addFrame(gifs[i]);
    frameHolder[fh] = gifs[i];
  fh = fh+1;
     textArea = textArea+"CURRENT FRAME # " +i+"\n";
    myTextarea.setText(textArea);
    println("interval= "+interval+" sequence= "+sequence+" current frame ="+i); 
  }
}
//  }
  if (key==',') controlWindow.hide();
  if (key=='.') controlWindow.show();
  if (key==' '){
  println("WE'RE IN HERE");
  for (int i = 0; i<fh; i++)
  {
    frameHolder[i].resize(int(imgWidth*.01*sizeout),0);
    gifExport.addFrame(frameHolder[i]);
      textArea = textArea+"SAVING STACK FRAME # " +i+"\n";
    myTextarea.setText(textArea);
  }
  fh = 0;
  gifExport.finish();
  textArea = textArea+ "\n SAVED: ";
  textArea = textArea +"export"+timestamp+"\n      NEW: export";
  
   timestamp = year() + nf(month(),2) + nf(day(),2) + "-"  + nf(hour(),2) + nf(minute(),2) + nf(second(),2);
  textArea = textArea + timestamp+"\n";
  myTextarea.setText(textArea);
  myTextarea.scroll(1); 
   //.showScrollbar()
   ;
   println(timestamp);
 // gifExport = new GifMaker(this, "export"+timestamp+".gif");
  gifExport = new GifMaker(this, "export"+timestamp+".gif");
  gifExport.setRepeat(0);
 // gifExport.setTransparent(255, 255, 255);
  }
}


void opener(){

 String path = sketchPath + "/data";
  inputFileNames = listFileNames (path);
  currentFlowerIndex = 0;
  println("input file names "+ inputFileNames.length);
  for (int i=0; i<inputFileNames.length; i++) {
    println(inputFileNames[i]);
    p1.addItem(inputFileNames[i], i);
  }

  boolean bFoundFlowerImage = false;
  while ((bFoundFlowerImage == false) && (currentFlowerIndex < inputFileNames.length)) {
    inputFileName = inputFileNames[currentFlowerIndex];
    println("File " + currentFlowerIndex + ": " + inputFileName); 
    if (inputFileName.endsWith("mov") || inputFileName.endsWith("MOV") || inputFileName.endsWith("mp4")) {
      bFoundFlowerImage = true;
      println("found a movie file");
    } 
    else {
      currentFlowerIndex++;
      inputFileName = inputFileNames[currentFlowerIndex];
    }
  }  
 // loadFlower();
}

String[] listFileNames(String dir)
{
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } 
  else {
    // If it's not a directory
    return null;
  }
}


void controlEvent(ControlEvent theEvent) {

  if (theEvent.isGroup()) {
    
 //   if (theEvent.getGroup().getValue() == "reload") {
//      textArea = "";
      
    
 //   }
    
 //   if (theEvent.getGroup() == "jump") {
 //  text(controlP5.get(Textfield.class,"jump").getText(), 360,130);
   
   
 
 // text(int(textValue), 360,195);
    // check if the Event was triggered from a ControlGroup
    println("event from group ####: "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());
    println("here we go!!! " +int(theEvent.getGroup().getValue()));
    println("selection = "+inputFileNames[int(theEvent.getGroup().getValue())]);
 //   println("THE TEXT FIELD SAYS= "+int(controlP5.get(Textfield.class,"jump").getText()));
     movie = new Movie(this, inputFileNames[int(theEvent.getGroup().getValue())]);
      currentMovie=inputFileNames[int(theEvent.getGroup().getValue())];
     movie.loop();
     movie.pause();
     router=1;
    movie.jump(float("jump"));
    maxImages = maxframes;
      background(0);
      imgCount=maxImages;
      ii=0;
  } 
//  }
  else if (theEvent.isController()) {
  println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
  
 
    //the following section of code handles the button push.
    if (theEvent.getController().getValue() == 0) {
      movie = new Movie(this, currentMovie);
      //currentMovie=inputFileNames[int(theEvent.getGroup().getValue())];
     movie.loop();
     movie.pause();
     router=1;
    movie.jump(jump);
  //  maxImages = int(controlP5.get(Textfield.class,"max.frames").getText());
  maxImages = maxframes;
      background(0);
      imgCount=maxImages;
      ii=0;
  }
  if(theEvent.getController().getValue() == 1){
    textArea="";
     myTextarea.setText(textArea);
  }
  
  if(theEvent.getController().getValue() == 2){
    textArea=textArea+"\nCURRENT FRAME= "+ii;
     myTextarea.setText(textArea);
     maxImages = maxframes;
  }
}
}





void movieEvent(Movie m) {
  m.read();
  if (ii > maxImages-2)
  {
    router = 2;
    movie.stop();
  }
  // ii=frameCount;
  println(ii+" <---ii + framecount --->"+frameCount);
   textArea = textArea+ "LOADING FRAME: " +ii+"\n";
   
    myTextarea.setText(textArea);
  
  // println("FRAMECOUNT= "+frameCount);
  gifs[ii]=m.get(0, 0, m.width*2, m.height*2);
 //gifs[ii]=m.get(0, 0, m.width, m.height);
  ii=ii+1;
}


