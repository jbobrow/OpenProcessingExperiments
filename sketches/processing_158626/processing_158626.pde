
PImage image1;

void setup() {
  image1 = loadImage("1.png");
  size(800, 600);
  background(200, 0, 50);
  strokeWeight(20);
  stroke(255, 198, 0, 70);
  frameRate(30);
  //noCursor();
 }


void draw() {
//background(200, 0, 50);
translate(width/2, height/2);
imageMode(CENTER);
rotate(millis() * 0.001 * PI / 2.0);
image(image1, 0, 0, mouseX/2, mouseY/2);

 translate(width/2, height/2);
  imageMode(CENTER);
  rotate(millis() * 0.001 * PI / 2.0);
  image(image1, 120, 120, mouseX/3, mouseY/3);
  
translate(width/2, height/2);
imageMode(CENTER);
rotate(millis() * 0.001 * PI / 3.0);
image(image1, 10, 10, mouseX/3, mouseY/3);
     
translate(width/2, height/2);
imageMode(CENTER);
rotate(millis() * 0.001 * PI / 1.0);
image(image1, mouseX/5, mouseY/5, 100, 100);
  
translate(width/2, height/2);
imageMode(CENTER);
rotate(millis() * 0.001 * PI / 1.0);
image(image1, 10, 10, 100, 100);
  
pushStyle();
translate(width/2, height/2);
imageMode(CENTER);
rotate(millis() * 0.001 * PI / 0.5);
image(image1, 7, 7, mouseX/2, mouseY/2);   
popStyle();
 
pushStyle();
translate(width/2, height/2);
imageMode(CENTER);
rotate(millis() * 0.001 * PI / 10.0);
image(image1, 10, 10, mouseX/2, mouseY/2);  
 popStyle();

translate(width/2, height/2);
imageMode(CENTER);
rotate(millis() * 0.001 * PI / 3.0);
image(image1, 10, 10, mouseX/3, mouseY/3);
     
translate(width/2, height/2);
imageMode(CENTER);
rotate(millis() * 0.001 * PI / 1.0);
image(image1, mouseX/5, mouseY/5, 100, 100);
  
translate(width/2, height/2);
imageMode(CENTER);
rotate(millis() * 0.001 * TWO_PI / 400.0);
image(image1, 400, 400, 400, 400);
 }

void mousePressed() {

image(image1, 0, 0, mouseX, mouseY);
  fill(mouseX, mouseY, 120, 120);
  rectMode(CENTER);
  rect(400, 300, 400, 600);
}

void mouseDragged() {
   rectMode(CORNER);
  fill(64, 57, 24, 100);
  rect(mouseX/2, mouseY/2, mouseX*3/2, mouseY*3/2);
}


