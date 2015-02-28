
import processing.pdf.*;
//Einstellungen Größe der Zeichenfläche und Darstellung weich
void setup() {

  size(400, 400);
  smooth();
  background(40);
  
  colorMode(HSB, 100);
}




// das Zeichenen
void draw() {
  noStroke();
  //gibt uns einen floatwert zurück
   dist (mouseX, mouseY, pmouseX, pmouseY);
   // definiert variable, deren werte wir verwenden können
  float d = dist (mouseX, mouseY, pmouseX, pmouseY); 

  //nur wenn die Maus gedrückt ist
  if(mousePressed == true)
  
  //eine Ellipse in spezieller Größe
      //d = je schneller die Mausbewegung desto größer die Ellipsen
  ellipse(mouseX, mouseY, d, d);
  


  //bei schnellerer Mausbewegung dickere linien
  if (d > 20) d = 20;
  strokeWeight(20-d);

  //eine Linie zeichnen wo die Maus sich bewegt
  line (pmouseX, pmouseY, mouseX, mouseY);
  
}

void mouseClicked(){

  stroke(255);
  
}

void mousePressed() {
  fill(random(100),100,80);
  stroke(random(255),100,100);
}

void keyPressed() {

  if (key == 's') {
    println("Frame speichern");
    saveFrame("screenshot-####.tif");
  }
  if (key == 'b') {
  
    background (100);
  }
  if (key == 'p') {
    
    beginRecord(PDF, "zeichnung.pdf");
    colorMode(HSB, 100);
    background(100);
  }
  if (key == 'e') {
    endRecord();
  }
}


