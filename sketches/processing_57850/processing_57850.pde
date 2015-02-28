
int numColors = 100; // the number of different random colors
color[] colors = new color[numColors];
int current;
 
void setup() {
  size(500, 500);
  noStroke();
  for (int i=0; i<colors.length; i++) {
    colors[i] = color(random(255), random(255), random(255));
  }
}
 
void draw() {
  background(64);
  fill(getColor(current));
  rect(width/2, 0, width/2, height/2);
  fill(getColor(current-1));
  rect(width/2, height/2, width/2, height/2);
  fill(getColor(current-2));
  rect(0, height/2, width/2, height/2);
  fill(getColor(current-3));
  rect(0, 0, width/2, height/2);
  if (frameCount % 60 == 0) { current++; }
}
 
color getColor(int index) {
  if (index >= 0 && index < colors.length) {
    return colors[index];
  } else {
    return color(255);
  }
}
//made the conditional into an array of colours instead
// altered the colour of the squares 

