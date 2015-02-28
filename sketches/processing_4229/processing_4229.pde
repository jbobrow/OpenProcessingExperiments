
Flash[] flashes;
float t,maxSpeed;
float minSpeed = 2;

void setup() {
  size(400,600);
  background(0);
  //smooth();
  maxSpeed = 10;
  flashes = new Flash[1000];
  for(int i = 0; i<flashes.length; i++) { 
    flashes[i] = new Flash(random(-20,20));
  }
}
void draw() {
  background(0);
  if (keyPressed && keyCode==UP) {
    maxSpeed+=0.5;
  }
  if (keyPressed && keyCode==DOWN) {
    maxSpeed-=0.5;
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
    c = random(255);
    x = random(width);
    y = random(100,height-100);
    s = random(10);
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
    if (form<2) {
      noStroke();
      fill(#EDFF03);
      ellipse(x,y,c/15-s,c/15-s);
      fill(#EDFF03);
      ellipse(x,y,c/25-s/2,c/25-s/2);
    }
    if (form>2) {
      noStroke();
      fill(#EDFF03);
      ellipse(x,y,c/25-s/2,c/25-s/2);
      fill(#EDFF03);
      ellipse(x,y,c/25-s/2,c/25-s/2);
      fill(#E8F25F);
      ellipse(x,y,c/25-s/2,c/25-s/2);
    }
  }
}



