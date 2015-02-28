


/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/15161*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */


PImage reference;
int SPEED = 0;
int SPEED0 = 0;
int MAXSPEED = 10000;
int TESTS = 15;
//the percent that colours must have in common to link together
float ACCURACY = 85;

float DISTANCE = 350;
float DISTANCE1 = 40;
float DISTANCE0 = 350;
float MINDISTANCE = 29;
//stops from getting stuck on a single colour
int MAXTRIES = 5000;

int DELAY = 10000; //in milisecs

int timeCounter;

int imageCount = 5;
String imagePrefix = "frame_";

int locTest;
color colTest;
int xTest;
int yTest;
float testTot;

color col;
int loc;
int x;
int y;

int count = 0;
int tries = 0;
boolean newPix = true;


PImage[] frame;
int visFrameN;

void setup(){
  
  //frame = Gif.getPImages(this, "data/homer.gif");
  loadGif();
  size(frame[0].width,frame[0].height);
  size(338,260);
  visFrameN = 0;
  reference = frame[visFrameN];
  background(0);
  strokeWeight(1);
  
  timeCounter = millis();
}

void draw(){  
  
  if(DISTANCE > MINDISTANCE) DISTANCE -= .15;
  if(SPEED < MAXSPEED) SPEED ++;
  
  for(int i = 0; i < SPEED; i++){
    
    if(newPix || tries > MAXTRIES){
      newPix = false;
      tries = 0;
      //choose a random pixel to test for
      locTest = int(random(reference.pixels.length));
      //grab its colour/position
      colTest  = reference.pixels[locTest ];
      xTest  = locTest  % reference.width;
      yTest  = locTest / reference.width;    
      
      //generates the value for that colour
      float rV = colTest >> 16 & 0xFF;
      float gV = colTest >> 8 & 0xFF;
      float bV = colTest & 0xFF;
      testTot = rV + gV + bV;
    }
        
    //choose a random pixel
    loc = int(random(reference.pixels.length));
    col = reference.pixels[loc];
    
    //test    
    if(colorTest(col)){      
      x = loc % reference.width;
      y = loc/ reference.width;
      if(dist(xTest,yTest,x,y) <= DISTANCE){
        stroke(colTest,40);
        //enable to make spiderweb like drawings
        //stroke(brightness(col),50);
        line(xTest,yTest,x,y);
        count++;
      }
    }

    //resets counter
    if(count > TESTS){
      newPix = true;
      count = 0;
    }
    tries++;
  }
  timeCheck();
}

//tests colour similarities 
boolean colorTest(color _col){
  
  float rV = _col >> 16 & 0xFF;
  float gV = _col >> 8 & 0xFF;
  float bV = _col & 0xFF;  
  float tot = rV + gV + bV;
 
 //check similarity
 float perc = (testTot/tot) *100;
 
 if(perc >= ACCURACY ){
   return true;
 }else return false;
}

void mousePressed() {
  updateFrame();
}

void keyPressed(){
  if(key == ' ')
    restart();
}

void updateFrame(){
  if(visFrameN<frame.length-1)
    visFrameN ++;
  else
    visFrameN = 0;
  reference = frame[visFrameN];
  
  if(DISTANCE<DISTANCE1)
    DISTANCE = DISTANCE1;
  //SPEED = SPEED0;
}

void restart(){
  background(0);
  DISTANCE = DISTANCE0;
  reference = frame[0];
  SPEED = SPEED0;
}

void timeCheck(){
  if(millis() >= timeCounter + DELAY){
    timeCounter= millis();
    updateFrame();
  }
}

void loadGif(){//a have split the gif into separete images
  frame = new PImage[imageCount];
  for (int i = 0; i < imageCount; i++) {
     // Use nf() to number format 'i' into four digits
     String filename = imagePrefix + nf(i, 3) + ".gif";
     frame[i] = loadImage(filename);
   }
}


