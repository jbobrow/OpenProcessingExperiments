
float x = 101;
float y = 101;
float xspeed = 10;
float yspeed = 5;
float t = 0;

void setup() {

  size(400, 400);
  background(0);
  rectMode(CENTER);
  
}

void draw() {

  display();
  move();
  edgebounce();

 
}

void move() {
  
  x = x + xspeed;
  y = y + yspeed;
  

}

void display() {

  t = t + 0.1;
  float c  = noise(t);
  c = map(c,0,1,0,255);
  stroke(200,70,c);
  fill(200,70,c);
  rect(x, y, 7, 7);
  
}

void edgebounce() {
  
   if (x > 300 || x < 100) {

    xspeed = xspeed * -1;
  }

  if (y > 300 || y < 100) {

    yspeed = yspeed * -1;
  }
  
}
