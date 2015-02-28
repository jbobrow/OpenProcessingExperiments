



//// TIM SUGLIAN ////
/// UCLA DMA 28 ///

PImage eye_cord, eye_cord2, eye_white, eye_pupil, face, nose, snot, top_lip, bottom_lip, tounge, mouth, origins, space, glow; 
Eye e1, e2;

float d;
float targetD;
float easing = .01;
float x, y, targetX, targetY;
float bigger;
float xmap, xmap2;
float eye_map1, eye_map2, snot_map, lip_map, tounge_map, tounge_shake;

int startTime;

void setup () {
  size(480,320);
  smooth();
  noStroke();
  ellipseMode(CENTER);
  eye_cord = loadImage("eyecord.png");
  eye_cord2 = loadImage("eyecord2.png");
  eye_white = loadImage("eye_whites.png");
  eye_pupil = loadImage("eye_pupil.png");
  nose = loadImage("nose.png");
  face = loadImage("face.png");
  snot = loadImage("snot.png");
  top_lip = loadImage("top_lip.png");
  bottom_lip = loadImage("bottom_lip.png");
  tounge = loadImage("tounge.png");
  mouth = loadImage("mouth.png");
  origins = loadImage("origins.png");
  space = loadImage("space.png");
  glow = loadImage("glow.png");
  e1 = new Eye(240,110,75);
  e2 = new Eye(200,110,75);
  startTime = millis();
}

void draw() {
  background(255);
  if(millis() < 3000 + startTime) {
    image(origins,-2,-85);
  }


  else {
    image (space,-84,-105);
    eye_map1 = map(mouseX,0,480,300,400);
    eye_map2 = map(mouseX,0,480,180,80);
    snot_map = map(mouseY,0,300,120,158);
    lip_map = map(mouseY,0,320,206,199);
    tounge_map = map(mouseY,0,300,220,195);
    if(tounge_map < 199)
      tounge_shake = 196+(random(-.5,.5));
    else
      tounge_shake = 196;

    image (glow,75,-25,340,390);
    image (face,118,10,250,300);
    image (snot,200,snot_map,75,110);
    image (nose,175,60,150,175);
    image (mouth,216,215,75,90);
    image (top_lip,186,lip_map,132,102);
    image (tounge,tounge_shake,tounge_map,100,125);
    image (bottom_lip,185,224,133,117);

    pushMatrix();
    fill(0);
    ellipse(300,110,60,60);
    ellipse(180, 110,60,60);
    popMatrix();

    xmap = map(mouseX,240,480,240,335);
    image (eye_cord, 265, 75, xmap/2, 95);

    xmap2 = map(mouseX,0,480,80,240);
    image (eye_cord2, 210, 10, (-xmap2)/2, 165);

    targetX = mouseX;
    x = x + ((targetX - x) * easing);
    targetY = mouseY;
    y = y + ((targetY - y) * easing);
    e1.update(x,y);
    e2.update(x,y);
    e1.display();
    e2.display2();
  }

}

class Eye
{
  float ex, ey;                 
  float size;
  float angle = 0.0;

  Eye(float x, float y, float s) {        
    ex = x;
    ey = y;
    size = s;
  }

  void update( float mx, float my) {    //takes inpute from mouse
    angle= atan2(my-ey, mx-ex);         //subtracts position defined in void draw from mouse position
  }

  void display() {

    d = eye_map1; 
    bigger = map(mouseX,20,220,size, size+ random(.5,1.0));  

    pushMatrix ();
    fill (255);
    translate (0, ey);
    image (eye_white, d-41, -42, bigger+10, bigger +10);            //large ellipse
    popMatrix ();
    pushMatrix();
    translate (d, ey);
    rotate (angle);
    fill(168,107,72);
    ellipse(size/6, 0, size/2, size/2);    //middle size ellipse
    fill(0);
    ellipse(size/6, 0, size/4, size/4);    //small ellipse
    popMatrix();
  }

  void display2() {

    d = eye_map2;   

    pushMatrix ();
    fill (255);
    translate (0, ey);
    image (eye_white, d-41, -42, bigger+10, bigger+10);            //large ellipse
    popMatrix ();
    pushMatrix();
    translate (d, ey);
    rotate (angle);
    fill(168,107,72);
    ellipse(size/6, 0, size/2, size/2);    //middle size ellipse
    fill(0);
    ellipse(size/6, 0, size/4, size/4);    //small ellipse
    popMatrix();

  }
}



