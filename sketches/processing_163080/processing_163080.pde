
PImage img;
float a =.05;
void setup()
{ 
  size(1400,300);
  frameRate(40);
}

void draw()
{
  
  img = loadImage("LogoFINAL1-04.png");
  img.resize(200,200);  
  translate(width/6 ,height/2 );
  rotate(a);
  background(255);
  imageMode(CENTER);
  
  image(img,0,0);
 
  
  
  a-=.06;
}


