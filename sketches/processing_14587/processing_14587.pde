
PImage face;
void setup()  {
  size(300,300);
  println(face);
  face=loadImage("face.jpg");
  }

void draw(){

  scale(0.15);
  background(255);
  for(int x=0; x<=1000; x=x+250)  {
    for(int y=0; y<=1000; y=y+250)  {
      pushMatrix();
      translate(x+x,y+y);
      rotate(radians(frameCount+3));
      image(face,-10,-10);
      popMatrix();
    }
  }

}

