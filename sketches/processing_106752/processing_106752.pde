
int counter;
 
void setup() {
  size(600, 600);
  colorMode(HSB, 100);
  background(164,0,90);
  text ("", 180,300);
  smooth();
  noStroke();
}
 
 
void draw() {
  if (mousePressed == true) {
  float circlecolor = random(35,45);
  fill(random(circlecolor,circlecolor +10),80,80,50);
  float circlesize = random(3,8);
  ellipse(random(mouseX,mouseX+20), random(mouseY,mouseY+20), circlesize, circlesize);
  }
}
 
void keyPressed() {  
     if (key == BACKSPACE) {
       background(164,0,90);      // clears the background
       fill (100,0,100);
       text ("", 180,300);
   } 
}


