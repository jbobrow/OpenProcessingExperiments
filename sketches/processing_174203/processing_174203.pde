
import ddf.minim.*;

PImage face; 
int tamcolum = 2;
int columns, rows;
int b;
Minim minim;
AudioPlayer song;
void setup() {
  size(1136, 640, P3D); 
  face = loadImage("The wall.jpg");
  columns = face.width / tamcolum;
  rows = face.height / tamcolum;
   minim= new Minim(this);
  song= minim.loadFile("10 One of My Turns.mp3");

}

void draw() {
  background(0);
  for ( int i = 0; i < columns; i++) {
    for ( int j = 0; j < rows; j++) {
      int x = i*tamcolum + tamcolum/2;
      int y = j*tamcolum + tamcolum/2;
      int loc = x + y*face.width;
      color c = face.pixels[loc];
      //float s = random(1); Para poder cambiar el Stroke. 
     
      float p = (mouseX / float(width)) * brightness(face.pixels[loc]) - 20.0;
      pushMatrix();
      translate(x + 10, y + 5, p + 1);
      fill(c, 240);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, tamcolum, tamcolum);
      popMatrix();
    }
  }
}
void mousePressed(){
 song.setLoopPoints (208000, 215900);
  song.loop();
  b= song.length();
  println(b);
}





