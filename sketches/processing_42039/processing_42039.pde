
// variables
int x = 30;
int y = 100;
int i = 0;
int a = 0;
int c = 0;
int e = 0;

int speedX = 2;
int speedY = 2;


void setup() {
  size(400, 300);
}


void draw() {
  background(0);
  stroke(255);
  // dashed line
  for (int i = 5; i <= height; i = i + 20) {
    line(200, 10 + i, 200, i);
  }

  // print(y + " ");
  //println(c);

  println(x + "< 30 && "+ y +" > = " + c  +" && " + y +" <= "+ (c+20));

  if (x < 30 && y >= c  && y <= c+20) {
    speedX = speedX * -1;
    
    if (x < 360 && y >= e  && y <= e+20) {
    speedX = speedX * -1;
  }
  }
  // ball
  fill(255);
  rect(x, y, 10, 10);
  x = x + speedX;
  y = y + speedY;
  if (x > 380 || x < 0) {
    speedX = speedX * -1;
  }
  y = y + speedY;
  if (y > 280 || y < 0) {
    speedY = speedY * -1;
  }

  // player
  rect(20, c, 10, 20);
  if (keyPressed && key == 'n') {
    c= c + 2;
    rect(20, c, 10, 20);    
    if (c > 280 ||c  < 0) {
      c= 270;
    }
  }
  if (keyPressed && key == 'h') {
    c = c - 2;

    if (c < 0) {
      c = 10;
    }
  }

  // ball 2
  rect(370, e, 10, 20);
  if (keyPressed && key == 'g') {
    e=e+2;
    rect(370, e, 10, 20);
     if (e > 280 ||e  < 0) {
      c= 270;
    }
  }
if (keyPressed && key == 'b'){
    e=e-2;     
    if(e< 0){
      e=10;
    }
  }
 
}

                
                
