
void setup (){
size(640, 360); 
background(0); 
noStroke(); 
}

int gridSize = 60;


void draw () {
for (int x = gridSize; x <= width - gridSize; x += gridSize) {
  for (int y = gridSize; y <= height - gridSize; y += gridSize) {
    noStroke();
    fill(random(15,25), random(170,255), random(0,200));
    ellipse(x,y-27,22,22);
    ellipse(x-12, y-10, 22, 22);
    ellipse(x+12, y-10, 22, 22);
    stroke(random(15,25), random(170,255), random(0,200));
    line(x,y-14,x,y+10);
    strokeWeight(5);
    }
  }
}



