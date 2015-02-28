
int numShapes = 100;

int keyboard;
 
 
void setup() {
  size(800, 600);
  background(255,100,0);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
  rectMode(CENTER);
  fill(#007DB4, 390);
  noStroke();
  colorMode(HSB, 360, 100, 100, 100);
}

 
void draw() {
   
  fill(random(360), 80, 380, 480);
 
 
   
    if (mouseButton == LEFT) {
      
      if (keyboard == 'c') {
        ellipse(random(width), random(height), 50, 50); 
         for (int i = 1; i <= numShapes; i++) {

        int rectX = width/(numShapes+2) * i;
    int rectY = height/2;
 
    float theta = atan2(rectY - mouseY, rectX - mouseX);
     
    fill(map(i, 1, numShapes, 140, 20), 80, 190, 250);
 
    pushMatrix();
    translate(rectX, rectY);
 
    rotate(random(theta)*2);
    rect(0, 20, 300, 300);
 
    translate(503, 20);
    rect(0, 0, 50, 50);
 
    popMatrix();

      }
      }
      else if (keyboard == 'r') {
       
        rect(random(width), random(height), 20, 20);
        rotate(random('r'));
      }
    }
  }

 
void keyPressed() {
 
  if (key == ' ') {
    background(360);
  }
   
 
  keyboard = key;
}


