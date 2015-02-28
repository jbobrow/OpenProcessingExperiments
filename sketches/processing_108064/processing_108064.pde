
// weight/pull the curve
float w=5;

void setup()
{
  size(500,500);
  frameRate(30);
  background(0,0,0,255);
}
void draw() {
  fill(0,0,0,10);
  rect(0,0,width,height);
  float d = random(20,60);
  fill(random(255),random(255),random(255));
  yinyang(random(width), random(height),d);
}
void yinyang(float x, float y, float d){
  


  //bottom
  float x1=x;
  float y1=y;
  float x2=x;
  float y2=y+d/2;
  float cx1=x+w;
  float cy1=y1;
  float cx2=x+w;
  float cy2=y2;
  stroke(0);
 bezier(x1,y1,cx1,cy1,cx2,cy2,x2,y2); 
 
 
   //top
  //x1,y1,x2,cy1 left unchanged
  y2=y-d/2;
  cx1=x-w;
  cx2=x-w;
  cy2=y2;
  stroke(0);
  bezier(x1,y1,cx1,cy1,cx2,cy2,x2,y2);
}
void mouseReleased() {
}


void keyPressed(){
 println ("entered keypressed:" + keyCode);
  if(keyCode == RIGHT) {
    w++;
  } else if (keyCode == LEFT){
    w--;
  }
}


