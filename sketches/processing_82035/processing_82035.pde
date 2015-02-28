
void setup() {  //setup function called initially, only once
  size(250, 250);
  background(0);  //set background black
}

void draw() {  //draw function loops 
  smooth();
  noStroke();
  fill(random(255), random(255), random(255),random(255)); //fill random colors and random opacities
  ellipse(random(width), random(height), random(50, 100), random(50, 100));
}
