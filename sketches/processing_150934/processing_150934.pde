
//import ddf.minim.*;

//Minim minim;
//AudioPlayer song;

float xPos = 0;
float diameter = 30;
float angle;
float x;
float y;

void setup () {
  size(600, 300, P3D); 
  smooth (); 
  background (0);
  colorMode(HSB, width, 100, 100);
  
  //minim = new Minim (this);
//song = minim.loadFile("Max Frost-02-Nice And Slow.mp3");
//song.play ();
}

void draw () {
  //background (0);
  xPos = xPos + 1;
  
  if (xPos > width + diameter) {
    xPos = - diameter;
  }
  
 // float dimension = song.mix.level() * 250;

  translate(xPos, height/2, 0);
  rotateX(radians(angle));
  rotateY(radians(angle)); 
  noFill();
  stroke(xPos, 100, dimension, dimension);
  box (100*sin(radians(xPos)));
  line(300, 500, 0, 0);
  angle=angle+1;

  translate(0, 100, 0);
  box(20);
  line(300, 100, 500, 100);
  //title();

  }

 //void title() { 

  //fill(255);
  //textAlign(RIGHT);
  //text("JEONG Eunyeah, colorful, Dynamic Media, 2014", width-50, height-20);
// }
