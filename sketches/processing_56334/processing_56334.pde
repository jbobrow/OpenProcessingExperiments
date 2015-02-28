
void setup() { 
  size(600, 450); 
  background(255);
} 


void draw (){
 if (mousePressed) {
  ellipse (mouseX, mouseY, 10, 10);
  fill(255);
  noStroke ();
  cursor(CROSS);
  } 
  else {
  float d = dist(pmouseX, pmouseY, mouseX, mouseY);
if (d > 10) d = 10;
ellipse(mouseX, mouseY, 10-d, 10-d );
fill(0);
noStroke();
   noCursor(); 
  }
}


void mouseClicked () {
  background(255);
}

void keyPressed () {
 if (key == 's') {
   println("Frame abspeichern");
   saveFrame("pic-####.png");
 }
}


