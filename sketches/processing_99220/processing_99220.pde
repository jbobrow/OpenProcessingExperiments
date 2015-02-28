
void setup(){size(400,400);
}

void circle(){
fill(255,255,255,100);
for (int i=10; i<400; i=i+10) {
if (i<400)
{
float p=random(255);
float s=random(255);
float o=random(255);
float w=random(255);
background(p,s,o,w);
}
}
}

void PTS(){size(400,400);
fill(255,255,255,200);
for (int i=10; i<400; i=i+10) {
if (i<400)
{
float r=random(400);
float m=random(400);
noStroke();
ellipse(r,m,10,10);
}
}
}

int y=0;
int speed=10;
void draw(){
 circle();
 PTS();
frameRate(14);
fill(255,255,255,180);
strokeWeight(4);
ellipse(200,200,y,y);
  y=y+speed;
  if((y<10)||(y>=400)){
  speed=speed*-1;
  }
}






