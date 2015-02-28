
import ddf.minim.*;
import processing.video.*;
 
Minim minim;
AudioPlayer song;
Movie myMovie;
Movie myMovie2;
Movie myMovie3;
Movie myMovie4;

Movie myMovie5;
Movie myMovie6;
Movie myMovie7;
Movie myMovie8;

Movie myMovie9;
Movie myMovie10;
Movie myMovie11;
Movie myMovie12;

Movie myMovie13;
Movie myMovie14;
Movie myMovie15;
Movie myMovie16;

Movie myMovie17;
Movie myMovie18;
Movie myMovie19;
Movie myMovie20;

void setup()
{
  size(1280, 720);
 
  minim = new Minim(this);
 
  // this loads mysong.wav from the data folder
  song = minim.loadFile("Mix3.mp3");
  song.play();
  
  myMovie = new Movie(this, "1.mov");
  myMovie.speed(0.5);
  myMovie.loop();
  myMovie2 = new Movie(this, "2.mov");
  myMovie2.speed(1);
  myMovie2.loop();
  myMovie3 = new Movie(this, "3.mov");
  myMovie3.speed(1);
  myMovie3.loop();
  myMovie4 = new Movie(this, "4.mov");
  myMovie4.speed(1);
  myMovie4.loop();
  myMovie5 = new Movie(this, "5.mov");
  myMovie5.speed(1);
  myMovie5.loop();
  myMovie6 = new Movie(this, "6.mov");
  myMovie6.speed(1);
  myMovie6.loop();
  myMovie7 = new Movie(this, "7.mov");
  myMovie7.speed(1);
  myMovie7.loop();
  myMovie8 = new Movie(this, "8.mov");
  myMovie8.speed(1);
  myMovie8.loop();
  myMovie9 = new Movie(this, "9.mov");
  myMovie9.speed(1);
  myMovie9.loop();
  myMovie10 = new Movie(this, "10.mov");
  myMovie10.speed(1);
  myMovie10.loop();
  myMovie11 = new Movie(this, "11.mov");
  myMovie11.speed(1);
  myMovie11.loop();
  myMovie12 = new Movie(this, "12.mov");
  myMovie12.speed(1);
  myMovie12.loop();
  myMovie13 = new Movie(this, "13.mov");
  myMovie13.speed(1);
  myMovie13.loop();
  myMovie14 = new Movie(this, "14.mov");
  myMovie14.speed(1);
  myMovie14.loop();
  myMovie15 = new Movie(this, "15.mov");
  myMovie15.speed(1);
  myMovie15.loop();
  myMovie16 = new Movie(this, "16.mov");
  myMovie16.speed(1);
  myMovie16.loop();
  myMovie17 = new Movie(this, "17.mov");
  myMovie17.speed(1);
  myMovie17.loop();
  myMovie18 = new Movie(this, "18.mov");
  myMovie18.speed(1);
  myMovie18.loop();
  myMovie19 = new Movie(this, "19.mov");
  myMovie19.speed(1);
  myMovie19.loop();
  myMovie20 = new Movie(this, "20.mov");
  myMovie20.speed(1);
  myMovie20.loop();
}
 
void draw()
{
  background(0);
  image(myMovie, 0, 0);
  if (mousePressed == true) {
    image(myMovie5, 320, 0);
  } else {
  image(myMovie2, 320, 0);
  }
  image(myMovie17, 640, 0);
  if (mousePressed == true) {
    image(myMovie14, 960, 0);
  } else {
  image(myMovie4, 960, 0);
}
  
  if (mousePressed == true) {
    image(myMovie18, 0, 240);
  } else {
  image(myMovie6, 0, 240);
  }
  image(myMovie7, 320, 240);
  if (mousePressed == true) {
    image (myMovie20, 640, 240);
  } else {
  image(myMovie8, 640, 240);
  }
  image(myMovie9, 960, 240);
  
  image(myMovie10, 0, 480);
  if (mousePressed == true) {
    image(myMovie15, 320, 480);
  } else {
  image(myMovie11, 320, 480);
  }
  image(myMovie3, 640, 480);
  if (mousePressed == true) {
    image(myMovie16, 960, 480);
  } else {
  image(myMovie13, 960, 480);
  }
  
  if (mousePressed == true) {
  PFont font;
  font = loadFont("CoolveticaRg-Regular-48.vlw");
  textFont(font);
  String message = "the camera is always rolling always rolling always rolling always rolling always rolling always rolling";
  String message2 = "always rolling always rolling always rolling always rolling always rolling always rolling always rolling";
  fill(255, 80);
  text(message, 0, 240);
  text(message2, -25, 720);
  text(message2, -100, 480);
  }
  
 
  
}
 
void stop()
{
  song.close();
  minim.stop();
 
  super.stop();
}

