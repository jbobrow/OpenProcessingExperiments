
Polygon p;

float radius = 20;
int steps = 2000;
float theta = 0.0;
float ellipseRadius = 2;
int count = 200;
color c = color(220, 5);

void setup(){
  size(600, 600);
  background(180, 20, 180);
  translate(width/2, height/2);
  for(int j=0; j<count; j++){
    for (int i=0; i<steps; i++){
      noStroke();
      fill(c);
      ellipse(cos(theta)*radius, sin(theta)*radius,
              ellipseRadius, ellipseRadius);
      theta += PI/200;
      radius += theta/140;
      ellipseRadius += .05;
    }
    //translate(20, 20);
    scale(0.6); //must be <0.6 to run without error
    
  }
}



void draw(){
  stroke(220, 220, 0, 20);
  noFill();
  //Polygon(int sides , float radius)
  p = new Polygon(int(random(4,8)),random(20, 500));
  translate(width/2, height/2);
  p.display();
}
class Polygon{
  int sides;
  float radius;
  
  float[] x;
  float[] y;
  
  PVector[] vecs;
  
  Polygon(){
  }

  Polygon(int sides , float radius){
    this.sides = sides;
    this.radius = radius;
    init();
  }
  void init()
  {
    x = new float[sides];
    y = new float[sides];
    vecs = new PVector[sides];
    
    float theta = 0.0;
    
    for(int i = 0; i < sides; i++){
      float c = cos(theta)*radius;
      float s = sin(theta)*radius;
      x[i] = c;
      y[i] = s;
      vecs[i] = new PVector(c, s);
      theta += TWO_PI/sides;
    }
  }
  //uses drawing methods
  void display(){
     beginShape();
     for(int i = 0; i<sides;i++)
     {
       vertex(vecs[i].x, vecs[i].y);
     }
     endShape(CLOSE);
  }
}



