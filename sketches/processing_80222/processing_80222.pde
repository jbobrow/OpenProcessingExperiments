
/*Alec Sibilia's Coding, edited by Cecilia Chen*/
PImage img0; 
PImage img1;
int counter;

 
void setup() {
  size(400, 400);
  img0 = loadImage ("06.png"); 
  img1 = loadImage ("windex.png"); 
  colorMode(HSB, 100);
  background(164,0,90);
  /* text ("Click to draw. Backspace to erase.", 180,300);*/
  smooth();
  noStroke();
  image(img0, 0, 0);

  cursor (img1); 
}
 
 
void draw() {
  
  
  if (mousePressed == true) {
  float circlecolor = random(45,50);
  fill(random(circlecolor,circlecolor +10),80,80,5);
  float circlesize = random(20,40);
  ellipse(random(mouseX,mouseX+20), random(mouseY,mouseY+20), circlesize, circlesize);
  }
}
 
void keyPressed() {  
     if (key == BACKSPACE) {
       image(img0, 0, 0);
       image(img1, mouseX, mouseY);
   } 
}


