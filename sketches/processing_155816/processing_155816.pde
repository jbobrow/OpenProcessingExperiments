





int numImages = 11;  // The number of frames in the animation
int numOfWoods = 4;

PImage[] images = new PImage[numImages];
PImage[] woods = new PImage[numOfWoods];
PImage[] names = new PImage[5];
int butterfliesLimit = 100;


int imgWidth;
int imageHeight;  
  
   


PImage img;
PImage img2;


Audio player;
Audio  player2;
ArrayList<Butterfly> butterflies;

Timer bellsTimer;
int delta = 70;
int limit =70;

 int screenW;
int screenH;
int limiB=50;
int limiB2=100;
float scale = 0.2;

float deltaTint=10;
float tin=0;
boolean changeBack= false;
boolean justChange= true;
boolean changeBack2= false;
boolean justChange2= true;

int current1=0;
int current2=0;

void setup() {
  
  screenW = 1000; //displayWidth;
  screenH = 500;//displayHeight;
  size(  1000  ,500, JAVA2D);
 
  img = loadImage("woods1.jpg");
  img.resize(screenW   , screenH);
  
  
  butterflies = new ArrayList<Butterfly>();
  bellsTimer = new Timer(1000);
  player = new Audio();
  player2 = new Audio();
  
  images[0]  = loadImage("mariposa1.png");
  images[1]  = loadImage("mariposa2.png"); 
  images[2]  = loadImage("mariposa3.png");
  images[3]  = loadImage("mariposa4.png"); 
  images[4]  = loadImage("mariposa5.png");
  images[5]  = loadImage("mariposa6.png"); 
  images[6]  = loadImage("mariposa5.png");
  images[7]  = loadImage("mariposa4.png"); 
  images[8]  = loadImage("mariposa3.png");
  images[9]  = loadImage("mariposa2.png"); 
  images[10] = loadImage("mariposa1.png");
  
  int s1 = (int) (images[0].width*scale);      //(screenW *scale) ;
  int s2 = (int) (images[0].height*scale);     //(screenH * scale);
  //for (int i=0;i<images.length;i++)
  //  images[i].resize(s1,s2);
    
    
  woods[0] = loadImage("woods1.jpg");
  woods[1] = loadImage("woods2.jpg");
  woods[2] = loadImage("woods3.jpg");
  woods[3] = loadImage("woods4.jpg"); 
  for (int i=0;i<woods.length;i++)
    woods[i].resize(screenW   , screenH);   
  
  names[0] = loadImage("cephise7.jpg");
  names[1] = loadImage("cephise8.jpg");
  names[2] = loadImage("cephise9.jpg");
  names[3] = loadImage("cephise10.jpg");
  names[4] = loadImage("cephise11.jpg");
  for (int i=0;i<names.length;i++)
    names[i].resize(screenW   , screenH); 
    
    
  imgWidth =images[0].width;
  imageHeight = images[0].height;
  
  player.setAttribute("src","atmos1.wav");
  player2.setAttribute("src","bells.wav");
  player.addEventListener("ended",repeat);
  player.volume=0.25;
  player2.volume=0.25;
  player.play();
  img2 = names[(int)random(0,5)];
  
  //loadPixels(); 
  frameRate(60);

  createButterflies();
}





void draw() {
 if (bellsTimer.isFinished()) {
    player2.pause();
  }
  
  if(tin<=0){
    if(!justChange)
       changeBack = true;
  }else
    justChange= false;
  
  if(changeBack) {
    img = woods[current1++];
    if(current1 > 3)
      current1 =0;
    justChange = true;
    changeBack = false;
  }
  
  if(tin >= 150){
    if(!justChange2)
       changeBack2= true;
  }else
    justChange2= false;
  
  if(changeBack2) {
    img2 = names[current2++];
    if(current2 > 4)
      current2 =0;
    justChange2 = true;
    changeBack2 = false;
  }
  
  
  
  
  background(0);
  tint(255,tin);
  imageMode(CORNER);
  image(img,0,0,screenW,screenH);
  
  tint(255,255-2*tin);
  image(img2,0,0,screenW,screenH);
 
  
  moveObjects();
  
  
  for(int i=0;i<butterflies.size();i++){
    butterflies.get(i).display(images[butterflies.get(i).getCurrentFrame()]);
  }
   
   if(mousePressed){
     tin += deltaTint;
      if(tin > 255)
        tin = 255;
   }else{  
     tin -= (deltaTint*2);
     if(tin <= 0 )
       tin = 0;
   }
  
  
     
}



void moveObjects(){  
  for(int i=0;i<butterflies.size();i++){
    butterflies.get(i).move();
  }
}





void createButterflies(){
  for(int i=0;i<limiB;i++){
    int x = (int)random(50,width-50);
    int y = (int)random(50,height-50);
    butterflies.add(new Butterfly(x,y,(int)random(0,7),imgWidth,imageHeight));
  }
  
 
}


void mouseReleased(){
   for(int i=0;i<butterflies.size();i++)
      butterflies.get(i).disolver();
}

void  mousePressed(){
  for(int i=0;i<butterflies.size();i++)
     butterflies.get(i).aparecer();
}

void mouseClicked() { 
  player2.play();
  
  
  bellsTimer.start();
  tin += deltaTint;
  if(tin > 255)
    tin = 255;
}



void repeat(){
  player.play();
}



  class Butterfly{
  int sW,sH;
  int numFrames = 11;  // The number of frames in the animation
  int currentFrame = 0;
  PVector position;
  PVector speed;
  PVector speedOriginal;  
  float scale = 0.4;
  int imgWidth;
  int imageHeight;
  int type ;
  float angle;
  Timer timer;
  
  float initSize;
  float deltaSize;
  float alpha=0;
  float deltaAlpha = 50;
  color c;
  
 boolean disolve=true;
  
  public  Butterfly(int x,int y, int typeO,int imgWidthO, int imageHeightO){
    sW = width;
    sH= height;
    position = new PVector(x,y);
    imgWidth = imgWidthO;
    imageHeight = imageHeightO;
    type = typeO;
    c = color((int)random( 0, 255 ), (int)random( 0, 255 ), (int)random( 0, 255 ));
    alpha = 255;
    timer = new Timer((int)random(5000,20000));
    timer.start();
    switch(typeO){
      case 0:
          //speed = new PVector((int)random( 2, 5 ),0);
          angle = 0;
          break;
        case 1:
         // speed = new PVector((int)random( 2, 5 ),-(int)random( 2, 5 ));
          angle = -45;
          break;
        case 2:
        //speed = new PVector(0,-(int)random( 2, 5 ));
        angle = -90;
          break;
        case 3:
          //speed = new PVector(-(int)random( 2, 5 ),-(int)random( 2, 5 ));
          angle = -135;
          break;
        case 4:
          //speed = new PVector(-(int)random( 2, 5 ),0);
          angle = 180;
          break;
        case 5:
          //speed = new PVector(-(int)random( 2, 5 ),(int)random( 2, 5 ));
          angle = -225;
          break;
        case 6:
          //speed = new PVector(0,(int)random( 2, 5 ));
          angle = -270;
          break;
          
       case 7:
         // speed = new PVector((int)random( 2, 5 ),(int)random( 2, 5 ));
          angle = -315;
          break;
    
     }
    speed = new PVector((int)random( 2, 10 ),0);
    speedOriginal=  new PVector(speed.x,speed.y);
    //speed.rotate(radians(angle));
    rotate2D(speed, radians(angle));
    
   initSize = 0.1;
   deltaSize= 0.01;
    alpha =0;
  }
  
  
  
  public void move() {
        /*if(mousePressed == true){
          PVector dir = new PVector(mouseX,mouseY);
          speed = dir;
          System.out.println("mouse pressed");
        }else{
          speed.x =  speedOriginal.x;
          speed.y = speedOriginal.y;
          System.out.println("mouse no pressed");
        }*/
    
        position.add(speed);   
        float r = imgWidth/2;
        float r2 = imageHeight/2;
        if ( (position.x<r) || (position.x>width-r)){
          speed.x = speed.x*-1;
          angle = 180 - angle;
        } 
         
        if( (position.y<r) || (position.y>height-r)) {
         speed.y = speed.y*-1 ;
         angle =   360 - angle;
        }
    
   
    
    
  }
  
  
  
  
  public void disolver(){
    disolve = true;
  }
  
  public void aparecer(){
    disolve = false;
  }
  
  public float getAlpha(){
    return alpha;
  }
  
  public int getAngle(){
   return type;
 }
  
 public int getCurrentFrame(){
   return currentFrame;
 }
 
 public int getX(){
   return (int)position.x;
 }

public int getY(){
   return (int)position.y;
 }
  
  public void display(PImage frame){
    currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
    imageMode(CENTER);
  
  
    pushMatrix();
    translate(position.x,position.y);
    //image(frame,position.x,position.y,frame.width*scale,frame.height*scale);
    
    
    if (timer.isFinished()  && !mousePressed) {
        angle = (int)random( 0, 180 );
        
        speed.x =  speedOriginal.x;
        speed.y = speedOriginal.y;
        //speed.rotate(radians(angle));
        rotate2D(speed, radians(angle));
        timer.start();  
    }
    rotate(radians(angle));
    
    image(frame,0,0);
    
    if(disolve)
      alpha -=(deltaAlpha*.2);
    else
      alpha +=deltaAlpha;
      
    if(alpha > 255)
      alpha = 255;
    if(alpha < 0)
      alpha = 0;
      
    tint(c, alpha); 
    popMatrix();
    
   initSize+=deltaSize;
   if(initSize > 0.2)
     initSize = 0.2;
  }
  
  
  
  void rotate2D(PVector v, float theta) {
  float xTemp = v.x;
  v.x = v.x*cos(theta) - v.y*sin(theta);
  v.y = xTemp*sin(theta) + v.y*cos(theta);
}

  
  
} 


class Star {

  // The PShape object
  PShape s;
  // The location where we will draw the shape
  float x, y;
  float speedX, speedY;
  float innerRadius;
  float outerRadius;
  color c;
  float alpha = 255;
  float deltaAlpha=20;
  float deltaSpeed;
  PVector[] points;
  boolean disolve=true;
  
  Star(float xxx, float yyy,int numSpikes,float innerRadiusO,float outerRadiusO ) {
    x = xxx;//random(100, width-100);
    y = yyy;//random(100, height-100);
    innerRadius = innerRadiusO;
    outerRadius= outerRadiusO;
    alpha = 0;
    
     points = new PVector[ numSpikes * 2 ];
    float angle = TWO_PI / points.length;
     
    for ( int i = 0; i < points.length; i++ ) {
         
        float xx, yy;
         
        if ( i % 2 == 0 ) {
            xx = cos( angle * i ) * outerRadius;
            yy = sin( angle * i ) * outerRadius;
        } else {
            xx = cos( angle * i ) * innerRadius;
            yy = sin( angle * i ) * innerRadius;
        }
         points[i] = new PVector( xx, yy );
    }
    deltaSpeed = 30;
    speedX= random(-deltaSpeed, deltaSpeed);
    speedY=random(-deltaSpeed, deltaSpeed);
    
  }

  void move() {
   x += speedX;
   y += speedY;
  }
  
  public boolean isFinish(){
    return alpha<= 0;
  }
  
public void disolver(){
    disolve = true;
  }
  
  public void aparecer(){
    disolve = false;
    alpha = 255;
  }
  
  public void setPosition(int xx, int yy){
    x = xx;
    y = yy;
  }
  
  void display() {
   
     alpha -= deltaAlpha; 
      
    c = color(random(0,255),random(0,255),random(0,255),alpha);
     
    pushMatrix();
    translate(x, y);
 
    beginShape();
    fill(c);
    noStroke();
    for (int i = 0; i < points.length; i++) {
        vertex( points[i].x, points[i].y );
    }
    endShape(CLOSE);
    popMatrix();
  }
}

// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 10-5: Object-oriented timer

class Timer {
 
  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis(); 
  }
  
  // The function isFinished() returns true if 5,000 ms have passed. 
  // The work of the timer is farmed out to this method.
  boolean isFinished() { 
    // Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}


