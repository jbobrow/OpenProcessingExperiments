
Ball[] balls;
final int numofBalls = 30;
int dimension;

//final int sizeConstant = 500;
int radius = 80;
final int maxColor = 30;

void setup() {
  size(600, 400);
  dimension = (int)sqrt(width*width + height*height);
  balls = new Ball[numofBalls];
  for(int i=0; i<numofBalls; i++) {
    balls[i] = new Ball(random(width), random(height));
  }
}

void draw() {
  println(frameRate);
//  background(0);
  fill(0,100);
  rectMode(CORNER);
  rect(0,0,width,height);
  loadPixels();
  
  for(int i=0; i<numofBalls; i++) {
//    println("i: "+i);
    for(int x = (int)balls[i].x-radius; x<balls[i].x+radius; x++) {
      int yMin = (int)(-sqrt(radius*radius-pow((x-balls[i].x),2))+balls[i].y);
      int yMax = (int)( sqrt(radius*radius-pow((x-balls[i].x),2))+balls[i].y);
//      you don't want to print that unless you have <10 balls
//      println(x+" "+yMin+" "+yMax);
      for(int y=yMin; y<yMax; y++) {
        int p = y*width + x;
        //keep 'p' in range of pixels array:
        p = p<0? p+pixels.length : (p>pixels.length-1? p-pixels.length : p);
        int rP = (int) red  (pixels[p]);
        int gP = (int) green(pixels[p]);
        int bP = (int) blue (pixels[p]);
        float value = maxColor;
        float d = dist(x,y,balls[i].x,balls[i].y);
        
        
        //         ( d^2 - r^2 )^2
        //    v =  ---------------
        //               r^4
        float v = pow((d*d-radius*radius),2)/(radius*radius*radius*radius);

        
        pixels[p] = color(rP+v*red(balls[i].c), gP+v*green(balls[i].c), bP+v*blue(balls[i].c));
//        pixels[p] = color(rP+v*1, gP+v*255, bP+v*1);
      }
    }
  }
  updatePixels();
  
  
  ellipseMode(CENTER);
  for(int i=0; i<numofBalls; i++) {
    fill(255,20);
    noStroke();
//    ellipse(balls[i].x, balls[i].y, 10, 10);
    balls[i].update();
  }
}



class Ball {
  float x, y;
  float a = random(TWO_PI);
//  float a = -HALF_PI;
  float v;
  float vQuant = 0.15;
  color c;
  Ball(float x, float y) {
//    this.pos = new PVector(x,y);
    this.x = x;
    this.y = y;
    c = color(randomColor(),randomColor(),0);
  }
  
  int randomColor() {
    return(int(random(3))*85);
  }
  
  void update() {
//    x+=random(-3,3);
//    y+=random(-3,3);
    x+=v*cos(a);
    y+=v*sin(a);
    
    v = vQuant*width/frameRate;
    
    if(x>width)  { x-=width; }
    if(y>height) { y-=height;}
    if(x<0)      { x+=width; }
    if(y<0)      { y+=height;}
    
    a+=random(-0.1,0.1);
  }
}

