
float a=15;


void setup() {
  size(500, 500);
  smooth();
  background(255);
}

void draw() {
  stroke(255, 80);
}
void mouseDragged() {
  
  //elissi blu, parte dx dello schermo
  if (mouseX>=width/2 && mouseX<width) {
    //incrementa grandezza di 1
    a=a+1;

    fill(#347190, 20);
    ellipse(mouseX, mouseY+25, a, a);
    ellipse(mouseX+25, mouseY, a, a);
    ellipse(mouseX-25, mouseY, a, a);
    ellipse(mouseX, mouseY-25, a, a);
  }

  //elissi rossa, parte dx dello schermo
  if (mouseX>=0 && mouseX<width/2) {
    //incrementa grandezza di 1
    a=a+1;

    fill(#E86080, 20);
    ellipse(mouseX, mouseY+25, a, a);
    ellipse(mouseX+25, mouseY, a, a);
    ellipse(mouseX-25, mouseY, a, a);
    ellipse(mouseX, mouseY-25, a, a);
  }

//quando la grandezza dell'elissi è 100 torna a 0
  if (a==100) {

    a=0;
  }
}

//quando il mouse viene rilasciato la grandezza dell'elissi è 0
void mouseReleased() {
  if (a>0 && a<250) {
    a=0;
  }
}


