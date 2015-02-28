
PImage img;

void setup() {
  // Set the size and background
  size(500,500);
  smooth();
  frameRate(30);
  
  img = loadImage("url-1.jpg");
  }
 
void draw() {
  //Draw a random background
  //background(random(0, 255), random(0, 204), random(0, 255));
  background(255);// 
  // Set ellipses and rects to CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  image(img, 0, 0);

  // Draw Zazoo's body
  stroke(0);
  fill(175);
  rect(mouseX,mouseY,20,100);
  
  // Draw Zazoo's head
  stroke(0);
  fill(255);
  ellipse(mouseX,mouseY-30,60,60);
  
  // Draw Zazoo's eyes
  fill(mouseX,0,mouseY);
  ellipse(mouseX-19,mouseY-30,16,32);
  ellipse(mouseX+19,mouseY-30,16,32);
  
  // Draw Zazoo's legs
  stroke(0);
  line(mouseX-10,mouseY+50,pmouseX-10,pmouseY+60);
  line(mouseX+10,mouseY+50,pmouseX+10,pmouseY+60);
  
  //Draw Zazoo's arms
  stroke(0);
  line(mouseX-10,mouseY+25,pmouseX-20,pmouseY+40);
  line(mouseX+10,mouseY+25,pmouseX+20,pmouseY+40);
}
  
void mousePressed() {
  background(random(0, 255), random(0, 255), random(0, 255));
  println("Whoooooooohoooooo");


}




