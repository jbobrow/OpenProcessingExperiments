
PImage img;
int step = 10, num=0, sz=20;

void setup() {
  img=loadImage("http://media-cache-ec0.pinimg.com/736x/63/13/80/631380ba46df3bbd4ea0648a3c2d192f.jpg");
  size(img.width, img.height);
  background(0);
  noStroke();
  strokeCap(SQUARE);
  strokeWeight(5);
  //image(img,0,0);

  while (sz<width-10) {
        num += 4;
    for (int i=0; i<num; i++) {
      noFill(); 
      float slice = TWO_PI/num;
      float slice2 = slice*.55;
      float r =TWO_PI/num*i;
      int x = int(width/2 + cos(r)*sz/2);
      int y = int(height/2.4 + sin(r)*sz/2);
      color c = img.get(x, y);
      pushMatrix();
      translate(width/2, height/2.4);
      rotate(r);
      stroke(c);
      arc(0, 0, sz, sz, -slice2, slice2 );
      popMatrix();
    }

    sz += 15 ;
  }
}

void drawPoint(float x, float y, float noiseFactor, float offSet) {
  float sz = noiseFactor*step;
  color f = img.get(int(x), int(y));
  fill(f, 100);
  ellipse(x+offSet, y+offSet, sz, sz);
}

void draw() {
}

void keyPressed() {
  save(random(23232)+".jpg");
}
