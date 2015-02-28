
float x;
int myRotation;
 
float radius=6;
float s = map(TWO_PI, TWO_PI, 90, TWO_PI, TWO_PI ) - HALF_PI;
 
 
void setup() {
  size(1000, 1000);
  background(255);
  myRotation = 200;
   
}
 
 
void draw(){
noStroke();
colorMode(RGB, 50);
for (int i = 0; i < 1; i++) {
  for (int j = 0; j < 1; j++) {
    stroke(i, j, 0);
    point(i, j);
  }
}
  x = dist(mouseX, mouseY, width/2, height/2);
  x = map (x, 0, 425, 0, 255);
   
  println("my x value is: " + x);
   
  if (mousePressed==true) {
     
    myRotation+=4;   
     float rad = radians (myRotation);
     
    translate(width/2, height/2);
     
    rotate(rad/2);
    
    if (x > 200) {
       stroke (0, x, x);
    }
    else if (x > 100 && x < 200) {
       stroke (x, x, 0);
       
    }
    else if (x < 100) {
      stroke (x+50, 0, x+50);
    }
     
    pushMatrix();
     
    line(width/4 + sin(s) * radius, height/4 + cos(s/2) * radius, -mouseX, -mouseY);
     
    line(width/4 + cos(s/4) * radius, height/4 + cos(s/4) * radius, width/4 -mouseX, -mouseY);
      
    line(width/4 + sin(s) * radius, height/4 + sin(s) * radius, width/12 -mouseX, mouseY);
     
   popMatrix();
 
 }
}



