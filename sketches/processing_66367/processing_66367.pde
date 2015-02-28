
int bola1X = 0;  
int bola1Y = 150;
int bola2X = 150;  
int bola2Y = 50;
int vel1X = 5;
int vel1Y = 5;
int vel2X = 5;
int vel2Y = 5;
int radio1 = 30; 
int radio2 = 35;

void setup() {
  size(350, 400);
}

void draw() {
  background(200, 240, 150);

  bola1X =  bola1X + vel1X;
  bola1Y =  bola1Y + vel1Y;
  bola2X =  bola2X + vel2X;
  bola2Y =  bola2Y + vel2Y;

  // CONDITONAL FOR BORDER
  if ((bola1X > width) || (bola1X < 0)) {
    vel1X = vel1X *-1;
  }
  if ((bola1Y > height) || (bola1Y < 0)) {
    vel1Y = vel1Y *-1;
  }

  if ((bola2X > width) || (bola2X < 0)) {
    vel2X = vel2X *-1;
  }
  if ((bola2Y > height) || (bola2Y < 0)) {
    vel2Y = vel2Y *-1;
  }

// CONDITONAL FOR COLIDING BALLS 
if((dist(bola1X,bola1Y, bola2X,bola2Y)<= (radio1+radio2)/2)){
    vel1Y = vel1Y *-1;
    vel2Y = vel2Y *-1;

}

  // BALLS 
  noStroke();
  fill(20, 50, 100, 200);
  ellipse(bola1X, bola1Y, radio1, radio1);

  noStroke();
  fill(100, 200);
  ellipse(bola2X, bola2Y, radio2, radio2);
}



