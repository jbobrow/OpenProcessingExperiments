
void setup() {
  size(450, 450);
  smooth();
  noStroke();
}

void draw() {
  background (50, 0, 200);

  for (int p=0; p<width; p+=11) {
    // sets random colours that change according to set numbers. 
    color from = color(255, 255, 0);
    color to = color(255, 90, 30);
    color start1 = lerpColor(from, to, (float)p/width);
    fill(start1); 
    stroke (start1); // stroke doesn"t need fill since you MUST set it's colour!!
    strokeWeight (5);  
    ellipse (p, p, p, p);
  }
}


