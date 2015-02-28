
import processing.pdf.*;

void setup () {
  size(1000,1000);
  smooth();
  background(50);
  colorMode(HSB, 100);
}

void draw () {
  float abstand = dist(pmouseX, pmouseY, mouseX, mouseY);


  if (mousePressed) {
    if (abstand > 20) abstand = 20; {
      strokeWeight(20-abstand);
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
  }
  
}

void mousePressed() {
  println("mouse gedrückt");
  stroke(random(255), 50, 60); //farbton, sättigung, helligkeit
}


void keyPressed() {
  if (key=='s'||key=='S') {
    println("frame abspeichern");
    saveFrame("screenshot-####.tif");
  }

  if (key=='b'||key=='B') {
    background(50);
  }

  if (key=='p'||key=='P') {
    beginRecord(PDF, "zeichnung.pdf");
    background(50);
    colorMode(HSB, 100);
  }

  if (key=='e'||key=='E') {
    endRecord();
  }
}


