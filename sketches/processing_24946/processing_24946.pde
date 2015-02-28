
float x = 1.0;
float c=255;
float c1=255;
float c2=255;

void setup(){
  size (300,300);
  strokeWeight (.5);
  smooth ();
  background(0);
   
}
void draw (){
  stroke (c,c1,c2, 20);

  line( x,mouseX, mouseX, mouseY);
}

void mousePressed()
{
  x=0;
  c=random(255);
  c1=random(255);
  c2=random(255);
}

void keyPressed()
{
  background(0);
}
     
                                                                
