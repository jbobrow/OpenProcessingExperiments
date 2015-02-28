
/*
Konkuk University
 Department of Dynamic Media
 SOS iDesign
 Name: Seo YuMi
 ID: 201420082 Seo You Me
 */

int[] xpos = new int[70];
int[] ypos = new int[70];
 
void setup() {
  size(600, 600);
  smooth();
frameRate(15);
}

void draw() {
    background(255);
    fill(255);
     rect(0,0,width,height);
  fill(#000000,50);
  stroke(0, 30);
  strokeWeight(1);
  ellipse(mouseX, mouseY, 200, 200);
  fill(#000000);
  noStroke();   
  ellipse(mouseX, mouseY, 100, 100);
  noFill();
  stroke(0,80);
  ellipse(mouseX, mouseY,230, 230);
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
    fill (0, 0, 0, 25);
    ellipse (xpos[i], ypos[i], i / 0.75, i / 0.75);
  }
}


void mousePressed(){
  fill(#DE3C3C);
  noStroke();
  ellipse(mouseX, mouseY, 100, 100);
  fill(#FFAAAA,100);
  noStroke();
  ellipse(mouseX-110, mouseY, 50, 50);
  fill(#000000,70);
  noStroke();
  ellipse(mouseX+110, mouseY, 50, 50);
  
}

void title() { 
fill(127);
 textAlign(RIGHT);
 text("Seo Yumi, interactive Drawing with mouse, Dynamic Media, 2014", width-50, height-20);
 }
