
PImage pic;
void setup ()
{
  size(600,600,P3D);
  pic=loadImage("me.jpg");
  imageMode(CENTER);
 
  
}

void draw()
{
  background(0);
  translate(width/2, height/2,-200);
  rotateZ(radians(frameCount*3));
  image(pic,0,0,100,100);
  

}


