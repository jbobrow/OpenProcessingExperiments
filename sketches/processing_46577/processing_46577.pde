
int r = int(random(50,200));
int g = int(random(50,200));
int b = int(random(50,200));
int r2;
int g2;
int b2;
float x,x2,px;
float y,y2,py;
float w,rw,rw2;
float angle = 0;

void setup()  {
  size(600,500);
  background(r,g,b);
  smooth();
  rw2 = random(10,300);
}

void draw()  {
  
  if (mousePressed){
   x = random(0,width);
   x2 = random(0,width);
   y = random(0,height);
   y2 = random(0,height);
   w = random(2,10);
   strokeWeight(w);
   line(x,0,x2,height);
   stroke(0);
   strokeWeight(w);
   line(0,y,width,y2); }
  else {}
  if (keyPressed) {
    noStroke();
    fill(255);
    px = random(mouseX-75,mouseX+75);
    py = random(mouseY-75,mouseY+75);
    rw = random(5,50);
    ellipse(px,py,rw,rw);  
  }
}

