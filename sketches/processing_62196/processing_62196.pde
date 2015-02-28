

void setup()
{ 
  size(400, 400);
  background(0, 0, 25);
  smooth();
  frameRate(60);
  noStroke();
} 


void draw() 
{ 
  fill( 0, random(255),random(255),90);
  ellipse(mouseX, mouseY, 50, 50 );
  {textAlign(CENTER);
  text("Water!" ,200,200);
  fill(255,255,255);
  textSize(36);}
}
 

