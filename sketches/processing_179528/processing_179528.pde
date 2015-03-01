
import processing.video.*;
Movie myMovie;

int timer;

void setup() {   

  size(1280, 800);

  myMovie = new Movie(this, "Final.MOV");  //MOVIE
  myMovie.loop();
  myMovie.speed(0.9);

}

void movieEvent(Movie m) {
  m.read();
}


void draw() {
  if (myMovie.available()) {
    myMovie.read();
  }
  image(myMovie, 0, 0, 1280, 720); //MOVIE

  fill(10);  //WINDOW
  noStroke();
  smooth();

  quad(0, 0, 1280, 0, 1280, 50, 0, 50);   //top window
  quad(0, 700, 1280, 700, 1280, 800, 0, 800);    //bottom window
  quad(355, 0, 455, 0, 455, 1280, 355, 1280);    //middle divider
  quad(0, 275, 1280, 275, 1280, 315, 0, 315);  //horizontal

  noFill(); 
  fill(20);
  quad(455, 277, 1280, 277, 1280, 285, 455, 285);  //highlight middleright
  quad(0, 277, 355, 277, 355, 285, 0, 285); //highlight middleleft
  quad(519, 705, 1280, 705, 1280, 715, 535, 715);  //highlight bottomright
  quad(0, 705, 290, 705, 275, 715, 0, 715); //highlight bottomleft


  noFill();
  strokeWeight(30);
  strokeCap(SQUARE); 
  stroke(10);
  arc(290, 114, 160, 160, PI+HALF_PI, TWO_PI); //TopRight1
  arc(290, 635, 160, 160, 0, HALF_PI); //BottomRight1
  arc(519, 114, 160, 160, PI, PI+HALF_PI);   //TopLeft2
  arc(519, 635, 160, 160, HALF_PI, PI);   //BottomLeft2

  if (millis() - timer > 2000) {  
    myMovie.jump(random(myMovie.duration()));  //every sec
    timer = millis();
  }
}

