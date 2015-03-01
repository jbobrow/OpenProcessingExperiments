
PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
float rect1X;
float rect1Y;
float rect1W;
float rect1H;
float rect2X;
float rect2Y;
float rect2W;
float rect2H;
float rect3X;
float rect3Y;
float rect3W;
float rect3H;
float rect4X;
float rect4Y;
float rect4W;
float rect4H;
float rect5X;
float rect5Y;
float rect5W;
float rect5H;



void setup() {
  size(1080, 647);
  noSmooth();
  fill(126);
  img=loadImage("back.jpg");
  img1=loadImage("bird.png");
  img2=loadImage("car.png");
  img3=loadImage("plane.png");
   img4=loadImage("Squirrel.png");
   img5=loadImage("plant.png");
  background(img);
 
  
rect1X=100;
rect1Y=580;
rect1W=70;
rect1H=40;
rect2X=200;
rect2Y=580;
rect2W=70;
rect2H=40;
rect3X=300;
rect3Y=580;
rect3W=70;
rect3H=40;
rect4X=400;
rect4Y=580;
rect4W=70;
rect4H=40;
rect5X=500;
rect5Y=580;
rect5W=70;
rect5H=40;

}
void draw() {

  fill(255);
  rectMode(CENTER);
  rect(rect1X,rect1Y,70,40);
  
  fill(255);
  rectMode(CENTER);
  rect(rect2X,rect2Y,70,40);
  
  fill(255);
  rectMode(CENTER);
  rect(rect3X,rect3Y,70,40);
  
  fill(255);
  rectMode(CENTER);
  rect(rect4X,rect4Y,70,40);

fill(255);
  rectMode(CENTER);
  rect(rect5X,rect5Y,70,40);

}
 

void mousePressed(){
  
   
if(mouseX>(rect1X-rect1W/2)&&
  mouseX<(rect1X+rect1W/2)&&
  mouseY>(rect1Y-rect1H/2)&&
  mouseY<(rect1Y+rect1H/2)){
    
  image(img1,60,100,75,85);
  }
  
if(mouseX>(rect2X-rect2W/2)&&
  mouseX<(rect2X+rect2W/2)&&
  mouseY>(rect2Y-rect2H/2)&&
  mouseY<(rect2Y+rect2H/2)){
    
  image(img2,250,430,100,125);
  }  
 
 

   if(mouseX>(rect3X-rect3W/2)&&
  mouseX<(rect3X+rect3W/2)&&
  mouseY>(rect3Y-rect3H/2)&&
  mouseY<(rect3Y+rect3H/2)){
   image(img3,600,60,100,125);
  }
  
   if(mouseX>(rect4X-rect4W/2)&&
  mouseX<(rect4X+rect4W/2)&&
  mouseY>(rect4Y-rect4H/2)&&
  mouseY<(rect4Y+rect4H/2)){
   image(img4,800,540,60,80);
  }
  
 if(mouseX>(rect5X-rect5W/2)&&
  mouseX<(rect5X+rect5W/2)&&
  mouseY>(rect5Y-rect5H/2)&&
  mouseY<(rect5Y+rect5H/2)){
   image(img5,400,480,60,80);
  } 
}




