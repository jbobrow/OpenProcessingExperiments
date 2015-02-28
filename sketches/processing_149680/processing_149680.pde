
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM Mirae
// ID: 201420064
 
/*import ddf.minim.*;
 
Minim minim;
AudioPlayer song;*/
 
float angle;
float xoff;
 
void setup () {
  size(800,500); // size(displayWidth, displayHeight);
  background(255);
  smooth();
 
 /* minim = new Minim (this);
  song = minim.loadFile("PINK CELLPHONE.mp3");
  song.play ();
*/
}
void draw () {
 
 
  float dia = 0; //song.mix.level() * 250;
  xoff+=0.01;
  float nc = noise(xoff)*width/2;
 
  pushMatrix();
  translate(width/2, height/2);
  angle = angle + 1;
  rotate(radians(angle));
 
  strokeWeight(1);
  stroke(random(255), random(255), random(255), 50);
  line(dia, 0, nc, 0);
  popMatrix();
 
  if (angle>1080) {
    background(255);
    angle=0;
  }
}
 
/*void keyPressed() {
if (key=='s') saveFrame("Images/####.jpg");
}*/

