
void setup() {
  
  
size(500,350);
noStroke();
frameRate(100);
}

int x=0;

void draw()
{
x=x+1; 
if (x>700){x=0;}
background(99,96,65);

ellipse(x,150,250,250);
fill (255);
ellipse(x,100,20,20);
fill (0);


}


