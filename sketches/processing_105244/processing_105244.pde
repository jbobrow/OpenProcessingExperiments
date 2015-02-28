
//BALL PIT VERSION 1 BY EVANDER!!!!!!!!!


int bx = 200;
int by = 200;
int velx = 8;
int vely = 10;

void setup () {
  size (600,600);

}

void draw () {
  background (20, 120 , 200);
  
  fill(100);
  triangle(80, 75, 80, 520, 525, 75);
  fill(180);
  triangle(520, 520, 80, 520, 525, 75);
  
  fill(200);
  rectMode(CENTER);
  rect(width/2, width/2, width/1.5, width/1.5);
  
  bx = bx + velx;
  by = by + vely;
  
  noStroke();
  fill(0);
  ellipse(bx, by, 20, 20);
  
    if (bx > 490 || bx < 105 ){
    velx = velx * -1;
  }
  
    if (by > 490  || by < 105 ){
    vely = vely * -1;
  }
  
  println(mouseX + " " + mouseY);

}
