
void setup(){
size(640, 360); 
background(0); 
noStroke(); 
frameRate(1);
}
int gridSize = 40;
boolean on=true;
void draw(){
for (int x = gridSize; x <= width - gridSize; x += gridSize) {
  for (int y = gridSize; y <= height - gridSize; y += gridSize) {
    noStroke();
    fill(0,225,0);
     ellipse(x, y, 30, 30);
     fill(255);
     stroke(0);
     ellipse(x-10,y-1,10,10);
     ellipse(x+10,y-1,10,10);
     fill(random(0,255),random(0,255),random(0,255));
    ellipse(x,y+10,10,10);
  }
}
}


