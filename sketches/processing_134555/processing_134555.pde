
void setup () {
  size (300,300);
}


void draw () {
  background (125);
bezier (32,20,90,5,80,75,100,175);
bezier (100,175,120,285,200,275,170,200);
bezier (170,200,150,150,100,200,110,240);
bezier (110,240,120,270,179,212,170,220);
bezier (170,220,200,150,300,110,280,70);
noFill();
strokeWeight (3);
}


