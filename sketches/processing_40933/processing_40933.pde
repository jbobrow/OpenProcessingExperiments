
int num = 200;
PImage img;
Path[] myPath = new Path [num];

void setup () {
  size (400, 300);
  background (0);
  img = loadImage("geometry.JPG");//image upload
  smooth ();

  for (int i=0; i<myPath.length; i++) { //setup for draw myPath
   myPath[i] = new Path();
 }
}

void draw () {
  for (int i=0; i < myPath.length; i++) { //increases object continuously
    myPath[i].update();
    myPath[i].display();
  }
}
class Path {
  int a= int(random(width)); // x possition of ellipse
  int b= int(random(height/50)); // y possition for ellipse


  void update() {
    b = b + int(random(2, 2)); //y possition increases + random integer
  }

  void display() {
    color picture = img.get(a, b);//gets colors from image
    noStroke();
    fill (picture);
    ellipse (a, b, random(2, 10), random(2, 10));
  }
}



