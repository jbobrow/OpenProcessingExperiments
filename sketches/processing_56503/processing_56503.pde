
Animal am;
Cats cs1, cs2, cs3;
PImage gameover;
PImage opening;
float cx, cy;    //cheese position

float ny;

int mode = 1;
void setup() {

  size(600, 600);
  smooth();
  am = new Animal(0, 60, 150);
  cx=random(width);
  cy=random(height);
  cs1 = new Cats(random(100, 600), random(100, 50), 100);
  cs2 = new Cats(random(100, 600), random(100, 500), 100);
  cs3 = new Cats(random(100, 600), random(100, 500), 100);
  gameover = loadImage("gameover.png");
  opening = loadImage("opening.jpg");
}

void draw() {

  if (mode == 1) {
    mode1();
  }
  else if (mode == 2) {
    mode2();
  }
  else if (mode == 3) {
    mode3();
  }
}



//void mousePressed() {
//  if (mode == 1) {
//    mode2();
//  }
//
//  if (mode == 3) {
//    mode1();
//  }
//}



//void cheese() {
//  fill(254,174,3);
//  //ellipse(cx,cy,40,40);
//  noStroke();
//  beginShape();
//  vertex(cx,cy);
//  vertex(cx+40,cy+20);
//  vertex(cx+20,cy+40);
//  endShape();
//  if(dist(mouseX,mouseY,cx,cy)<50){ //randomize cheese
//      cx=random(width-50);
//      cy=random(height-50);
//  }
//}
//  
//  class Animal
//{
//   float x, y;
//   float mass;
//   Animal(int tx, int ty, float tm)
//   {
//      mouseX = tx;
//      mouseY = ty;
//      mass = tm;
//   }
//}
//
//
//
//
//
//class Cats {
//  float x, y;
//  float mass;
//  float ny;
//  float xspeed, yspeed;
//
// 
//  Cats(float tx, float ty, float tm)
//  {
//    x = tx;
//    y = ty;
//    mass = tm;
//    xspeed = 8;
//    yspeed = 6;
//  }
//}
//
//  void update()
//  {
//    x += xspeed;
//    y += yspeed;
//    //wall bouncing
//    if (  x >= width-(mass/2) || x <= (mass/2)  )
//      xspeed *= -1.0;
//    if (  y >= height-(mass/2) || y <= (mass/2)  )
//      yspeed *= -1.0;
//  }
// 
//  void check(Animal am)
//  {
//    float d = dist(mouseX, mouseY, x, y);
//    if (d <=  85)
//    {
//      println("HIT!");
//      stroke(255, 0, 0);
//      strokeWeight(5);
//      noFill();
//      rect(0, 0, width-1, height-1);
//
//        mode3();
//    }
//  }
//  
//   void update()
//  {
//    x += xspeed;
//    y += yspeed;
//    //wall bouncing
//    if (  x >= width-(mass/2) || x <= (mass/2)  )
//      xspeed *= -1.0;
//    if (  y >= height-(mass/2) || y <= (mass/2)  )
//      yspeed *= -1.0;
//  }
// 
//  void check(Animal am)
//  {
//    float d = dist(mouseX, mouseY, x, y);
//    if (d <=  85)
//    {
//      println("HIT!");
//      stroke(255, 0, 0);
//      strokeWeight(5);
//      noFill();
//      rect(0, 0, width-1, height-1);
//
//       gameOver();
//    }
//  }
//  
//  void mode1() {
//  
//  image(opening, 600, 600);
//}
//  





