
// Ray Tong
// Project #2
// Digital Storm

PFont font;
int ELEMENT_COUNT = 50;
float[] arraysX = new float[ELEMENT_COUNT]; // This holds x-coordinate of each "hour" element
float[] arraysY = new float[ELEMENT_COUNT]; // This holds y-coordinate of each "hour" element
float[] arraysA = new float[ELEMENT_COUNT]; // This holds x-coordinate of each "minute" element
float[] arraysB = new float[ELEMENT_COUNT]; // This holds y-coordinate of each "minute" element
float[] speedH = new float[ELEMENT_COUNT]; // This holds speed of each element
float[] sizeT = new float[ELEMENT_COUNT]; // This holds size of each element
float[] speedOld = new float[ELEMENT_COUNT]; // Temporary storage of original speed

void setup() {
  frameRate(90);
  size(1024,768);
  smooth();
  textAlign(CENTER);
  font = loadFont("Calibri-Bold-48.vlw");
  textFont(font);
  
  // Randomly sets the X,Y and Speed of each element
  for(int i=0; i<ELEMENT_COUNT; i++){
    arraysX[i] = random(10,width/2 - 5);
    arraysY[i] = random(height);
    arraysA[i] = random(width/2 + 5, width - 5);
    arraysB[i] = random(height);
    speedH[i] = random(1,3);
    speedOld[i] = speedH[i];
    sizeT[i] = speedH[i]*7 + 10;
  }
}

// Class for the Hour Element
class cHour{
  float h;
  float[] xlocation;
  float[] ylocation;
  String currentHour;

  cHour(float h1, float[] columns, float[] rows){
    h = h1;
    if (h>=13) h-=12;
    currentHour = nf(int(h),2);
    xlocation = columns;
    ylocation = rows;
  }

  void move(){
    for(int i =0; i<ELEMENT_COUNT; i++)
      ylocation[i]+= speedH[i];
  }

  void display(){
    fill(181,223,223);
    
    if(mousePressed)
    {
      for(int i = 1; i < ELEMENT_COUNT; i++)
      {
        if(mouseButton == RIGHT)
          xlocation[i] += speedH[i]*3;
        if(mouseButton == LEFT)
          xlocation[i] -= speedH[i]*3;
        ylocation[i] += speedH[i];
      }
    }
    
    for(int i = 1; i<ELEMENT_COUNT;i++){
        textSize(sizeT[i]);
        text(currentHour, xlocation[i], ylocation[i]);
        }
 }
   float getLocationX(){
     return pmouseX;
   }
   float getLocationY(){
     return pmouseY;
   }
}

// Class for the Minute Element
class cMinute{
  float[] xlocation;
  float[] ylocation;
  String currentMin;

  cMinute(float m1, float[] columns, float[] rows){
    currentMin = nf(int(m1),2);
    xlocation = columns;
    ylocation = rows;
   }

  void move(){
    for(int i =0; i<ELEMENT_COUNT; i++)
      ylocation[i]+= speedH[i];
  }

  void display(){
    fill(175,205,237);

    if(mousePressed)
    {
      for(int i = 1; i < ELEMENT_COUNT; i++)
      {
        if(mouseButton == RIGHT)
          xlocation[i] += speedH[i]*3;
        if(mouseButton == LEFT)
          xlocation[i] -= speedH[i]*3;
        ylocation[i] += speedH[i];
      }
    }
    
    for(int i = 1; i<ELEMENT_COUNT;i++){
        textSize(sizeT[i]);
        text(currentMin, xlocation[i], ylocation[i]);
      }
    }
}

void draw() {

int timeH = hour();
int timeM = minute();

cHour hour1 = new cHour(timeH, arraysX, arraysY);
cMinute minute1 = new cMinute(timeM, arraysA, arraysB);

  background(0);
  
  float s = second();

  String timeS = nf(int(s),2);

  fill(255);
  textSize(55);
  text(timeS, width/2, height/2);
  
  hour1.display();
  minute1.display();
  hour1.move();
  minute1.move();
  
  if(s>54.9){
    textSize(22);
    fill(255);
    text("A new minute is approaching", width/2, height-height/2+20);
  }
  for(int i = 0; i<ELEMENT_COUNT; i++)
  {
     if(s > 54.9 || (mousePressed && mouseButton == CENTER)){
        for(int k = 0; k<ELEMENT_COUNT; k++){
        speedH[k] = int(random(20));}
      if(arraysY[i] > height+5 || arraysX[i] > width+5 || arraysX[i] < -5){
        arraysY[i] = int(0);
        arraysX[i] = int(random(10,width/2 - 5));
      }
      if(arraysB[i] > height+5 || arraysA[i] > width+5 || arraysA[i] < -5){
        arraysB[i] = int(0);
        arraysA[i] = int(random(width/2 + 5, width - 5));
      }
    }
    if(mousePressed){
      if(arraysY[i] > height+5 || arraysX[i] > width+5 || arraysX[i] < -5){
        arraysY[i] = random(-50,height+50);
        arraysX[i] = random(-50,width+50);
      }
      if(arraysB[i] > height+5 || arraysA[i] > width+5 || arraysA[i] < -5){
        arraysB[i] = random(-50,height+50);
        arraysA[i] = random(-50,width+50);
      }
    }
    else{
        speedH[i] = speedOld[i];
      
      if(arraysY[i] > height+5 || arraysX[i] > width+5 || arraysX[i] < -5){
        arraysY[i] = int(0);
        arraysX[i] = int(random(10,width/2 - 5));
      }
      if(arraysB[i] > height+5 || arraysA[i] > width+5 || arraysA[i] < -5){
        arraysB[i] = int(0);
        arraysA[i] = int(random(width/2 + 5, width - 5));
      }
    }
  }
}




