
/* Reference organic (something with rules) to translate to 
   code
*/

Walker w;
Walker w1;
Walker w2;

void setup() {
  size(500,500);
  smooth();
  w = new Walker();
  w1 = new Walker();
  w2 = new Walker();
  background(0);
  //frameRate(12);
}

void draw() {
 w.step();
 w.display();
 w1.step();
 w1.display();
 w2.step();
 w2.display();
}

class Walker {
  int x;
  int y;
  
  Walker() {
    x = width/2;
    y = height/2;
  }
  
  void display() {
  stroke(255,50);
  fill(10);
  strokeWeight(2);
  ellipse(x,y,20,20);
}

void step() {
  float r = random(1);
  if (r < 0.4) {
      x+=2;
    } else if (r < 0.5) {
      x-=2;
    } else if (r < 0.6) {
      y+=2;
    } else {
      y-=2;
    }
  }
}



