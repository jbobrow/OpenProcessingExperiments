
/**
 *
 *
 * TASTENBEFEHLE
 * 1-4                 : zwischen 4 farben wählen
 * del, backspace      : löschen
 * r                   : richtungs wechsel
 * s                   : save png
 * w                   : farb wechsel

 */
 
 
color col = color(181,107,170);
float lineLength = 0;
float angle = 0;
float angleSpeed = 1.3;
 
void setup() {
  size(800, 800);
  background(255);
  smooth();
  cursor(CROSS);
}
 
void draw() {

    
  if (mousePressed) {
    pushMatrix();
    strokeWeight(1.0);
    noFill();
    stroke(col);
    translate(mouseX,mouseY);
    rotate(radians(angle));
    line(0, 0, lineLength, 0);
    arc(mouseX,mouseY,pmouseX,pmouseY,0,360);
    popMatrix();
     
    angle += angleSpeed;
  }
}
 

void mousePressed() {
  lineLength = random(40, 400);
}
 
 
void keyReleased() {
  if (key == DELETE || key == BACKSPACE) background(255);

 

  // richtungs wechsel
  if (key=='r' || key=='R') {
    angle = angle + 180;
    angleSpeed = angleSpeed * -1;
  }
 
  // farb wechsel
  if (key == 'w') col = color(random(255,90),random(255),random(255),random(80,250));
 
  //farben (1-4) 
  if (key == '1') col = color(181,157,0);
  if (key == '2') col = color(0,130,164);
  if (key == '3') col = color(87,35,129);
  if (key == '4') col = color(197,0,123);
 
  // linien länge ändern
  if (key == '5') lineLength = random(40, 600);
  

}



