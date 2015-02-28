
import processing.video.Movie;


//import processing.video.Movie;
Movie myMovie;

float startX, startY;
PImage img;
//PImage j;

void setup() {
  myMovie = new Movie (this,"http://paolaquilici.com/.js/crynow.ogv");
  myMovie.loop();
  size(720, 576);
  textSize(15);

}
void movieEvent (Movie m) {
  m.read();
  img=m;

}
void draw(){
image(myMovie,0,0);
if(mousePressed){
  noFill();
  strokeWeight(2);
  rectMode(CORNER);
rect(startX, startY, mouseX-startX, mouseY-startY);
fill(255);
text("Take a mental picture of you crying",mouseX,mouseY);
}


else{
  color c = myMovie.get(mouseX, mouseY);
 fill(c);
noStroke();
rect(mouseX,mouseY,100,100);
text("Tears made out of friday 8th march, 7:36 pm's sky",mouseX,mouseY);
}
}


void mousePressed(){
    myMovie.pause();
  startX=mouseX;
  startY=mouseY;
  text("Take a mental picture of you crying",mouseX,mouseY);
      stroke(255);
    fill(255);

}

void mouseReleased(){
 
  myMovie.play();
}



