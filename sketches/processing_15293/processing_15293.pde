
PImage sand;
PImage starfish;
PImage moss;

void setup(){
  size(800,800);
  sand= loadImage("Kelso.JPG");
  starfish= loadImage("2197632-lg.jpg");
  moss= loadImage("moss0003.jpg");
}
void draw(){
  background (255);
  tint(255,5,55,175);
  image( sand, 50,50);
  tint(173,255,42,88);
  image(starfish,50,50);
  tint(102,205,170,135);
  image(moss,50,50);}

