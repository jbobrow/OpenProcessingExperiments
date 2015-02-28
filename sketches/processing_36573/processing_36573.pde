
void setup() {

  background(255);

  size(900, 450, P2D);
  smooth();
}


void draw() {
  ;
  fill(255, 255, 255, 4);
  stroke(255, 0, random (255), 1);

  if  (mousePressed) {
    //if(mouseX<width/3){
    if (mouseButton == LEFT) {
      fill(mouseX/4.0, mouseY/4.0, 0, 4);
    }
    if (mouseButton == RIGHT) {
      fill(mouseX/30.0, mouseY/30.0, mouseY/28.0, 4);
    }

    //}
    pushMatrix();
    translate(mouseX, mouseY); 
    rotate(millis());
    rect(-25*2, 25, random(547), 250);
    ellipse(-100*3, random (500), 100, random(950));
    popMatrix();
  }
}

void keyPressed () {
  if (keyCode == BACKSPACE) {
    background (255);
  }
  
  if (keyCode == CONTROL) {
    save ( "Pó_magico" + day() + month() + hour() + minute() + second() + ".tif" );
}
}

