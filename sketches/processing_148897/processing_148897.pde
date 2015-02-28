
String[] movingtext = {
  "Press the mouse to see the mouse",
  "press W, A, S or D to change filters",
};

PFont f;
PImage webImg;
float x;
int lol = 0;

void setup() {
 size(750,750);
 f = createFont("Georgia", 60);
 x = width;
 String url = "http://media.salon.com/2012/11/shutterstock_57341071-458x307.jpg";
 webImg = loadImage(url, "jpeg");
}

void draw(){
  background(255);
  fill(4);
  textFont(f,16);
  text(movingtext[lol],x,180); 
  x = x - 2;
  float derp = textWidth(movingtext[lol]);
  if (x < -derp) {
    x = width;
    lol = (lol + 5) % movingtext.length;
  } 
  if (mousePressed)
 {
  image(webImg, 0, 0);
 }
 
 if (keyPressed) {
 if (key == 'w' || key == 'W')
 {
 filter(THRESHOLD);
 }
 }
 
  if (keyPressed) {
 if (key == 'a' || key == 'A')
 {
 filter(INVERT);
 }
 }
 
  if (keyPressed) {
 if (key == 's' || key == 'S')
 {
 filter(ERODE);
 }
 }
 
  if (keyPressed) {
 if (key == 'd' || key == 'D')
 {
 filter(POSTERIZE, 4);
 }
 }

}
