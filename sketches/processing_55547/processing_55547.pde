
//Monissa Chakrabartty YSDN 2012
//Source code partially from Michael Michael http://openprocessing.org/sketch/49545

float angle = 0.0;

float easing = 0.05;
float transparency = 200;
 
void setup() {
  size(600, 500);
  background(180);
  smooth();
}
 
void draw() {
  
//Draws circles and squares  
  if (mousePressed) {
        translate(mouseX, mouseY);
          float scalar = cos(angle) + random(1,5);
          scale(scalar);
          stroke(50);
          strokeWeight(0.4 / scalar);
          transparency = random(-100, 100);
          rotate(angle);
          angle += 0.05;
            fill(255, 255, 255, transparency);
            ellipse(15, 15, 50, 50);
            translate(10, 10);
            fill(mouseX, 50,mouseY, transparency);
            rect(-15, -15, 30, 30);
            translate(20, 20);
            fill(50, 50, 50, transparency);
            ellipse(-15, -15, 15, 15);
           angle += 0.1;
      }
}

void mouseMoved(){
    stroke (mouseX - 5, mouseY, pmouseX + 15, 200);
    line (0,random(600), 700,random(0,600));
}

//Reset
void keyPressed(){
  background (mouseX - 10, mouseY, pmouseX + 5);
}
    

  


