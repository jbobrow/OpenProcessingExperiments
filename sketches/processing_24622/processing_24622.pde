
import processing.pdf.*;

void setup () {
  size(800,800);
  smooth();
  colorMode(HSB, 100);
}

void draw(){
// ellipse (mouseX,mouseY,10,10);
// println("framecount: " + frameCount);
if(mousePressed) {
  
  float abstand = dist(pmouseX, pmouseY, mouseX, mouseY);
  //ellipse(mouseX,mouseY,abstand,abstand);
  
  float dicke = 20-abstand;
  if(dicke <1) { dicke = 1; }
  strokeWeight(dicke);
  line(pmouseX, pmouseY, mouseX, mouseY);
  }

}

void mousePressed(){
  println("mouse pressed");
  colorMode(HSB,100);
  stroke(random(50,100),random(60,100),50);
}

void keyPressed() {
 if (key == 's') { saveFrame("asdf_####");}
 if (key == 'p') {beginRecord(PDF, "Zeichnung-####.pdf");
   colorMode(HSB, 100);
   background(0,0,100);

}
 if (key == 'e') {endRecord();  }
}

