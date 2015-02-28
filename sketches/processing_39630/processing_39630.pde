
void setup() {
  size(600, 600);
  background(0);
  colorMode(HSB); // colormode range set to size of sketch

}

float Hue = random(1); //random


void draw() {
  colorMode(HSB, 600, 100, 300); // colormode range set to size of sketch
  strokeWeight(mouseX/50);
  strokeJoin(ROUND);
  stroke(Hue+mouseX/10, 100, 300); // change the stroke Hue
  line(pmouseX, pmouseY, mouseX, mouseY); 


}

void mousePressed() {
  background(0);      // clear the background
  Hue=random(10, 600);
}

// save the image press any key
void keyPressed() {
  save("image.jpg");
}



