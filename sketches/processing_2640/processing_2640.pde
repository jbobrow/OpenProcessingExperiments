
int speed=5;
int num=100;
class Ring {
float xpos,ypos,diameter,xoff,yoff,dir;
Ring() {
 diameter=0;
 xoff=random(500);
 yoff=random(500);
 dir=1;
}
void update() {
  diameter+=dir;
  if(diameter>10 || diameter<1) { dir*=-1; }
  xoff+=0.01;
  yoff+=0.01;
  xpos=noise(xoff)*width;
  ypos=noise(yoff)*height;
  noFill();
  strokeWeight(4);
  stroke(#BF68B5,200);
  ellipse(xpos,ypos,diameter,diameter); 
  }
}
Ring[] field=new Ring[1000];

void setup() {
 size(screen.width,screen.height); 
 smooth();
 for(int z=0;z<num;z++) field[z]=new Ring();
}
void draw() {
  smooth();
  fill(0,12);
  rect(0,0,width,height);
  for (int i=0;i <num;i++) field[i].update();
 }



