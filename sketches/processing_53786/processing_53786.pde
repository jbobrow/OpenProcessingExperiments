

void setup()
{
  size(600,600);
  background(0,0,0);
  frameRate(200);
}

 void draw()
 { 
   noStroke();
   fill(250,0,0);
   rect(250+random(-500,500),250+random(-500,500),30,30);
 }

