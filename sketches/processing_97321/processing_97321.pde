
float x = 0;
float y = 0;
float w = 10;
float h = 10;

float[] a = new float[100];
float[] b = new float[100];
float[] c = new float[100];
float[] d = new float[100];

float size = 0;

int xdirection = 1;
int ydirection = 1;

void setup() {
  size(400,400);
  background(255,255,255);
  fill(250,0,0,10);
  noStroke();
}
void draw()
{
    background(random(0),random(0),random(90));
  rayo(mouseX,mouseY,size,size);
  if(mouseX >=200 && mouseY >= 200) 
  {
    for(int i=0;i < 100;i++)  
    {
         fill(40,0,0);
    }
    size = size+20;
  }
  if(mouseX<=200 && mouseY<=200) 
  {
    size = 50;
    fill(250,60,random(75));
  }
 
  if (key==' ')
  {
  stroke(255);
  }
  if (key=='1') 
  {
    stroke(70,100,40);
    strokeWeight(2);
  }
  if (key=='2')
  {
    stroke(70,50,100);
    strokeWeight(4);
  }
}
void rayo(float x,float y,float w,float h) {
  beginShape(POLYGON);
  vertex(x+w/2,y/2);
  vertex(x+w,y+h/4);
  vertex(x+w/2,y+h/2);
  vertex(x+w,y+3*h/4);
  vertex(x+w/2,y+h);
  vertex(x+3*w/4,y+3*h/4);
  vertex(x+w/4,y+h/2);
  vertex(x+3*w/4,y+h/4);
  vertex(x+w/4,y);
  endShape();
}



