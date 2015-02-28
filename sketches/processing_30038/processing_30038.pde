
Bubbles [] bb = new Bubbles[200];
int gl = 30; // glass edge
int diameter= 10;

void setup(){
  size(500, 500);
  smooth();
  for (int i = 0; i< bb.length; i++){
    float x = random((0+gl+diameter), (width-gl-diameter));
    float y = random(-100, width-30);
    bb[i] = new Bubbles(x, y);
  }
}

void draw(){
  background(200);
  line(gl, gl, gl, height-gl);
  line(gl, height-gl, width-gl, height-gl);
  line(width-gl, height-gl, width-gl, gl);
  for (int i=0; i<bb.length; i++){
    bb[i].moveAndDisplay();
  }
}

class Bubbles{
  float x;
  float y;
  int diameter=10;
  float speed=1.5;
  
  Bubbles(float tempX, float tempY){
  x= tempX;
  y= tempY;
  }
  void moveAndDisplay (){
    y-=random(0, 1.5*speed); //kun y rykkes
    fill(255);
    if (y>30){
    ellipse(x, y, diameter, diameter);
    } else {
    y=height-(gl+diameter);
  }
  }
}


