
PImage b;                  //maze pic
float x= 10;               //begining
float y= 10;               //begining
float angle1 = 0.0;        //angle
float segLength = 5;       //base

void setup(){
  size(800,450);          //window
 
}

void draw(){
  background(0);           //black
  b = loadImage("maze.gif");//loading pic
  image(b,0,0);            //cordinate
  
  float mx= constrain(mouseX, 50,200);    //making the mouse move
  float dx = mouseX - x;                  
  float dy = mouseY - y;                  
  angle1 = atan2(dy, dx);                 
  x = mouseX - (cos(angle1) * segLength); 
  y = mouseY - (sin(angle1) * segLength); 
  
  fill(0);                                //black
  ellipse(x,y,20,20);                     //circle
 
if(mouseX>704&&mouseX<789&&mouseY>238&&mouseY<294)//goal statement
  {  
  textSize(100);                          //size font
  text("GOAL!",200,250);                  //text
  }

if(mouseX>273&&mouseY>187&&mouseX<298&&mouseY<367)//dont cheat statement
  {
  textSize(100);                         //size font
  text("DONT CHEAT",90,150);             //text
  }
  
}

