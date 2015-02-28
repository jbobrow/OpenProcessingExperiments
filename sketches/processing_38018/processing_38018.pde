
void setup() {
  size(500,500);
  background(255,255,255, 10);
  fill(255,255,255);
  smooth();

}
int cx=1;
int cy=1;

void draw(){
  background(255,255,255);
  fill(0,0,0,10);
  stroke(0,0,0,10);
  float PosX, PosY;
  int objSize = 20;
  int objspread = 20;
  int i, f;
  for (i=0;i<width;i=i+objspread){
    for (f=0;f<=height; f=f+objspread){
      PosX = cx + random(mouseX/100)+i/cx;
      PosY = cy + random(mouseX/100)
      +f/cy;
      fill(random(0,mouseX/10), random(0,mouseX), random(0,10));
      beginShape();
      vertex (random(PosX+10, mouseX),PosY);
      vertex (PosX,random(PosY, mouseX));
       vertex (PosX,PosY+10);
       endShape();
    
    }
  }

}


