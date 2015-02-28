
// Example 07-19 from "Getting Started with Processing" 
// by Reas & Fry. O'Reilly / Make 2010

float wiggle, sz;
float angle = 0.0;
PImage img;
int i=30;
int j=0;

void setup() {
  size(400, 400);
  smooth();
  noStroke();
  img= loadImage("1.jpg");
  image(img,-120,-120);
  filter(BLUR,3);
  colorMode(RGB);
  //filter(INVERT);
  
}

void draw() {
  translate(mouseX, mouseY);
  
  for (int i = 30; i < 80; i = i+100);
  for (int j = 0; j < 80; j = j+5) ;
ellipse(mouseX,mouseY,random(3),3);

fill(253,224,214,random(50));

ellipse(mouseX,mouseY,3,7);
  noStroke();
  
  
  fill(104,215,178,random(140));
  rotate(angle);
  ellipse(i, -15,3, 40);
  angle += 0.05;
  
  
  
  

  }



