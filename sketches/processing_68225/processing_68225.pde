
float x=QUARTER_PI;
float y=TWO_PI-QUARTER_PI;

void setup(){
//background(255);
size(400,400);
}

void draw(){
  frameRate(4);
background(255);
smooth();
fill(240,240,0);
//noFill();

stroke(255,255,0);
strokeWeight(3);
arc(200,100,160,160,x,y);
stroke(0,0,0);
fill(0,0,0);
arc(170,68,25,25,0,TWO_PI);

if(x==QUARTER_PI)
{
  x=0;
  y=TWO_PI;
}
else
{
  x=QUARTER_PI;
y=TWO_PI-QUARTER_PI;
}
//x=x+.01;
//y=y+.02;
}


