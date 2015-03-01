
/*
creative coding; place sketch
 */

float speed = 50; //rate that the "ship" moves forward
float xMin, xMax, yMin, yMax; //max min width height of universe
float eyeX, eyeY, eyeDX, eyeDY; //perspective point
float warp=255; //warp factor; cued by acceleration

int scnt = 500;
ArrayList<Planet> planets;

void setup() {
  size(800, 600); 
  background(0);
  noStroke();
  xMin = -width*5;
  xMax = width * 6;
  yMin = -height * 5;
  yMax = height * 6;

  eyeDX = eyeX = width/2;
  eyeDY = eyeY = height * .4;

  planets = new ArrayList<Planet>();
  //set up initial sky
  for (int i = 0; i < scnt; i++) {
    planets.add(new Planet(random(xMin, xMax), random(yMin, yMax), 10000 - 200 * i, random(100, 1000), eyeX, eyeY));
  }
}

void draw() {
  if (mousePressed) {
    eyeDX = mouseX;
    eyeDY = mouseY;
    speed+=.05;
    warp = lerp(1,warp,.99);
  } else {
    speed*=.99;
    if (speed <1) {
      speed = 1;
    } 
    warp = lerp(255,warp,.999);
  }
  fill(0,warp);
  rect(0,0,width,height);
  matchEye(10);
  advShip(speed);
  for (int i =planets.size ()-1; i > -1; i--) {
    planets.get(i).setEye(eyeX, eyeY);
  }
  if (planets.size() < scnt && speed > random(10)) {
    genPlanets(ceil(random(1, scnt/50)));
  }
}

void genPlanets(int cnt) {
  for (int i = 0; i < cnt; i++) {
    planets.add(new Planet(random(xMin, xMax), random(yMin, yMax), 10000, random(100, 1000), eyeX, eyeY));
  }
}

void advShip(float sp) {
  for (int i = 0; i < planets.size (); i++) {
    planets.get(i).move(sp);
    if (!planets.get(i).testVis()) {
      planets.remove(i);
      i--;
      //println(i);
    }
  }
}

//matches eye level to desired eye level by a factor of speed
void matchEye(float sp) {
  float fac = sp/100;
  fac/=10;
  if (fac > 1) {
    fac = 1;
  } 
  eyeX = lerp(eyeX, eyeDX, fac);
  eyeY = lerp(eyeY, eyeDY, fac);
}

class Planet {
  float x, y, z; //spatial coordinates
  boolean isStar = true; //true if star (only displays white; size * 10, more offset
  float size; //diameter of circle at 0 z
  float psize; //display size
  float px, py; //display coordinates 
  float eyeX,eyeY; // independant eye line
  color col; //color
  //constructor
  Planet(float x_, float y_, float z_, float s_, float ix_, float iy_) {
    px = x = x_;
    py = y = y_;
    z = z_;
    psize = size = s_;
    eyeX = ix_;
    eyeY = iy_;
    if(random(10) < 5){
       isStar = false;
      size/= 10; 
      col = color(random(128), random(128), random(128));
    } else{
      col = color(230 + random(25), 230 + random(25), 230 + random(25));
    }
    
  }

  void display() {
    fill(col);
    psize = size /sqrt(z);
    ellipse(px, py, psize, psize);
  }

  //decrements z value

    void move(float val) {
    z-=val;
    if (z <=1) {
      z = 1;
    }
     px = lerp(x,eyeX,z/10000);
     py = lerp(y,eyeY,z/10000);
  }
  //checks if planet is still visible
  boolean testVis() {
    if (z <= 1) {
      return false;
    }
    if (px + psize/2 < 0 - width/2 || px - psize/2 > width * 1.5) {
      return false ;
    }
    if (py + psize/2 < 0 - height/2 || py - psize/2 > height * 1.5) {
      return false;
    }
    return true;
  }
  //sets eye level
  void setEye(float ix, float iy){
     eyeX = ix;
      eyeY = iy;
      display();
  }
}



