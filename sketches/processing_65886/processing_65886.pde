
// project 1

Blob myBlob1;
Blob myBlob2;
Blob myBlob3;

int blobxsize;
int blobysize;
int rand;

void setup() {
  size(500,500);
  myBlob1 = new Blob (color(255),0,50,2);
  myBlob2 = new Blob (color(0,255,0),0, 200,5);
  myBlob3 = new Blob (color(0,0,255),0,400,3);
}

void draw() {
  background(0);
  rand = color(random(255));
  myBlob1.drive();
  myBlob1.display();
  myBlob1.dirchange();
  myBlob2.drive();
  myBlob2.display();
  myBlob2.dirchange();
  myBlob3.drive();
  myBlob3.display();
  myBlob3.dirchange();
}
class Blob {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float rand;
 
  
  Blob(color tempC, float tempXpos, float tempYpos, float tempXspeed) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed; 
  }
  void display () {
    fill(c);
    stroke(255);
    ellipseMode(CENTER);
    ellipse(xpos,ypos,10*blobxsize,10*blobysize);
  }
  
  void drive() {
   if (ypos > width) {
     ypos = 0;
   }
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0; }
  }
  void dirchange() {
    if (mousePressed) {
     ypos = ypos + 1;
     blobxsize = 10;
     blobysize = 10;
     c = color(random(255));
   } else {
     blobxsize = 1;
     blobysize = 1;
     c = color(255,0,0);
   }
  }

}

