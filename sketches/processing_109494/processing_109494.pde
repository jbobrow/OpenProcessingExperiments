
//Karam Byun
//Week 2, Wednesday 9-11
//Animating Ball and adding design that animates

//Setting up speed
//2,5
//5,10
//50,10
//40,100
//10,20

int xspd = 5;
int yspd = 10;

//Setting location of ball
int x = width/2;
int y = height/2;

void setup() {
  size(200, 800);
}

void draw() {
  // background(200);

  //Moving the ball
  x = x + xspd;
  y = y + yspd;
  //Bouncing the ball

  if (y > height || y < 0) {
    yspd = -yspd;
  }
  else if (x > width || x < 0) {
    xspd = -xspd;
  }

  //line animation following the bounce of ball
  stroke(10);
  //dotted bounce
  //line(y,x,y,x);
  line(y, x, x, y);
  line(y+30, x, x+30, y);

  //shaky rectangle
  noStroke();
  //ellipse(x, y, mouseX/2, 2);
  rect(x+random(0, 5), y+random(0, 5), 10, 10);
}
