

PImage room;

void setup() {

  size(1200, 800);
  smooth();
  noLoop();
  room = loadImage("room.jpg");
  imageMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  }

  void draw () {

    background(255);
    image(room, width/2, height/2);
    for (int i=100; i <width; i += 160) {

      float a = random(20, 0);
      color b = color(random(0, 360), 50, 68);
      closet(i, height/6, a, b);
    }
  }

void closet ( int x, int y, float z, color c)
 {
   fill(c);
   pushMatrix();
   strokeWeight(2);
   scale(random(0.2,3));
   translate(x,y/2);
   //leftdoor
   rect(39,23, 60, 150);
   //rightdoor
   rect(100, 23, 60, 150);
   //bottom
   rect(39, 180, 120, 120);
   
   popMatrix();
   
 }
 
 
void mousePressed()
{
   redraw();
}

