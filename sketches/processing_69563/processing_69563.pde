
int x=0;
int y=0;
void setup () {
size (800,600);
smooth();
fill (0);
background (0);

}
void draw () {
  background (0);
fill(9,4,185);
rect (x+45,y+25,15,25);
fill(178,247,20);
rect (x+20,y+2,70,25);

fill (20,215,247);
ellipse(x+40,y+15,25,25);
fill (247,183,20);
ellipse (x+40,y+15,15,15);
ellipse (x+70,y+15,25,25);
ellipse(x+70,y+15,15,15);
rect (x+60,y+65,10,25);
rect(x+45,y+65,15,10);
ellipse(x+65,y+90,15,15);
rect(x+90,y+65,15,10);
rect (x+105,y+65,10,25);
ellipse (x+110,y+90,15,15);
rect (x+20,y+60,10,10);
ellipse (x+20,y+70,10,10);
if(y<height-90) {
x=x+1;
y=y+1;
}
 
}
