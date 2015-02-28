
/**
 * TRIANGLE_STRIP Mode
 * by Ira Greenberg. 
 * 
 * Generate a closed ring using vertex() 
 * function and beginShape(TRIANGLE_STRIP)
 * mode. outerRad and innerRad variables 
 * control ring's outer/inner radii respectively.
 * Trig functions generate ring.
 
 
 *    Übungsaufgabe an der FH-Mainz
 *    Siimple Modifikation von vorhanden Beispielen
 *    von Paul Schneider 
 *
 *    betreut von: fjenett 20071010
 */     
 
void setup() {
size(600, 400);
background(204);
smooth();
frameRate(5);
}

void draw () {
int x = width/2;
int y = height/2;
float outerRad = min(width, height) * 1;
float innerRad = outerRad * 0.9;
float px = 0, py = 0, angle = 0;
float pts = 26;
float rot = 360.0/pts;
beginShape(TRIANGLE_STRIP); 
for (int ii = 0; ii < 4; ii++) {
  for (int i = 0; i < pts; i++) {
    if (mousePressed) {
      fill(0);
    }else{
      fill(random(200,255));
    }
    px = x + cos(radians(angle))*outerRad;
    py = y + sin(radians(angle))*outerRad;
    angle += rot;
    vertex(px+i, py+i);
    px = x + cos(radians(angle))*innerRad;
    py = y + sin(radians(angle))*innerRad;
    stroke(204);
    
    vertex(px, py); 

    angle += rot;
  }
  
  pts -=5;
  innerRad = outerRad * ii/3;
}

endShape();
}

