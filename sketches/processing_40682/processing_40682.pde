
//establish class and object path
int num = 50;
PImage myPic;
Path[] myPath = new Path [num];

//set up background and upload pic to be used as data for colors
void setup () {
  size (200,200);
  background (2,12,41);
  myPic = loadImage("lumbee.jpg");
  smooth ();

  for (int i=0; i<myPath.length; i++){
    myPath[i] = new Path();
  }
}

void draw () {
  for (int i=0; i < myPath.length; i++) {
    myPath[i].update();
    myPath[i].display();
  }
}
class Path {
  int x = int(random(width));
  int y = int(random(height));
  int a = int(random(0, myPic.width));
  int b = int(random(0, myPic.width));
  color cstroke = myPic.get(a,b);//get colors for object randomly from pic

  
  Path(){
  }
  
  void update() {
    x = x + int(random (-4,4));
    y = y + int(random (-4,4));
  }
  
  void display() {
    stroke (cstroke);
    point (x,y);
  }
}


