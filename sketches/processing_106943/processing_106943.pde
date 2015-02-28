
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white//Objects
Ball[] balls;
Ball[] closerObjs;
Ball[] farthestObjs;
Hud myHud;
//vars
int numOfBalls = 20;
int[] iniFrameCount = {1};

void setup(){
  //set initial Settings
  size(500,500);
  closerObjs = new Ball[2];  
  balls = new Ball[numOfBalls];
  myHud = new Hud();  
  iniFrameCount[0] = setTime();
  //INITIAL DEPLOYMENT
  for(int i = 0; i < numOfBalls; i++){
    balls[i] = new Ball((int)random(width), (int)random(height), (int)random(-0.1, 0.1), 12);
  }
  
  
}
////////////////
//DRAW OBJECTS//
////////////////
void draw(){
   background(126);
   int i = 0;
   //calculate Time
   myHud.timer(iniFrameCount[0]);
   //display all the objects   
   if((myHud.currentSecond > 2) && (myHud.flags[0] == false )){
     
     myHud.flags[0] = true; 
     closerObjs = getMinDist(balls);
     farthestObjs = getMaxDist(balls);
     myHud.flags[1] = true;
   }else if(myHud.flags[1] == true){
 
     drawPoints(closerObjs);
     drawPoints(farthestObjs);
   }
   for(Ball item: balls){
     item.display();
   }   
}

class Ball{
  int Xpos, Ypos, mySpeed, mySize, R, G, B;
  
  Ball(int _Xpos, int _Ypos, int _mySpeed, int _mySize){
    Xpos = _Xpos;
    Ypos = _Ypos;
    mySpeed = _mySpeed;
    mySize = _mySize;
    R = 255;
    G = 255;
    B = 255;
  }
  
  void display(){
    noStroke();
    fill(R,G,B);
    ellipse(Xpos, Ypos, mySize, mySize);
  }  
  
}


//////////
// hud ///
//////////
class Hud{
  int[] s= new int[2];
  int currentSecond,scoreX, scoreY;
  boolean[] flags = new boolean[3];
  
  Hud(){
      textAlign(CENTER);
      s[0] = 0;
      s[1] = 1;
      flags[0] = false;
      flags[1] = false;
      flags[2] = false;
      scoreX = scoreY = 25;
  }
  
  void timer(int iniTime){
    s[0] = frameCount;
    s[0] = ((s[0] * 16) / 1000) * s[1];
    s[1] = 1;
    currentSecond = (s[0] - (iniTime - 1));
    setScore(s[0] - (iniTime - 1));
    return;
  }
  
  void setScore(int myScore){
      
      textSize(30);
      fill(255, 255, 0);
      text(" " + myScore, scoreX, scoreY); 
      return;
  }
  void setScore(String _myScore, int _scoreX, int _scoreY){
      
      textSize(30);
      fill(255, 255, 0);
      text(" " + _myScore, _scoreX, _scoreY); 
      return;
    }  
}
/////////////////////////////////
//EXTERNAL FUNCTIONS
///-
int setTime(){
      return   ((frameCount * 16) / 1000);
    }
////
Ball[] getMinDist(Ball[] balls){
  //INITIATE VARS
  int X1, X2, Y1, Y2, i,j,min, minDist, tmpMinDist, totalLength = 0;
  Ball[] closerBalls = new Ball[2]; 
  minDist = 100;
  totalLength = balls.length;
  // ITERATE 
  for(i = 0; i < totalLength; i++){
    X1 = balls[i].Xpos;
    Y1 = balls[i].Ypos;
    for(j = 0; j < totalLength; j++){
      X2 = balls[j].Xpos;
      Y2 = balls[j].Ypos;
      //DISTANCE FORMULA
      tmpMinDist = (int)sqrt(pow((X2 - X1), 2) + pow((Y2 - Y1), 2));
      
      if((tmpMinDist < minDist) && (tmpMinDist != 0)){
        closerBalls[0] = balls[i];
        closerBalls[1] = balls[j];
        minDist = tmpMinDist; 
      }            
    }
  }  
  return closerBalls; 
}
//////
Ball[] getMaxDist(Ball[] balls){
  //INITIATE VARS
  int X1, X2, Y1, Y2, i,j,max, maxDist, tmpMaxDist, totalLength = 0;
  Ball[] farthestBalls = new Ball[2]; 
  maxDist = 1;
  totalLength = balls.length;
  // ITERATE 
  for(i = 0; i < totalLength; i++){
    X1 = balls[i].Xpos;
    Y1 = balls[i].Ypos;
    for(j = 0; j < totalLength; j++){
      X2 = balls[j].Xpos;
      Y2 = balls[j].Ypos;
      //DISTANCE FORMULA
      tmpMaxDist = (int)sqrt(pow((X2 - X1), 2) + pow((Y2 - Y1), 2));
      
      if((tmpMaxDist > maxDist) && (tmpMaxDist != 0)){
        farthestBalls[0] = balls[i];
        farthestBalls[1] = balls[j];
        maxDist = tmpMaxDist; 
      }            
    }
  }  
  return farthestBalls; 
}
//////
void drawPoints(Ball[] closerObjs){
  int X1, X2, Y1, Y2, dist;
  String myStr;
  Hud myHud = new Hud();
  X1 = closerObjs[0].Xpos;
  X2 = closerObjs[1].Xpos;
  Y1 = closerObjs[0].Ypos;
  Y2 = closerObjs[1].Ypos;
  //DISTANCE FORMULA
  dist = (int)sqrt(pow((X2 - X1), 2) + pow((Y2 - Y1), 2));
  myStr = "Dist: " + dist; 
  closerObjs[1].R = 255;
  closerObjs[0].R = 255;
  closerObjs[1].G = 0;
  closerObjs[0].G = 0;
  closerObjs[1].B = 0;
  closerObjs[0].B = 0;
  
  
  stroke(0);
  strokeWeight(2);
  line(X1, Y1, X2, Y2);
  
  myHud.setScore(myStr, X1 + (dist/2), Y2 + (dist/2));
  
}
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
