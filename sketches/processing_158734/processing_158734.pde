
void setup() {
    size(480, 120);
    smooth();
}

void draw() {
  if(mousePressed) {
    fill(0);
  } else {
    fill(255);
  }
  ellipse(mouseX, mouseY, 80, 80);
}

// A quick edit: After looking through Assignment 2, I noticed a nice way to actually draw, I'm sure it would // be easy for someone to figure out by looking up the references on the Processing website. Unfortunately, I // haven't figured out how to erase stuff yet

//void draw() {
//  if(mousePressed) {
//    point(mouseX, mouseY);
//    strokeWeight(5); 
//  }
//} 

