
              // Example 06-01 from "Getting Started with Processing" 
// by Reas & Fry. O'Reilly / Make 2010

PImage img;

void setup() {
  size(300,300);
  img = loadImage("vampires-nosferatu.jpg");
}

void draw() {
  image(img, 0, 0);
}
