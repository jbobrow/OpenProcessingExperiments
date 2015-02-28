
void setup(){
  size(600,600);
  background(50);
}

void draw (){
int r = 204;
int g = 204;
int b = 204;

if (mouseY > 300) {
  r= 204;
  g= 0;
  b= 0;
}

noStroke();
fill(r,g,b);
rect (30,30,550,40);
fill(r+30,g+60,b+70);
rect (30,90,550,40);
fill (r+60,g+70,b+80);
rect (30,150,550,40);
fill (r+80,g+90,b+100);
rect (30,210,550,40);
fill (r+90,g+100,b+110);
rect (30,270,550,40);
fill (r+100,g+110,b+120);
rect (30,330,550,40);
fill (r+120,g+140,b+160);
rect (30,390,550,40);
fill (r+180,g+170,b+190);
rect (30,450,550,40);
fill (r+200,g+210,b+220);
rect (30,510,550,40);
}







