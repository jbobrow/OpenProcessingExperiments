
// SOS iDesign
// KU DYNAMIC MEDIA
// David Mrugala
 
float x=160;
float y=160;
float xSpeed=4;
float ySpeed=2;
float r=150; // Set the radius for the ellipse
float angle;
PFont font;
 
void setup()
{
  size(640,320);
  background(#325A7D);
  font = loadFont("Verdana-100.vlw");
}
 
void draw()
{
  noStroke();
  fill(#325A7D,100);
  rect(0,0,width,height); 
   
  // ellipse with text
  pushMatrix();
  translate(x,y);
  rotate(angle);
  noStroke();
  fill(255);
  ellipse(0,0,r,r);
  textAlign(CENTER,CENTER);
  textSize(65);
  fill(#325A7D);
  text("SOS",0,0);
  popMatrix();
  
  x=x+xSpeed;
  y=y+ySpeed;
  
  angle+=0.01;
    
  // constrains the ellipse to the window width and height additing the strokeWeight
  if ((x<0+r/2) || (x>width-r/2)){
    xSpeed = xSpeed * -1;
  }
  if ((y<0+r/2) || (y>height-r/2)){
    ySpeed = ySpeed * -1;
  }
}
