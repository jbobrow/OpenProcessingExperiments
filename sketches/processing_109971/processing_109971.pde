
// I made the same drawing as assignment 1, but now using less lines in my code.
//It was my goal to produce a picture that shows a sort of matematical 
//balance with many details.


color [] pallete = {
  #FF530D, #E82C0C, #FF0000, #E80C7A, #FF0DFF, #0C0A10, #EEEDEF
};


void setup() {
  size(1000, 1000);
  background(pallete[5]);
}

void draw() {
  float r = random(0, 7);
  float s = random (1, 5);
  for (int i=50; i<1000; i += 50) {
    noFill();
    stroke(pallete[int(r)]);
    ellipse(width/2, height/2, i, i);
    ellipse(0, height/2, i, i);
    ellipse(width/2, 0, i, i);
    ellipse(width, height/2, i, i);
    ellipse(width/2, height, i, i);

    stroke(pallete[int(s)]);
    line(i/2, 0, i/2, height);
    line((width+i)/2, 0, (width+i)/2, height);
    line(i*10, 0, i*10, i*20);
    line(0, i*10, i*20, i*10);
    line(0, i, width, i);
    line(0, i-25, width, i-25);
  }
}



