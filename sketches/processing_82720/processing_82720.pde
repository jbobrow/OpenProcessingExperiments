
PImage img;
PImage img2;
float step;
float angle;

void setup() 
{ 
  size(500,400);
  frameRate(60);
  img2 = loadImage("time.gif");
  img  = loadImage("clock.gif"); 
  step = 1; 
} 

void draw(){ 
  image(img2,0,0);
  angle = angle+0.2/step; 
  
  translate(278,179);
  rotate(angle); 
  image(img, -img.width/2, -img.height/2);
  
  step = step*1.03; 
  if (step > 100){
  } 
} 
 
void mousePressed(){ 
  step = 10; 
}

