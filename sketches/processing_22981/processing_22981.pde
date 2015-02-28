
import processing.video.*;
Movie myMovie;
float x = 1;
float y = 1;


void setup() {
  background(10);
  size(900, 900);
  frameRate(20);
  myMovie = new Movie(this, "RUN.mov");
  myMovie.loop();
}

void draw() {
  loop();
  float w = constrain(mouseX, 1, 250);
  float z = constrain(mouseY, 1, 250);
  x+=1.5;
  y+=2.5;
  tint(255, 24);
  translate(120,140);
  scale(3);
  imageMode(CENTER);
  image(myMovie, w, z);
if(x%2==0){
  PImage myMovie = get();
 image(myMovie,random(300), mouseY, 230-x, mouseY-x);
 image(myMovie,pmouseX+33, mouseY+random(137),100, random(100));
}

}

void mousePressed() {
  myMovie.pause();
}

  

void movieEvent(Movie m) {
  m.read();
}

void mouseReleased() {
  myMovie.play();
  x=1;
  y=1;
  noLoop();
  redraw();
}




