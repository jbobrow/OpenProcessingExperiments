

void setup(){
size(250, 250);
background(255);
smooth();
frameRate(3);
}

int x=0; //repeat itself
void draw()
{
  
x=x+5;
if(x>89){x=0;} //repeats throughout
ellipse (0, 50, 90, 100);
stroke(15, 22, 32, 28);
line(0, 20, 250, 20);
stroke(181, 74, 92, 204);
line(0, 40, 250, 40);
line(0, 53, 250, 53);
line(0, 67, 250, 67);
line(0, 83, 250, 83);
stroke(11, 54, 50, 70);
line(0, 210, 250, 210);
line(0, 235, 250, 235);
strokeWeight(2);
line(0, 12, 250, 12);
line(0, 174, 250, 174);
stroke(11, 72, 0, 15);
line(0, 210, 250, 210);
line(0, 34, 250, 34);
line(0, 85, 250, 85);
stroke(181, 74, 92, 255);
line(0, 93, 250, 93);
strokeWeight(7);stroke(181, 74, 92, 265);
line(0, 120, 250, 120);

fill(5, 8, 33);
}



