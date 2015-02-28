
//Ashley Wong  amwong
//Copyright Pittsburgh 2012

float x, y, a, b;
void setup() 
{ 
  size(400, 400); 
  frameRate(20);
   background(240, 210, 175);
} 
//move mouse to change patterns 
void draw()
{
 stroke(random(25,50), random(20,55));
 fill(random (200), random(50,215), random(230,240), random (10,35));
 quad(x,y, mouseX+random(250),150, a,b, 200,mouseY+random(250));
 x= (x+random(400))%width;
 y= (y+random(400))%width*.5;
 a= (a+random(400))%width*.5;
 b= (b+random(400))%width;
  
}
//click mouse to clear screen
void mouseClicked() 
{
  background(240, 210, 175);
}

void mouseReleased() 
{ 
 stroke(random(25,50), random(10,35));
 fill(random (200), random(50,215), random(230,240), random (10,35));
 quad(random(300,400),mouseY, x,y, mouseX,random(300,400), a,b);
 x= (x-random(30))%width*.25;
 y= (y-random(50))%width*.5;
 a= (a-random(10))%width*.5;
 b= (b-random(20))%width*.25;
}
//drag mouse for more effects
void mouseDragged() 
{
  stroke(random(25,50), random(10,35));
 fill(random (175,210), random(220,260), random(160,190), random (10,35));
 quad(random(300,400),mouseY+random(50,75), x,y, mouseX-random(25,150),random(300,400), a,b);
 x= (x-random(30))%width*.25;
 y= (y-random(50))%width*.5;
 a= (a-random(10))%width*.5;
 b= (b-random(20))%width*.25;
  
}
