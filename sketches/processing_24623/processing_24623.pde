
import processing.pdf.*;

float angle = 0;


void setup() {
  size(1024,768);
  smooth();
  background(50);
  colorMode(HSB, 100);
}

void draw() {
  
   

  //ellipse(pmouseY,pmouseX,10,10);

  if(mousePressed) {


    // println(mousePressed); //gibt jeden frame aus, ob maus gedrückt ist, kann auch zb. frameCount sein	

    float d = dist(pmouseX, pmouseY, mouseX, mouseY); //d = variable, wird mit dist befüllt, dist errechnet wert von abstand
    fill(255, 50); // füllt ellipse mit jeweiligem wert
   // ellipse(pmouseX, pmouseY, d, d);


 /*   float dicke = 20-d;

    if (dicke < 1) { 
      dicke = 1;
    }

    strokeWeight(dicke);
    line(pmouseX,pmouseY,mouseX,mouseY);*/
    
  //  line(mouseX, mouseY, mouseX+100, mouseY);
    
   angle += 0.1;
    
    translate(mouseX, mouseY);
    rotate(angle);
    line(0,0,d*20,0);
  }
}

void mousePressed() {
  //println("pressed"); 
  colorMode(HSB, 100);
  stroke(random(80,100),random(80,60),90);
}


void keyPressed() {
  if (key == 's') { 
    saveFrame("bild-####.png");
  }
  
  if (key == 'p') { 
   println("start recording");
   beginRecord(PDF,"zeichnung.pdf");
   colorMode(HSB, 100);
   background(0,0,0);
  }
  
  if (key == 'e') { 
    endRecord();
  }
}


