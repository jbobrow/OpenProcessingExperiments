

//  SETTINGS
final int numofBalls = 100;
int radius = 50;
float vQuant = 20;
//  END OF SETTINGS

Ball[] balls;

//  precalculated to get things faster
//  1/(r^4)
float radius4rev = 1.0/(radius*radius*radius*radius);
//  r^2
float radius2    = radius*radius;

void setup() {
  size(500, 400);
  balls = new Ball[numofBalls];
  for (int i=0; i<numofBalls; i++) {
    balls[i] = new Ball(random(width), random(height));
  }
  background(0);
}

void draw() {
  println(frameRate);
  fill(0, 50);
  rectMode(CORNER);
  rect(0, 0, width, height);


  for (int i=0; i<numofBalls; i++) {
    balls[i].update();
  }
  
  for (int i=0; i<numofBalls; i++) {
    pushMatrix();
    translate(balls[i].x+radius, balls[i].y-radius);
    rotate(millis()/500.0);
    image(balls[i].graph, -radius, -radius);
    popMatrix();
  }
  
}


class Ball {
  float x, y; //position
  float a;    //angle of motion
  float v;    //velocity value
  color c;    //color
  PGraphics graph;
  
  Ball(float x, float y) {
    this.x = x;
    this.y = y;
    this.a = random(TWO_PI);
    this.v = vQuant/frameRate;
    this.c = color(randomColor(), randomColor(), randomColor());
    graph  = createBall();
  }

  int randomColor() {
    return(int(random(4))*63);
  }

  void update() {
    x+=v*cos(a);
    y+=v*sin(a);

    if (x>width) { 
      x-=width;
    }
    if (y>height) { 
      y-=height;
    }
    if (x<0) { 
      x+=width;
    }
    if (y<0) { 
      y+=height;
    }

    a+=random(-0.1, 0.1);
  }
  
  
  PGraphics createBall() {
    PGraphics g = createGraphics(2*radius, 2*radius, P2D);
    g.beginDraw();
    
//    g.background(244,10);
    
    g.loadPixels();
    for(int x=0; x<2*radius; x++) {
      int yMin = (int)(-sqrt(radius*radius-pow((x-radius), 2))+radius);
      int yMax = (int)( sqrt(radius*radius-pow((x-radius), 2))+radius);
//      int yMax = (int)( sqrt(radius*radius-(radius/2-x)*(radius/2-x)));
      for (int y=yMin; y<yMax; y++) {
        int p = y*g.width + x;
        float d = dist(x, y, radius, radius);
        float v = pow((d*d-radius2), 2)*radius4rev;
//        g.pixels[p] = color(rP+v*red(balls[i].c), 0, bP+v*blue(balls[i].c));
        g.pixels[p] = color(v*randomColor(),v*randomColor(),v*randomColor(), v*200);
//        g.pixels[p]=color(255);
      }
    }
    g.updatePixels();
    g.endDraw();
    return(g);
  }
  
  
  
  
  //To archive, work and delete
  void lol() {
    loadPixels();
    for (int i=0; i<numofBalls; i++) {
      for (int x = (int)balls[i].x-radius; x<balls[i].x+radius; x++) {
        int yMin = (int)(-sqrt(radius*radius-pow((x-balls[i].x), 2))+balls[i].y);
        int yMax = (int)( sqrt(radius*radius-pow((x-balls[i].x), 2))+balls[i].y);
        for (int y=yMin; y<yMax; y++) {
          int p = y*width + x;
          //keep 'p' in range of pixels array:
          p = p<0? p+pixels.length : (p>pixels.length-1? p-pixels.length : p);
          // R G B
          int rP = pixels[p] >> 16 & 0xFF;
          //int gP = pixels[p] >>  8 & 0xFF;
          int bP = pixels[p]       & 0xFF;
          float d = dist(x, y, balls[i].x, balls[i].y);
          //////////////////////////////////
          //         ( d^2 - r^2 )^2
          //    v =  ---------------
          //               r^4
          //////////////////////////////////
          float v = pow((d*d-radius2), 2)*radius4rev;
          pixels[p] = color(rP+v*red(balls[i].c), 0, bP+v*blue(balls[i].c));
        }
      }
    }
    updatePixels();
  }
  
}


