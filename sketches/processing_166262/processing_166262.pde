
PImage cloud1;
PImage cloud2;
PImage cloud3;
PImage cloud4;
PImage lightning;
PImage bunny;
PImage pit1;
PImage pit2;
PImage pit3;
PImage pit4;
PImage frank;
PImage why;

int x = 560;
int dx = 1;

int y = 260;
int dy = 1;
int by = 1;

int f = 380;
int df = 1;

int time;
int start = 0;
int wait1 = 5000;
int wait2 = 5500;
int invert = 7000;
int newbackground = 8000;
int zoom = 9000;
int starttext = 18000;

void setup()
{
  size(600, 400);
  cloud1=loadImage("cloud1.png");
  cloud2=loadImage("cloud2.png");
  cloud3=loadImage("cloud3.png");
  cloud4=loadImage("cloud4.png");
  lightning=loadImage("lightning.png");
  bunny=loadImage("bunny.png");
  pit1=loadImage("pit1.png");
  pit2=loadImage("pit2.png");
  pit3=loadImage("pitzoom.png");
  pit4=loadImage("pitzoom2.png");
  frank=loadImage("Frank.png");
  why=loadImage("why.png");
}
 
void draw()
{
 //background in chronological order
  
  //ground
  if(millis() >= start){
    fill(69, 147, 39);
    rect(0, 250, 600, 200);
    
    image(pit1, 290, 295);
    
    
    //sky
    fill(111, 215, 234);
    rect(0, 0, 600, 250);
  }
  
     //bunny
    if((millis() >= start) && (millis() <= wait1)){
    image(bunny, x, y);
    x = x + dx;
    if(x > 330){
      dx = -1;
    }
    if(x < 317){
      dx = 0;
    }
    y = y + dy;
    if(y >= 260){
      dy = -1;
    }
    if(y <= 250){
      dy = 1;
    }
    if((y >= 260) && (x <= 317)){
      dy = 1;
    }
   }
   
  //foreground
  if(x < 317){
  noStroke();
  fill(69, 147, 39);
  rect(0, 300, 600, 200);
  
  image(pit2, 290, 300);
  
  
  }
     
  
  //gray sky
  if(millis() >= wait1){
    fill(89, 96, 98);
    rect(0, 0, 600, 250);
  }
    
   //clouds and lightning
   if(millis() >= wait2 ){
    image(cloud1, 40, 30);
   
   if(millis() >= (wait2 + 500)){ 
    image(cloud2, 50, 115);
    image(cloud4, 500, 112);
   }
    
    //lightning bolt
    if(millis() >= (wait2 + 700)){
    image(lightning, 330, random(50, 56));
    image(cloud3, 300, 30);
    }
   } 
   
   //invert sky
   if(millis() >= invert){
     filter(INVERT);
   }
   
   //all white background
   if(millis() >= newbackground){
     fill(255);
     rect(0, 0, 600, 400);
     
     image(pit1, 290, 295);
   }
   
   //zoom in 
   if(millis() >= zoom){
     image(pit3, 150, 290);
   } 
   
   //frank
   if(millis() >= zoom){
     image(frank, 175, f);
     f = f - df;
     if(f >= 380){
      df = 1;
     }
     if(f <= 10){
      df = 0;
     }
   }   
   
   if(millis() >= zoom){
     fill(255);
     rect(0, 307, 600, 100); 
     image(pit4, 150, 307); 
   }
   
  
}
  




