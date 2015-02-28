

int num = 800;
PImage pic;
Path[] myPath = new Path [num];
 
//sets background and picture
void setup () {
  size (290,290);
  background (255);
  pic = loadImage("Bob.jpg");//uploads Bob Marley to the drawing
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
  int a= int(random(width));  //placement of "a" coordinate
  int b= int(random(height)); //placement of "b" coordinate
  
  
 
   
  
   
  void update() {
  a = a + int(random(2,2));
  b = b + int(random(0,0)); //makes the path horizontal
  }
   
  void display() {
    color uhhh = pic.get(a,b);//gets colors from image behind
    stroke (uhhh);
    point (a,b);
    strokeWeight(random(3)); //sets random dot size between 1 and 3
  }
}

//


