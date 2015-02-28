
int b = 5;
int c = 100;
class Face {
  int s;
  float x = 100;
  float y = 100;
  color c = 100;
  int a = 20;

  Face(int measure, float xp, float yp, color col) {
    
    x=xp;
    y=yp;
 
  }
 
 
  void display() {

    ellipse(x, y, c, c);
    c = c + 1;
  }

  
  void shake() {
    x=x+random(a)-random(a);
  // a = a + 1;
    y=y+random(a)-random(a);
    //a = a + 1;
  }

//void mousePressed() {

//}
}
Face[] faces= new Face[b];
  

void setup() {
  size(700, 400);
  background(0);
  smooth();
  
 
  //stroke(255);
  noStroke();

  for (int i=0; i< faces.length; i++) {
    faces[i]= new Face(120, random(350, 350), random(200, 200), color(255, 255, 255,10));
  }
//noFill();
smooth();
fill(78,1,42,60);
}

void mouseDragged() {

 for (int i=0; i< faces.length; i++) {
   faces[i]= new Face(120, random(350, 350), random(200, 200), color(255, 255, 255,10));
 } 

}

//void mouseDragged() {

//    c = c + 1;
//}


void draw() {
  background(255);
  for (int i=0; i< faces.length; i++) {
    faces[i].display();
    faces[i].shake();
  }
}


