
float[] x = new float[8];
float[] y = new float[8];
float module = 20;
int dizzx = 0;
int dizzy = 0;
int splashx = 660;
int splashy = 350;


void setup() {
  size(900, 650);
  strokeWeight(20.0);
  noStroke();
}

void draw() {
  background(0);
   fill(50,144,200);
     puddle();
  fill(120,150,100);
  dragSegment(7,x[6],y[6]);
  fill(150,175,100);
  dragSegment(6,x[5],y[5]);
  fill(120,150,100);
  dragSegment(5,x[4],y[4]);
  fill(150,175,100);
  dragSegment(4,x[3],y[3]);
  fill(120,150,100);
  dragSegment(3,x[2],y[2]);
  fill(150,175,100);
  dragSegment(2, x[1], y[1]);
  fill(120,150,100);
  dragSegment(1, x[0], y[0]);
  fill(200,70,50);
  head(0, mouseX, mouseY);
  }
    
    
 void puddle() {
   ellipse(splashx,splashy,150,400);
   splashx = 660;
   splashy = 350;
    if (abs(mouseX - 630) < 95 &&
      abs(mouseY - 350) < 200) {
    splashx += random(-5, 5);
    splashy += random(-5, 5);
  }
 }
 
    void head(int seg, float xshift, float yshift) {
  float dx = xshift - x[seg];
  float dy = yshift - y[seg];
  float angle = atan2(dy, dx);  
  x[seg] = xshift - cos(angle) * module;
  y[seg] = yshift - sin(angle) * module;
  seghead(x[seg], y[seg], angle);
}

void seghead(float x, float y, float angle) {
  pushMatrix();
  translate(x, y);
  rotate(angle);
  ellipse(dizzx,dizzy, 100, 100);
   fill(255);
  ellipse((dizzy-16),(dizzy-12),10,10);
  ellipse((dizzy+36),(dizzy-12),10,10);
  popMatrix();
   if (mouseX > 350) {        //dizzy
    dizzx += random(-7, 7);
    dizzy += random(-7, 7);
    }
}


void dragSegment(int seg, float xshift, float yshift) {
  float dx = xshift - x[seg];
  float dy = yshift - y[seg];
  float angle = atan2(dy, dx);  
  x[seg] = xshift - cos(angle) * module;
  y[seg] = yshift - sin(angle) * module;
  segment(x[seg], y[seg], angle);
}

void segment(float x, float y, float angle) {
  pushMatrix();
  translate(x, y);
  rotate(angle);
  ellipse(dizzx,dizzy, 100, 100);
  popMatrix();
  dizzx = 0;
  dizzy = 0;
   if (mouseX > 350) {        //dizzy
    dizzx += random(-7, 7);
    dizzy += random(-7, 7);
    }
}
