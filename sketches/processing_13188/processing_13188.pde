

import processing.video.*;
Movie myMovie;
int i;


void setup() { 
  size(700, 500, P3D);
  myMovie = new Movie(this, "board.mp4");
  myMovie.loop();
  smooth();
  myMovie.speed (.5);

}



void movieEvent(Movie myMovie) {
  myMovie.read();
}

void draw() {

  background (0, 50);

  translate (width/2, height/2);

  color c = myMovie.get(myMovie.width/2, myMovie.height/2);
  float x = map(brightness(c), 0, 255, -width/2, width/2);
  float y = map (saturation(c), 0, 255, -height/4, height/4);

  fill (200);
  spotLight (84, 30, 250, 0, 40, 200, 0, 0.5, 0.5, PI, 5);
  pointLight (75, 240, 247, 200, -150, 0);
  directionalLight (31, 8, 252, 1, 0, 0);
  ambientLight (255, 255, 255);
  noStroke ();
  rotateY (map(saturation(c), 0, width, 0, PI));
  rotateX (map(hue(c), 0, height, 0, PI));
  noStroke ();
  box (80, 80, 80); 

  
  if ((millis () > 3000) && (millis () < 5000)) {
    for (int i=5; i<=250; i+=50){
      fill (random (50, 255));
      noStroke ();
      rotateY (map(hue(c), 0, width, 0, PI*2));
      rotateX (map(brightness(c), 0, height, 0, PI*2));
      box (i, 50, 50); 
    }
  }
    if ((millis () > 5000) && ( millis () < 8000)) {
    for (int i=5; i<=600; i+=40){
      fill (random (50, 255));
      noStroke ();
      rotateY (map(brightness(c), 0, width, 0, PI));
      rotateX (map(saturation(c), 0, height, 0, PI));
      rect (x, i/y, 50, 30);
    }
  }

  if ((millis () > 8500) && ( millis () < 10000)) {
    for (int i=5; i<=600; i+=40){
      fill (random (50, 255));
      noStroke ();
      rotateY (map(brightness(c), 0, width, 0, PI));
      rotateX (map(saturation(c), 0, height, 0, PI));
      rect (i, y, 50, 30);
    }
  }

  if ((millis () > 15000) && ( millis () < 12000)) {
    for (int i=5; i<=600; i+=40){
      fill (random (50, 255));
      noStroke ();
      rotateY (map(brightness(c), 0, width, 0, PI));
      rotateX (map(saturation(c), 0, height, 0, PI));
      rect (x, i/y, 50, 30);
    }
  }
  if ((millis () > 12000) && ( millis () < 13000)) {
    for (int i=5; i<=600; i+=40){
      fill (random (50, 255));
      noStroke ();
      rotateY (map(brightness(c), 0, width, 0, PI));
      rotateX (map(saturation(c), 0, height, 0, PI));
      rect (i, y, 50, 30);
    }
  }
  
    if ((millis () > 13000) && (millis () < 15000)) {
    for (int i=5; i<=450; i+=50){
      fill (random (50, 255));
      noStroke ();
      rotateY (map(hue(c), 0, width, 0, PI*2));
      rotateX (map(brightness(c), 0, height, 0, PI*2));
      box (i, 50, 50); 
    }
  }
  
    if ((millis () > 15000) && ( millis () < 20000)) {
    for (int i=5; i<=600; i+=40){
      fill (random (50, 255));
      noStroke ();
      rotateY (map(brightness(c), 0, width, 0, PI));
      rotateX (map(saturation(c), 0, height, 0, PI));
      rect (x, i/y, 50, 30);
    }
  }
 

    if ((millis () > 20500) && ( millis () < 22000)) { //PERFECT
    for (int i=5; i<=450; i+=20){
      fill (random (50, 255));
      noStroke ();
      rotateY (map(brightness(c), 0, width, 0, PI));
      rotateX (map(saturation(c), 0, height, 0, PI));
      rect (i, y, 50, 30);
    }
  }
  
      if ((millis () > 22000) && ( millis () < 27000)) { 
    for (int i=5; i<=600; i+=40){
      fill (random (50, 255));
      noStroke ();
      rotateY (map(brightness(c), 0, width, 0, PI));
      rotateX (map(saturation(c), 0, height, 0, PI));
      rect (x, i/y, 50, 30);
    }
  }

  if (millis () > (27000)) {
    for (int i=5; i<=600; i+=70){
      fill (random (50, 255));
      noStroke ();
      rotateY (map(hue(c), 0, width, 0, PI*2));
      rotateX (map(brightness(c), 0, height, 0, PI*2));
      box (i, 50, 50); 
    }
  }

  if (millis () > (33000)) {
    background (0);
  }
  
//saveFrame.(projTwo.jpg);

}













