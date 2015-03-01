
color c = color(#FF0000);
float x = 90;
float y = 0;
float xspeed = -3;
float yspeed = 3;


void setup() {
  size(900, 850);
}

void draw() {
  background(#FF005E);
         ellipse(30,415,20,20);
       line(30,425,30,475);
       line(30,445,50,445);
       line(10,445,30,445);
       
  move();
  display();
}

void move() {
  y = y + yspeed;
  if (y > width) {
    y = 0;
  }
  x = x + xspeed;
   if (x < -2040) {
    x = 950;
   }
}

void display() {
  fill(c);
  rect(x, mouseY, 50, 100);
       rect(x+200,-mouseY+750, 50, 100);
       rect(x+400, mouseY, 50, 100);
       rect(x+600, -mouseY+750, 50, 100);
       rect(x+800, mouseY, 50, 100);
       rect(x+1000,-mouseY+750, 50, 100);
       line(30,475,x,495);
       line(30,475,x+30,495);
}


