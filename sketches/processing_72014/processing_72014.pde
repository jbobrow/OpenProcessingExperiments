
//Stanley L, CP1, block 6
PImage a;
int x=0;
void setup()
{
  size(612,300);
a = loadImage("http://images2.fanpop.com/images/photos/8100000/Pinocchio-disney-8101953-612-300.jpg?1349124189604");
noStroke();
fill(211,211,134);

}
void draw()
{
  image(a,0,0,612,300);
  arc(275,142,22,22,PI/2,3*PI/2);
quad(274,130,300+x,129,300+x,150,275,153);
arc(300+x,139,22,22,-PI/2,PI/2);
x=x+int (random(-5,6));
{
 if (x>500)
  x=x+int (random(-4,0));
  
}
}
