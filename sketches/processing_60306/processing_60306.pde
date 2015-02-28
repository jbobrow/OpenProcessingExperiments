
PImage img;
PImage b;
int i =0;
Point[] p = new Point[1000];



import processing.video.*;


Capture myCapture;

boolean gotnew = false;

int framenumber=0;

void setup() 
{
  size(1499, 1129);
  img = loadImage("map.jpg");


  smooth();

  myCapture = new Capture(this, 400, 300, 30);
}

class Point {
  int x;
  int y;
  int framenumber; 

  Point(int x1, int y1, int f1) {

    x = x1;
    y = y1;
    framenumber = f1;
  }
}

void captureEvent(Capture myCapture) {
  myCapture.read();
}

void draw() {
   background(255);
  imageMode(CORNER);
  image(img, 0, 0);


  strokeWeight(5);

  for (int i=0; i < framenumber ; i ++) {
    point (p[i].x, p[i].y);
   
  }
  for (int i =0; i< framenumber; i++) {


    if ((mouseX > p[i].x-5 && mouseX < p[i].x+5) && (mouseY > p[i].y-5 && mouseY < p[i].y+5)) {

      String filename = p[i].framenumber +".png";
      b = loadImage(filename);
       
      imageMode(CENTER);
      image(b, mouseX, mouseY);
           
      //println("got a match");
    }
  }
}



void mousePressed() { 

  myCapture.save(framenumber+".png");
  stroke(0);
  strokeWeight(5);
  point(mouseX, mouseY);  
  
  p[framenumber] =
    new Point (mouseX, mouseY, framenumber );
    framenumber++;
  println("framenumber = 0 so storing and saving a new frame");
}















//void mouseClicked(){
//  for(int i =0; i< framenumber; i++){
//    if(mouseX == p[i].x && mouseY == p[i].y){

//    println(p[i].framenumber+".png");


//}}}

//void mouseReleased(){
//  for(int i =0; i< framenumber; i++){
// if((mouseX > p[i].x-5 && mouseX < p[i].x+5) && (mouseY > p[i].y-5 && mouseY < p[i].y+5)){

// String filename = p[i].framenumber-1 +".png";
// b = loadImage(filename);
// image(b, 1250, 75);}}}


