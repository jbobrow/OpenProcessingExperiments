
float x,y;
int i,N;

void setup(){
   size(500,500);
   fill(0,255,255);
   N=1;
}

void draw(){
  background(0,0,0);

  x=mouseX;
  y=mouseY;
  
  for (i=0;i<N;i++) {
    ellipse(x+i*30,y+i*30,30,30);
  }
  
}

void mouseClicked() {
  increaseEllipse();
}

void increaseEllipse() {
  N++;
}
