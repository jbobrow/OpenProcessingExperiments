
//Jenny Wong
//Introduction to Digital Media Fall 2012 Assignment 01b
//Section B
//Date 9-13-12

float randomStroke = 0;
int value = 0;
int randomColor = 0;

void setup() {
  size(1200, 600); //Size of screen for assignment 01b
  background(255);
  noStroke();
}
  
void draw() {
    
  if(value == 0){
    noStroke();
    smooth();
  
    randomStroke = random(5);
    strokeWeight(randomStroke);  
    randomColor = int(random(200));

    stroke(randomColor, 0, 0);
  
    bezier(mouseX, mouseY, 600, 300, 150, 300, mouseX, mouseY);

    bezier(mouseX, mouseY, 900, 500, 150, 300, mouseX, mouseY);
  }
  else{
    noStroke();
    smooth();

    randomStroke = random(5);
    strokeWeight(randomStroke);  
    randomColor = int(random(200));
    stroke(0, randomColor, 0);
  
    bezier(mouseX, mouseY, 600, 300, 150, 300, mouseX, mouseY);

    bezier(mouseX, mouseY, 900, 500, 150, 300, mouseX, mouseY);

  }
} 

void mouseClicked() {
  
  if (value == 0) {
    value = 255;
  } 
  else {
    value = 0;
  }
}
    
void keyPressed() {
  if (key == 's') {
    save("jennywong01b.png");
  }
}
