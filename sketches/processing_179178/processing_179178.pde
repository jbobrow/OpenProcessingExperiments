
Butterfly[] myButterfly=new Butterfly[1];
float r=0;
float theta=0;
void setup() {
  size(400, 400);
  background(255);
  smooth();
  for (int i=0;i<myButterfly.length;i++) {
    myButterfly[i] = new Butterfly(random(40, width-40), random (40, height-40), 255, 10, 15);
  }
}
void draw() {
  for (int i=0; i<myButterfly.length;i++) {
    myButterfly[i].move();
    myButterfly[i].display();
  }
}
class Butterfly {
  float x, y; 
  //float speedx,speedy;
  float r;
  float a;
  color cr;
  color cg;
  color cb;
  Butterfly(float xpos, float ypos, color tempColorR, color tempColorG, color tempColorB) {
    x=xpos;
    y=ypos;
    cr=tempColorR;
    cg=tempColorG;
    cb=tempColorB;
  }
  //speedx = noise(atime)*2; // Pick a random speed
  //speedy= noise(atime)*2;
  void move() {
    x=x+r*cos(theta);
    y=y+r*sin(theta);
    theta += 0.5;
    r+=0.5;
    
  }
  void display() {
    noFill();
    stroke(cr, cg, cb);
    bezier(x, y-a*50, x+a*10, y-a*70, x+a*20, y-a*75, x+a*40, y-a*80);
    bezier(x, y-a*50, x-a*10, y-a*70, x-a*20, y-a*75, x-a*40, y-a*80);
    fill(cr, cg, cb);
    bezier(x, y-a*50, x+a*10, y-a*25, x+a*10, y+a*25, x, y+a*50);
    bezier(x, y-a*50, x-a*10, y-a*25, x-a*10, y+a*25, x, y+a*50);
    //fill(220,230,255);
    bezier(x+a*5, y-a*25, x+a*25, y-a*58, x+a*65, y-a*60, x+a*75, y-a*60);
    bezier(x-a*5, y-a*25, x-a*25, y-a*58, x-a*35, y-a*60, x-a*75, y-a*60);
    //fill(200,205,255);
    bezier(x-a*75, y-a*60, x-a*67, y-a*10, x-a*55, y+a*3, x-a*20, y+a*10);
    bezier(x+a*75, y-a*60, x+a*67, y-a*10, x+a*55, y+a*3, x+a*20, y+a*10);
    //fill(250,200,255);
    bezier(x+a*20, y+a*10, x+a*40, y+a*10, x+a*55, y+a*50, x+a*50, y+a*50);
    bezier(x-a*20, y+a*10, x-a*40, y+a*10, x-a*55, y+a*50, x-a*50, y+a*50);
    //fill(255,200,220);
    bezier(x+a*50, y+a*50, x+a*50, y+a*55, x+a*15, y+a*48, x+a*5, y+a*30);
    bezier(x-a*50, y+a*50, x-a*50, y+a*55, x-a*15, y+a*48, x-a*5, y+a*30);
    //fill(255,0,190);
    ellipse(x+a*45, y-a*80, a*7, a*7);
    //fill(255,0,190);
    ellipse(x-a*45, y-a*80, a*7, a*7);
    //fill(205,255,200);
    //stroke(255);
    triangle(x+a*10, y-a*25, x+a*75, y-a*60, x+a*20, y+a*10);
    triangle(x-a*10, y-a*25, x-a*75, y-a*60, x-a*20, y+a*10);
    //fill(255,255,160);
    triangle(x+a*20, y+a*10, x+a*5, y+a*30, x+a*50, y+a*50);
    triangle(x-a*20, y+a*10, x-a*5, y+a*30, x-a*50, y+a*50);
    //fill(255);
    triangle(x-a*20, y+a*10, x-a*5, y+a*30, x-a*10, y-a*25);
    triangle(x+a*20, y+a*10, x+a*5, y+a*30, x+a*10, y-a*25);
    a +=0.001;
    cg++;
    cb++;
  }
}





