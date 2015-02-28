
//Flashes by Yser C., licensed under Creative Commons Attribution-Share Alike 3.0 license.
//Work: http://openprocessing.org/visuals/?visualID=2373
//License: http://creativecommons.org/licenses/by-sa/3.0/

Flash[] flashes;
float t,maxSpeed;
float minSpeed = 1;

void setup() {
  size(400,600,P3D);
  background(0);
  maxSpeed = 5;
  flashes = new Flash[700];
  for(int i = 0; i<flashes.length; i++) { 
    flashes[i] = new Flash(random(-20,20));
  }
}
void draw() {
  background(0);
  camera(mouseX,mouseY, (height/2.0) / tan(PI*60.0 / 360.0), width/2.0, height/2.0, 0, 0, 1, 0);
  if (keyPressed && keyCode==UP) {
    maxSpeed+=0; //disabled speed change interactive
  }
  if (keyPressed && keyCode==DOWN) {
    maxSpeed-=0;
  }
  for(int i = 0; i<flashes.length; i++) {
  flashes[i].update();
  flashes[i].display();
  }
}

class Flash {

  float c,x,y,z;
  float s,r,g,b;
  int form;

  Flash(float tempZ) {
    z = tempZ;
    c = random(100); //the pausing of flashes
    x = random(width);
    y = random(100,height-100);
    s = random(5);
    r = random(255);
    g = random(255);
    b = random(255);
    form = ceil(random(3));  
  }
  void update() {
    if(c<0) {
      c = 255;
    }
    c-=random(minSpeed,maxSpeed); 
  } 
  void display() {
    if(c<=0) {
      x = random(width);
      y = random(100,height-100);   
    }
    translate(0,0,z); 
    if (form<2) {
      noStroke();
      fill(#FFAA00); //inside circle
      ellipse(x,y,c/15-s,c/15-s);
      fill(#FEFF00); //outer circle
      ellipse(x,y,c/25-s/2,c/25-s/2);
    }
    if (form>2) {
     noStroke();
      fill(#FFEA00);
      ellipse(x,y,c/25-s/2,c/25-s/2);
      fill(#FFBC00);
      ellipse(x,y,c/25-s/2,c/25-s/2);
      fill(#E9FF00);
      ellipse(x,y,c/25-s/2,c/25-s/2);
    }
  }
}

//Flashes by Yser C., licensed under Creative Commons Attribution-Share Alike 3.0 license.
//Work: http://openprocessing.org/visuals/?visualID=2373
//License: http://creativecommons.org/licenses/by-sa/3.0/

