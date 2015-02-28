
// SOS iDesign
// KU DYNAMIC MEDIA
// David Mrugala

float x=320;
float y=240;
float xSpeed=5;
float ySpeed=2;
float r=250; // Set the radius for the ellipse
float c;

void setup()
{
  size(640,480);
  background(170);
}

void draw()
{
  noStroke();
  fill(170,100);
  rect(0,0,width,height);
  
  // ellipse
  stroke(0);
  strokeWeight(15);
  fill(0,c,c,50);
  ellipse(x,y,r,r);
  
  // switches between following the mouse or based on set speed
  if(mousePressed){
    x = lerp (x, mouseX, 0.1);
    y = lerp (y, mouseY, 0.1);
  }
  else{
    x=x+xSpeed;
    y=y+ySpeed;
  }
  
  // constrains the ellipse to the window width and height additing the strokeWeight
  if ((x<0+r/2+15/2) || (x>width-r/2-15/2)){
    xSpeed = xSpeed * -1;
    c=random(255);
  }
  if ((y<0+r/2+15/2) || (y>height-r/2-15/2)){
    ySpeed = ySpeed * -1;
    c=random(255);
  }
}
    
    
  
