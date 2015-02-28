
/**
 * Adapted bouncing effect from the sketch linked below.
 * http://wwww.openprocessing.org/visuals/?visualID=20121
 */
float velocity = 0.9;

float ypos = 200;
float xpos = 350;

float velx = 0;
float vely = 0;

void setup() {
  size(700,400);
  background(0);
}

void draw() {
  smooth();
  background(0);
  stroke(200,50);
  noFill();
  for (int circles=2200;
  circles>1;
  circles=circles-23){

  ellipse(xpos,ypos,circles,circles);}
  fill(200,50);
  ellipse(xpos,ypos,30,30);
  strokeWeight(2);
  line(0,0,xpos,ypos);
  line(0,400,xpos,ypos);
  line(700,0,xpos,ypos);
  line(700,400,xpos,ypos);
  line(350,0,xpos,ypos);
  line(350,400,xpos,ypos);
  line(0,200,xpos,ypos);
  line(750,200,xpos,ypos);
  line(0,100,xpos,ypos);
  line(0,300,xpos,ypos);
  line(750,100,xpos,ypos);
  line(750,300,xpos,ypos);
  line(170.5,0,xpos,ypos);
  line(537.5,0,xpos,ypos);
  line(170.5,400,xpos,ypos);
  line(537.5,400,xpos,ypos);
  line(268.75,0,xpos,ypos);
  line(431.25,0,xpos,ypos);
  line(268.75,400,xpos,ypos);
  line(431.25,400,xpos,ypos);
  if (mousePressed == true) {
    xpos = mouseX;
    ypos = mouseY;

  } else {
    float accelerationX = 0.08 * (350 - xpos);
    float accelerationY = 0.08 * (200 - ypos);

    velx = velocity * (velx + accelerationX);
    vely = velocity * (vely + accelerationY);
    
    xpos = xpos + velx;
    ypos = ypos + vely;
 }
  if (mousePressed && (mouseButton == RIGHT)) {
    velocity = 1;
  }
  if (mousePressed && (mouseButton == LEFT)) {
    
    velocity = 0.9;
    
  }
}

