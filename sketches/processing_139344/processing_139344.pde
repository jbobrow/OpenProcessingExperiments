
float c = 0;
int i = 200;
void setup(){
  size(500,500);
  smooth();
  frameRate(5);
}

void draw(){
  background(10,80,100);
  drawPattern(width/3,height/3,2*height/3,0);
}


void drawPattern(int x, int y, int radius,int c){
  
  fill(4*c);
  stroke(0);
  ellipse(x,y,radius,radius);
  fill(4*c+50);
  rect(x,y,radius,radius/2);
  if (radius > 2) {
    drawPattern(x+radius/2,y,radius/2,c+10);
    drawPattern(x,y+radius/2,radius/2,c+10);
    
  }
  i=i-radius/2;
  if(i<2){
    i=200;
  }
}


