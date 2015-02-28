


//position net over butterfly and then press any key to collect
//counter at top left keeps your score


Butterfly sButterfly;
//DATA
float x;
float y;
float cx;
int cy;
float tx;
float ty;

float d;
float speed;
  PImage img;
  PImage bg;
  PImage net;
  
PFont f = createFont("Monospaced-48", 96, true);
int butterflies = 0;


void setup(){
  size(1024, 768,"processing.core.PGraphicsRetina2D");
  noStroke();
  smooth();
 
 img = loadImage("butterflyRight.png");
  bg = loadImage("bluesky.jpg");
  speed=3;
  //step 2: initialize the object
 sButterfly= new Butterfly(200);
   
}

void draw(){
  background(bg);
    sButterfly.drawButterfly();
  sButterfly.moveButterfly(speed);
  sButterfly.bounceButterfly();
  sButterfly.repelButterfly();
  sButterfly.loadNet();
println(tx,ty,x,y);   
textFont(f);  //Set the font
fill(#ffffff);  // Set the forground color white
text(butterflies, 50, 80);
}

 void keyPressed(){
   if (dist(tx,ty,x,y)<100){
    x=-500;
    y=-500;
butterflies += 1;
cy=700;
cx=random(0,1000);}
  }
  





//name of class
class Butterfly{
  //variables 
  float d;

///CONSTRUCTOR
Butterfly(int tempY){
  x=random(0,1000);
  y=tempY;
d=dist(mouseX,mouseY,x,y);
}

//FUNCTIONS
void drawButterfly(){
    image(img, x, y, random(50,100),70);
}


void moveButterfly(float speed){
    //change the value of x
  x=x+speed;
}
  
void bounceButterfly(){
   if (x>1000){
   speed = speed*-1;
   img = loadImage("butterfly.png");
    x=1000;
  }
    
   if(x<25){
    speed = speed*-1;
    img = loadImage("butterflyRight.png");
    x=25;
  }
  
     if (y>700){
     y=700;
     speed = speed*-1;
     }
     if(y<68){
     y=68;
    speed = speed*-1;

  }
}

void repelButterfly(){
  d=dist(mouseX,mouseY,x,y);
  //run away code
  if(d<100){
      if(x<mouseX){
          x=x-10;
      }
  if(y>mouseY){
    y=y+10;
  }
  if(y<mouseY){
    y=y-10;
  }
    if(x>mouseX){
    x=x+10;
  }
  }
}

void loadNet(){
  if(mouseX>500){ 
  net=loadImage("netR.png");
  image(net,cx,cy,300,300);
  tint(255, 200);
  fill(255,0,0);
  tx=cx+270;
  ty=cy+90;

  } else {
      net=loadImage("netL.png");
  image(net,cx,cy,300,300);
  tint(255, 200); 
  fill(255,0,0);
  tx=cx+10;
  ty=cy+90;
  }
  
    if(cy>mouseY){
    cy=cy-5;
  }
  
  if(cy<mouseY){
    cy=cy+5;
  }
    if(cx>mouseX){
    cx=cx-5;
  
  }
  
  if(cx<mouseX){
    cx=cx+5;
  }
  }
}



