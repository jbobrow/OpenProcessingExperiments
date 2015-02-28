

void setup() {
  size(500,700);
}

void draw() 
{
  background (256,256,256);
 
  //random ball
  frameRate(3);
  noStroke();
fill(random (0,255));
  ellipse(random(width),random(height),80,80); 

 
  //Font

fill(250,0,0);
createFont("Segoe Script Bold", 300);
  strokeWeight(50);
  textSize(80);
  text("LOVE",0,550);
 text("BALLOON",0,650);
  
  
  //photo
  PImage Balloon;
  Balloon = loadImage("red-b.jpg");
  image(Balloon,mouseX,mouseY,200,350);
  
}

