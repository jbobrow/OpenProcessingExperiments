
//tauler de dibuix 
boolean click = false;
//Si pulsem la tecla espai, el que hi ha al tauler de dibux es borrarà
void keyPressed() {
  if (key == ' ') 
    background(0);
}
void setup() {
  random (0, 255);
  background (0);
  size (600, 600);
  smooth ();
  noStroke();
}
void draw() {
  if (click == false) {
      fill(random(0, 255), random(0, 255), random(0, 255), random(0,255));
      triangle(mouseX, mouseY, 50, 100, 50,30);
        
  }
      else {
            fill(random(0, 255), random(0, 255), random(0, 255));
            ellipse(mouseX, mouseY, 50, 50);
     }
}
 void mousePressed(){
    click = true;
  }

void mouseReleased() {
  click = false;
}






