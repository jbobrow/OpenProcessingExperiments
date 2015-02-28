
int i = 0;
boolean pressed = false;

void setup()
{
size(400,400);
smooth();
strokeWeight(2);
frameRate(3);
}


void draw()
{



  line(i,0,400,i);
  line(0,i,i,400);
  line(400-i,0,0,i);
  line(400,i,400-i,400);

 i+=10;
 if (i>400)
 {
   i=0;
   background(255);
 }

}

