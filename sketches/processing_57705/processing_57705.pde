
//Welcome to the Black Hole:


//Move your mouse around for color change



//I ended up looking at a bunch of tutorials and examples to achieve these effects






ArrayList plist = new ArrayList();
int MAX = 50;

PImage myImage;

int x;
int y;

int sizeEllipse=1;
float coord1=57;
float coord2=101;
float strokeSize=1;
int colorNum=0;
int circleNum=350;
int trans=100;
boolean blah=true;
color[] palette=new color[3];
 

int b= 140;

float o = 1200;
int w= 1;


void setup() {
  size(700,700);
  myImage = loadImage("Blackhole.jpg");
  background(30);
  frameRate(120);
}




void draw() {
 
  x = mouseX;
  y = mouseY;
  
  tint(x,y,200,20);
  image(myImage,0,0,width,height); 
  
  


fill(20,20);
noStroke();
float speed = dist(pmouseX,pmouseY, mouseX,mouseY);
  
fill(random(40,180), random(0,25), random(0,55),25);
  
triangle (mouseX,mouseY, 325, 350,375,350);
  
  
  
  
  stroke(50);
  ellipse(width/2, height/2, o, o);
  stroke(4);
  ellipse(width/2, height/2, o-20, o-2);
  stroke(4);
  ellipse(width/2, height/2, o-2, o-20);
   
  if (2>o){
    o = 1000;
  } else{
    o-=20;
  }
  
  
  
  if(circleNum>1){
      circleNum--;
      colorNum=int(random(palette.length));
      stroke(palette[colorNum],trans);
      noFill();
      strokeWeight(2);
      ellipse(width/2,height/2,sizeEllipse,sizeEllipse);
      sizeEllipse+=3;
      if(sizeEllipse>125)
          ellipse(width/2,height/2,sizeEllipse-125,sizeEllipse-125);
      if(sizeEllipse>250)
          ellipse(width/2,height/2,sizeEllipse-250,sizeEllipse-250);
      if(sizeEllipse>375)
          ellipse(width/2,height/2,sizeEllipse-375,sizeEllipse-375);
      fill(#FFFFFF,random(255),50,40);
      noStroke();
      
    }
    else{
      circleNum=350;
      sizeEllipse=1;
    }
  
}
  
  
  
  













