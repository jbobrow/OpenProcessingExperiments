
/* 
 Konkuk University 
 Department of Dynamic Media 
 SOS iDesign 
 Name: SHIN Yeon Sik
 ID: dnmys11
 */

int[] xpos = new int[70]; 
int[] ypos = new int[70]; 

void setup() { 
  size(600, 600); 
  smooth(); 
  frameRate(15); 
  background(0);
} 


void draw() { 
  fill(random(255)); 
  noStroke(); 
  strokeWeight(1); 
  rect(mouseX, mouseY, 100, 100);
  rectMode(CENTER); 



  title(); 
  noStroke(); 
  for (int i=0; i< xpos.length - 1; i++) { 
    xpos[i] = xpos[i + 1]; 
    ypos[i] = ypos[i + 1];
  } 

  // aktuelle Mausposition in das letzte Feld speichern 
  xpos[xpos.length - 1] = mouseX; 
  ypos[xpos.length - 1] = mouseY; 

  // Zeichnen aller Kreise 
  for (int i=0; i < xpos.length; i++) { 
    fill (0, 0, 0, 10); 
    ellipse (xpos[i], ypos[i], i / 0.75, i / 0.75);
  }
} 


void title() {  
  fill(127); 
  textAlign(RIGHT); 
  text("SHIN Yeon Sik, interactive Drawing with mouse, Dynamic Media, 2014", width-50, height-20);
} 

