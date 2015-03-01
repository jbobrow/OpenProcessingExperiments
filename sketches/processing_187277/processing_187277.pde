
void setup() {
size(640, 360); 
background(0); 
noStroke(); 
smooth();
}

void draw() {
  //change the parameter (redValue) to adjust color of the stars. 0 = more blue, 255 = more yell0w)
 drawStars(255);
}

void drawStars(int redValue) {
int gridSize = 40;

for (int x = gridSize; x <= width - gridSize; x += gridSize) {
  for (int y = gridSize; y <= height - gridSize; y += gridSize) {
    stroke(redValue, random(0,240), random(0,200));
    strokeWeight(2);
    line(x,y, x+12,y);
    line(x+2,y+10, x+12,y);
    line(x,y, x+10,y+10);
    line(x+2,y+9, x+6,y-5);
    line(x+10,y+9, x+6, y-5);
    
    stroke(#45DFFF);
    strokeWeight(0);
    line(x+6, y-6, width/2, height/2);
  }
}
}


