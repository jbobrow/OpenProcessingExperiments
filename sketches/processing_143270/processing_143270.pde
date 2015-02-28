
// SOS iDesign
// KU DYNAMIC MEDIA
// David Mrugala

float x; float y;
float a=100;
float b=300;
float angle;
float direction=1;

void setup()
{
  size(600,600);
  background(0);
  smooth();
  colorMode(RGB,TWO_PI,width,height);
}

void draw()
{
  translate(x,y); // change the coordinate system of sketch window to x,y
  scale(mouseX/100,mouseX/100);
  rotate(direction*angle);
  noFill();
  stroke(angle*10,x,y);
  bezier(-width*2,0,-a,b,a,b,+width*2,0);
  bezier(0,-height*2,-a,b,a,b,0,+height*2);
  
  angle += TWO_PI/50; // rotation angle divided by 50 frames
  
  // after 50 frames execute following code
  if (frameCount>50){
    x=random(width);
    y=random(height);
    frameCount=0;
    strokeWeight(random(10));
    direction=random(-1,+1);
  }
}
  
  
