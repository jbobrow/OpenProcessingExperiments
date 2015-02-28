
/*
NATHAN STETTER
HW #6
*/
 
class Caterpillar {
  float x1;
  float y1;
  color c1;
   
  Caterpillar (float x, float y, color c) {
    x1 = x + 40;
    y1 = y + 40;
    c1 = c;
  }
   
  void display (float x, float y, color c) {
    //body
    fill(c, 60);
    ellipse(x, y + random(0,3), 40, 40);
    fill(c, 80);
    ellipse(x + 36, y + 2+ random(0,3), 42, 42);
    fill(c, 60);
    ellipse(x + 65, y - 1+ random(0,3), 38, 38);
    fill(c, 80);
    ellipse(x + 85, y + 4+ random(0,3), 40, 40);
    //head
    fill(255, 0, 0, 90);
    ellipse(x + 105, y - 12+ random(0,3), 20, 20);
    //antenna
    stroke(255, 0, 0);
    line(x + 100, y - 18, x + 96, y - 28);
    line(x + 108, y - 18, x + 110, y - 28);
    noStroke();
  }
   
  void move() {
    float r = random(0, 5);
    display(x1, y1, c1);
    x1 += r;
  }
  float position () {
   return x1 + 108;
  }
   
   void resetX(float x) {
      x1 = 0; 
   }
   
}
 
color c1 = color(0, 255, 0);
color c2 = color(0, 0, 255);
color c3 = color(0, 255, 255);
Caterpillar cat1;
Caterpillar cat2;
Caterpillar cat3;
float xpos = 0;
float ypos = 0;
PFont font; 

void setup(){
  size(600, 230);
  background(230, 249, 255);
  cat1 = new Caterpillar(xpos, ypos, c1);
  cat2 = new Caterpillar(xpos, ypos + 75, c2);
  cat3 = new Caterpillar(xpos, ypos + 150, c3);
  
  font = loadFont("Monospaced-48.vlw");
  textFont(font, 48);
}

void drawGrass() {
 for (int i = 0; i < width; i++) {
   stroke(100, 255, 0, 90);
   strokeWeight(1);
   line(i, 80, i, 80 - random(5, 10));
   line(i, 155, i, 155 - random(5, 10));
   line(i, 228, i, 228 - random(5, 10));
 } 
 noStroke();
}
 
void draw(){
  
  background(230, 249, 255);
  drawGrass();
  cat1.move();
  cat2.move();
  cat3.move();
   
   fill(255);
  if (cat1.position() > width) {
    background(c1);
    text("GREEN WINS!", 130, 110);
    noLoop();
  } else if (cat2.position() > width) {
    background(c2);
    text("NAVY WINS!", 140, 110);
    noLoop();
  } else if (cat3.position() > width) {
    background(c3);
    text("LIGHT BLUE WINS!", 80, 110);
    noLoop();
  }
  
   
}

void mousePressed() {
  cat1.resetX(0);
  cat2.resetX(0);
  cat3.resetX(0);
  loop();
}

void keyPressed() {
  noLoop();
  fill(100, 50);
  rect(0, 0, width,height);
  fill(255);
  text("PAUSE", 130, 110); 
}
void keyReleased() {
  loop();
  
}
