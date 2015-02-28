
void setup()
{background(400,400,400);
  size(500,300); 
  frameRate(30);

  }
void draw(){

for (int x=0; x<width+40; x=x+10);
  {
    for (int y=0; y<height+40; y=y+10)
    {
     

      strokeWeight(10);

    }
  }
  float a = random (0,1000);
  float b = random (0,1000);
  float c = random (0,2);
  stroke(#999999);
  strokeWeight(c);
  line(mouseX+a,mouseY+b,width-mouseX-b,height-mouseY-a);
}

