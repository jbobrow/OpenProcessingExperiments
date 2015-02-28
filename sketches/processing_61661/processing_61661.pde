
//kirby
int xpos = 300;
int ypos = 300;
float angle;
//Projectiles- properties
int power;
PVector position;
PVector velocity;
PVector acceleration;

//game 
int consecShots = 0;
int shots = 0;
boolean miss = false; 
boolean a = false;  //use ice
boolean s = false; //use fire
boolean shoots = false;
boolean startGame = false;
boolean bounce = false;
int counter = 0;
int actualTime;
int curTime = 0;
int counter2 = 0;
int totScore;
int score;
int time = 90;

//screen
float[] x;
float[] y;
int h = 500;
int w= 700;
//Pfont font;

//images
PImage kirby;
PImage blueKirby;
PImage redKirby;
PImage hoop;
int ballradius;
int ballradius2;
int ballradius3;
int hoopwidth;


void setup(){
  size(w,h);
  //font = loadFont();
  frameRate(60);
  angle = angularKirby();
  redKirby = loadImage("redKirby.jpg");
  blueKirby = loadImage("bluKirby.jpg");
  kirby = loadImage("regKirby.jpg");
  hoop = loadImage("newHoop.gif");
  
  position = new PVector(xpos, ypos);
  velocity = new PVector(-5,-5);
  //velocity = new PVector(-cos(angularKirby()),-sin(angularKirby()));
  //velocity = new PVector(-angularKirby(),-angularKirby()); 
  acceleration = new PVector(0,0.3); 
  ballradius = kirby.height/2;
  ballradius2 = redKirby.height/2;
  ballradius3 = blueKirby.height/2;
  hoopwidth = hoop.width;

}  
void draw(){
  
  if(!startGame){
      background(0);
      //textFont(font);
      textAlign(CENTER);
      text("Press space to start!", width/2, height/2);
  }
  else {
      background(255);
      
      image(kirby, position.x, position.y); 
      image(hoop, 0, 75);   
      
      actualTime = (int)(counter/frameRate);  
      if(actualTime == time){
        startGame = false;
        counter = 0;
        textAlign(CENTER);
        text("Game Over! Press Space to start up again!", width/2, height/2);
      }
      
      if(a == true && consecShots == 5){
        
        image(blueKirby, position.x, position.y);
        counter--;
        if(curTime == 30){
           a = false; 
        }
        curTime = (int)(counter2/frameRate);
        counter2++;
      }
      if(s == true && consecShots == 5){
        image(redKirby, position.x, position.y);
        curTime = (int)(counter2/frameRate);
        if(curTime == 20){
          s = false;
        }
        counter2++;
        totScore += score*2;
      }
      if(!shoots){
        line(position.x + ballradius, position.y + ballradius,mouseX,mouseY);
        //angularKirby();
      }else{
        movement();

       }
      if ( position.y + ballradius >= h || 
            position.y + ballradius2 >= h||
            position.y + ballradius3 >= h) {
          resetShot();
      }
      if ( position.x + ballradius >= w||
             position.x + ballradius2 >= w||
             position.x + ballradius3 >= w) {
          velocity.x = -velocity.x;
          bounce = true;
      }
      if ( position.x - ballradius <= 0 ||
              position.x - ballradius2 <= 0 ||
              position.x - ballradius3 <= 0) {
          velocity.x = -velocity.x;
          bounce = true;
      }
      if (bounce == true && position.y + ballradius <= 0 || 
                position.y + ballradius2 <= 0 ||
                position.y + ballradius3 <= 0){
                  resetShot();
                  bounce = false;
      }
      counter++;
   }  
}
void keyPressed(){
  if (!startGame) {
     if (keyCode == 32) {
       startGame = true;
     }  
  }
  if(consecShots == 5){
    if(key == 'a'){
      freeze();
      consecShots = 0;
    }
    if(key == 's'){
      fire();
      consecShots = 0;
    }
  }
}
void mouseClicked(){
  if(startGame){
    image(kirby, position.x,position.y); 
    shoot(); 
    shoots = true;  
  }
}
//30 seconds
void freeze(){
  
  a = true;
    
}
//20 seconds
void fire(){
  
  s = true;
}
void shoot(){
    velocity.add(acceleration);
    position.add(velocity);
}
void movement(){
      
  //acceleration = new PVector(0, 0.01);
    velocity.add(acceleration);
    position.add(velocity);
}
boolean isIn(){
  if((hoop.width/3 <position.x &&position.x < hoop.width) && 
    position.y == hoop.height/3){  
      return true;
  }
  return false;
}
void resetShot(){
   position.x = hoopwidth + (int)random((350));
   position.y = hoopwidth + (int)random((350));
   shoots = false;
  //velocity = new PVector(angularKirby(),-angularKirby());
  velocity = new PVector(-5,-5);
  //velocity = new PVector(-cos(angularKirby()),-sin(angularKirby())); 
  acceleration = new PVector(0,0.3); 
}
void score(){
   
  if(isIn()){
    score = 40; 
    totScore += score;   
   }
}
float distance(){
  position = new PVector(300,300);
  float x2 = mouseX;
  float y2 = mouseY;
  float x1 = (float)(position.x);
  float y1 = (float)(position.y);
  float disX = x2 - x1;
  float disY = y2 - y1;
  return (float)Math.sqrt(Math.pow(disX, 2) + Math.pow(disY, 2));
}
float angularKirby(){
  angle = atan(distance());
  return angle;
}





