
/* pjs font="Raleway-Light.ttf";
       preload="china.svg"; */


//Objects
//PImage myMap;
PShape myMap;
PFont title;
PFont body;

//Buttons
hitBt btEnter;
hitBt btClose;
hitBt btZoomIn;
hitBt btZoomOut;

//Interaction vars
float imgX;       //Position image
float imgY;
float relX;       //Stores mouse relative to img, when pressed
float relY;
                    //javaScript can't read PImage width! Using shape instead
float iniMapWidth;  //Initial map dimensions
float iniMapHeight;
float mapWidth;     //Changing map dimensions
float mapHeight;
int level;        //Display intro or map (0 or 1)

void setup(){
  size(800, 600);
    
  //Objects
//  myMap = loadImage("nycMap.png");
  myMap = loadShape("china.svg");
  title = createFont("Raleway-Light", 42);
  body = createFont("Raleway-Light", 13);

  //Interaction vars  
  imgX = 0;
  imgY = 0;
  level = 0;

  iniMapWidth = myMap.width;
  iniMapHeight = myMap.height;
  mapWidth = myMap.width;
  mapHeight = myMap.height;  
//  println(mapWidth);

  //Buttons
  textFont(body);
  btEnter = new hitBt(int(width/2 - textWidth("ENTER")/2 - 20), height/2 + 63,
                      int(textWidth("ENTER") + 40), 30, "closeWindow");
  
  btClose = new hitBt(width - 60, 30,
                      30, 30, "enterLevel");
                      
  btZoomIn = new hitBt(30, 30, 30, 30, "zoomIn");
                      
  btZoomOut = new hitBt(30, 70, 30, 30, "zoomOut");                      
}

void mousePressed(){
  if(level == 0){
    btEnter.check();
    btClose.check();
  }else{
    btZoomIn.check();
    btZoomOut.check();
    relX = mouseX + imgX;
    relY = mouseY + imgY;
    cursor(MOVE);
  }
}

void navigate(String instruction){
  //Intro
  if(level == 0){
    if(instruction.equals("closeWindow")){
      //It's actually a javaScript function! So cool you can call it from here!
      self.close();  
    }else if(instruction.equals("enterLevel")){
      level++; 
    }
  
  //Map
  }else{
    if(instruction.equals("zoomIn")){
      mapWidth *= 0.9;
      mapHeight *= 0.9;
    }else if(instruction.equals("zoomOut")){
      mapWidth *= 1.1;
      mapHeight *= 1.1;
    }
    //Map minimum and maximum dimensions
    mapWidth = constrain(mapWidth, iniMapWidth*0.75, 2*iniMapWidth);
    mapHeight = constrain(mapHeight, iniMapHeight*0.75, 2*iniMapHeight);
  }
}

void mouseReleased(){
  cursor(ARROW);
}

void mouseDragged(){
  imgX = relX - mouseX;
  imgY = relY - mouseY;  
}

void draw(){
  background(255);
  
  //INTRO!
  if(level == 0){
    //Title
    fill(100);
    textFont(title);
    textAlign(CENTER, TOP);
    text("I P A S I A", width/2, height/2);

    //enter
    btEnter.display();
    fill(100);
    textFont(body);
    text("ENTER", width/2, height/2 + 70);
    
    //Close
    btClose.display();    
    line(btClose.btX + 10, btClose.btY + 10,
         btClose.btX + btClose.btWidth - 10, btClose.btY + btClose.btHeight - 10);
    line(btClose.btX + btClose.btWidth - 10, btClose.btY + 10,
         btClose.btX + 10, btClose.btY + btClose.btHeight - 10);
  
  //MAP
  }else{
    //image(myMap, imgX, imgY, mapWidth, mapHeight);
    
    //Gotta constrain coordinates here!
    //If you put constrain inside drag, map will go out of boundaries when resizing
    imgX = constrain(imgX, width - mapWidth, 0);
    imgY = constrain(imgY, height - mapHeight, 0);    
    shape(myMap, imgX, imgY, mapWidth, mapHeight);

      //ZoomIn
      btZoomIn.display();
      line(btZoomIn.btX + btZoomIn.btWidth/2, btZoomIn.btY + 10,
           btZoomIn.btX + btZoomIn.btWidth/2, btZoomIn.btY + btZoomIn.btHeight - 10);
      line(btZoomIn.btX + 10, btZoomIn.btY + btZoomIn.btHeight/2,
           btZoomIn.btX + btZoomIn.btWidth - 10, btZoomIn.btY + btZoomIn.btHeight/2);
    
      //ZoomOut
      btZoomOut.display();
      line(btZoomOut.btX + 10, btZoomOut.btY + btZoomOut.btWidth/2,
           btZoomOut.btX + btZoomOut.btWidth - 10, btZoomOut.btY + btZoomOut.btWidth/2);
  }
}
class hitBt{
  int btX;
  int btY;
  int btWidth;
  int btHeight;
  String instruction;
  
  hitBt(int tempX, int tempY, int tempWidth, int tempHeight, String tempInstruction){
    btX = tempX;
    btY = tempY;
    btWidth = tempWidth;
    btHeight = tempHeight;
    instruction = tempInstruction;
  }
  
  void check(){
    if(btX <= mouseX && mouseX <= (btX + btWidth)
    && btY <= mouseY && mouseY <= (btY + btHeight) ){
      navigate(instruction);
    }
  }
  
  void display(){
    stroke(100);
    fill(255);    
    rect(btX, btY, btWidth, btHeight);  
  }
}


