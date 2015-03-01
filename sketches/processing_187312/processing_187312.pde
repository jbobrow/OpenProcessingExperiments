
void setup() {
size(800, 800);
background(75,43,102);
noStroke();
smooth();
}
 
void draw() {
  //change the parameter (redValue) to adjust color of the stars. 0 = more blue, 255 = more yell0w)
 smileyFace(200);
}
 
void smileyFace(float circleFill) {
int gridSize = 50;
 
for (int x = gridSize; x <= width - gridSize; x += gridSize) {
  for (int y = gridSize; y <= height - gridSize; y += gridSize) {
   
    strokeWeight(2);
    
    float circleSize = random(200);
    fill(circleFill, random(0,240), random(0,200));
    ellipse(x, y, circleSize, circleSize);
    stroke(255, random(0,240), random(0,200));
    point( x-5, y-2 );
    point( x+5,y-2);
    curve( x-5, y, x-5, y+5, x+5, y+5, x+5, y);
    
    
    
  }
}
}



