
//Processing Universe
float cx;
float cy;
float cd;
float rx;
float ry;
int constant=1;

void setup()
{
  size(640,360);
  colorMode(RGB);
  frameRate(60);
}

void draw()
{
noStroke();
if(constant==1)
{rx=rx+1;ry=ry+1;}
    
fill(0,255,0,10);
rect(0,0,width,height);
fill(255);
rBorderTop();
fill(255,255,255);
circle(random(640),random(360),random(50));
circle(random(640),random(360),random(100));
eCircle(width/3,75,100);
eCircle(width/3*2-4,236,100);
fill(0,255,0);
extra();
}

void circle(float cx, float cy, float cd)
{ellipse(cx,cy,cd,cd);}

void eCircle(float cx, float cy, float cd)
{ellipse(cx,cy,cd,cd); fill(0,255,0);
ellipse(cx,cy,cd*0.7,cd*0.7);}

void rBorderTop()
{
  beginShape();
  vertex(0,0);
  vertex(width,0);
  vertex(width,height/2);
  vertex(width/5*4,height/2);
  vertex(width/3*2, height/10*9);
  vertex(width/3,height/10);
  vertex(width/5, height/2);
  vertex(0,height/2);
  vertex(0,0);
  endShape();
}

void extra()
{
  rect(20,20,100,100);
  stroke(255);
  line(width/3*2-4,0,width/3*2-4,height/10*9);
  fill(255);
  rect(371,height/2,50,60);
  point(5,5);
  fill(0,255,0);
  beginShape();
  vertex(250,20);
  vertex(421,height/2+60);
  vertex(421,160);
  vertex(610,20);
  endShape();
  rect(540,100,100,50);
}
