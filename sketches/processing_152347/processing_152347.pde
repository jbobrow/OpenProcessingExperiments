
int xspacing = 16;
int w;
float theta =0.0;
float amplitude=75.0;
float period=300.0;
float dx;
float[] yvalues;
float posY=0.0;


void setup()
{
size(600,300);
w=width+16;
dx=(TWO_PI/period)*xspacing;
yvalues = new float[w/xspacing];
background(0);
frameRate(120);
}

void draw(){
background(0);
calcWave();
posY=3;
renderWave();
strokes();
}

void calcWave(){
theta+=0.02;
float x=theta;
for (int i=0;i<yvalues.length; i++){
  yvalues[i] = sin(x)*amplitude;
  x+=dx;
}
}

void renderWave(){
for (int x=0;x<yvalues.length;x++){
  fill(x,yvalues[x],random(x,255));
ellipse(x*xspacing, height/posY+yvalues[x], 5+x, 5+x);
}
}

void strokes(){
  for (int x=0;x<yvalues.length;x++){
  stroke(random(200,255),random(x),random(200,255));
line(x*xspacing, height/posY+yvalues[x], width/2, height);
 }
 }



