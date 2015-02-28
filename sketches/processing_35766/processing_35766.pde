
/**
 * Adapted bouncing effect from the sketch linked below.
 * http://wwww.openprocessing.org/visuals/?visualID=20121
 */

int sizes = 60;
float ypos = 200;
float xpos = 350;

float x_current = 350;
float y_current = 200;

float dsitXfinal = 0;
float distYfinal = 0;

float ease; //force

float bouncetime = 0;
float bouncetotal = 100;

float velx = 0;
float vely = 0;

void setup() {
  size(700,400);
  background(0);
}

void draw() {
  smooth();
  background(0);
  stroke(92,85,232,50);
  fill(92,85,232,50);
  ellipse(xpos,ypos,sizes,sizes);
  strokeWeight(2);
  //line(350,200,xpos,ypos);
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
  line(187.5,0,xpos,ypos);
  line(537.5,0,xpos,ypos);
  line(187.5,400,xpos,ypos);
  line(537.5,400,xpos,ypos);
  line(268.75,0,xpos,ypos);
  line(431.25,0,xpos,ypos);
  line(268.75,400,xpos,ypos);
  line(431.25,400,xpos,ypos);
  line(0,50,xpos,ypos);
  line(0,150,xpos,ypos);
  line(0,250,xpos,ypos);
  line(0,350,xpos,ypos);
  line(700,50,xpos,ypos);
  line(700,150,xpos,ypos);
  line(700,250,xpos,ypos);
  line(700,350,xpos,ypos);
  line(100,0,xpos,ypos);
  line(600,0,xpos,ypos);
  line(100,400,xpos,ypos);
  line(600,400,xpos,ypos);
  line(300,0,xpos,ypos);
  line(400,0,xpos,ypos);
  line(300,400,xpos,ypos);
  line(400,400,xpos,ypos);
  
  if (mousePressed == true) {
    xpos = mouseX;
    ypos = mouseY;

  } else {
    float accelerationX = 0.05 * (350 - xpos);
    float accelerationY = 0.05 * (200 - ypos);
    println(accelerationX);
    
    velx = 0.9 * (velx + accelerationX);
    vely = 0.9 * (vely + accelerationY);
    
    xpos = xpos + velx;
    ypos = ypos + vely;
  }
}


