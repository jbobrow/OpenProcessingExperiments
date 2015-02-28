

void setup(){
 size (400,400);
 smooth();
 colorMode(HSB, 100);

}

void draw() {
  float abstand = dist(pmouseX, pmouseY, mouseX, mouseY);
  
  
  if(mousePressed) {
  ellipse(mouseX, mouseY, abstand, abstand);
  
  }
  
  if(abstand > 20){
  abstand=20;
  }
  abstand = min(abstand,20);
  strokeWeight(20-abstand);
  line(pmouseX, pmouseY, mouseX, mouseY);
  }
   
  void mousePressed() {
     println("mouse gedrückt");
     fill(random(255),80,40);
     stroke(random(255),80,40);
  }
  
void keyPressed() {
  if (key == 's') { //s ist hier ein charakter also die taste die man drückt, damit der frame gespeichert wird
   println("Frame abspeichern");
   saveFrame();
    
  }

}

