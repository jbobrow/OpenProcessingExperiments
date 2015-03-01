
//John Delf-Montgomery
// 09/15/14
// Dr. Hamid
// 24HR house
// sun moving throughout the day with darkness
int houseW = 300;
int houseH = 175;
int roofH = int(random(75, 200) ) ;
int xa = 125;
int ya = 250;
int xb = xa+ houseW;
int yb = ya;
int xc = xa + houseW/2;
int yc = ya - roofH;
float darkness = 250;
boolean gettingLighter = true;
int speed = 5;
int moveX = 10;
int moveY = 10;
void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
void setup () {
  size(500, 500);
}
void draw() {
  background(135, 206, 250);  
  fill(#EA9513);
star( moveX, moveY,  50,  100,  10);  
      fill(#FABD23);
  ellipse( moveX, moveY, 150, 150);
  

  // set 'moveX' to 'moveX + 100'
  moveX = moveX + 1;
  moveY = int( 100 - sin(radians(moveX)/2) * 50 );
  //println(moveX);

  noStroke();
  fill(#CB0E12);  
  rect(xa, ya, houseW, houseH);

  stroke(0);
  fill(#1406C1);  
  rect(275, 332, 50, 100);

  noStroke();
  fill(#5A594E);   
  triangle(xa, ya, xb, yb, xc, yc);

  noStroke();
  fill(34, 139, 34); 
  ellipseMode(CENTER);
  ellipse(250, 500, 800, 200);

  //fill(#FABD23);
 // ellipse( moveX, moveY, 150, 150);

  // set 'moveX' to 'moveX + 100'
  //moveX = moveX + 1;
  //moveY = int( 100 - sin(radians(moveX)/2) * 50 );
  //println(moveX);


  fill(0, darkness);
  rect(0,0,width,height);

  //println(darkness); 
    if (gettingLighter) {
  darkness = darkness - speed;
    if (darkness <= 0) {
     gettingLighter = false; 
   }
    } else {
    darkness = darkness + .4; 
   if (darkness >= 255) {
     gettingLighter = true; 
    }
   }
}



