
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
    translate(0,0,z); 
    if (form<2) {
      noStroke();
      fill(r,g,b,c-150);
      ellipse(x,y,c/15-s,c/15-s);
      fill(r,g,b,c-50);
      ellipse(x,y,c/25-s/2,c/25-s/2);
    }
    if (form>2) {
      noStroke();
      rectMode(CENTER);
      fill(r,g,b,c-150);
      rect(x,y,c/15-s,c/15-s);
      fill(r,g,b,c-50);
      rect(x,y,c/25-s/2,c/25-s/2);
    }
  }
}



