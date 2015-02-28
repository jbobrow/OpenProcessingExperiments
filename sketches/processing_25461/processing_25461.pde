
// made by inheeKim
// changed pixel as star shape
PImage img;
PImage img_s;
star s;
int pointillize = 16;
int x, y;

void setup() {
  size(490,490);
  img = loadImage("spring.jpg");
  img_s = loadImage("spring_s.jpg");
  image(img, 0, 0);
  background(255);
  smooth();
}

void draw() {
  stroke(255);
  strokeWeight(3);
  noFill();
  image(img_s, 0, 0);
  rect(0, 0, 100, 100);
  
  int x = int(random(img.width));
  int y = int(random(img.height));
  int loc = x + y*img.width;
  
  loadPixels();
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  
  noStroke();
  fill(r,g,b,200);

  int nSides = int(random(5, 10));
  float proportion = random(0.1, 0.9) * cos(PI / nSides);
  int radius = int(random(6, 15));
  s = new star(nSides, x, y, radius, proportion);
  s.display();
}

class star {
  int n;
  float x, y, w, h, startAngle, proportion;
  
  star(int n, float cx, float cy, float r, float proportion) {
    this.n = n;
    this.x = cx;
    this.y = cy;
    this.w = 2.0 * r;
    this.h = 2.0 * r;
    this.startAngle = 0.0;
    this.proportion = proportion;
  }
  
  void display() {
    if (n > 2)
    {
      float angle = TWO_PI/ (2 *n);  // twice as many sides
      float dw; // draw width
      float dh; // draw height
      
      w = w / 2.0;
      h = h / 2.0;
      
      beginShape();
      for (int i = 0; i < 2 * n; i++)
      {
        dw = w;
        dh = h;
        if (i % 2 == 1) // for odd vertices, use short radius
        {
          dw = w * proportion;
          dh = h * proportion;
        }
        vertex(x + dw * cos(startAngle + angle * i),
          y + dh * sin(startAngle + angle * i));
      }
      endShape(CLOSE);
    }
  }
}


