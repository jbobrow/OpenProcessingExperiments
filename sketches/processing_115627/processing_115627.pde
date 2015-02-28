
int numLines= 400;
Line[] lines = new Line[numLines];

void setup(){
  size(400,400);
  smooth();
  stroke(0);
  noFill();
  for (int i =1 ; i<lines.length;i+=10){
    float x = i+10;
    float y = random(2,5);
    float z = random(5,15);
    lines[i] = new Line(x,20,z,y);
  }
}

void draw(){
  noStroke();
  fill(255);
  rect(0,0,width,height);
  noFill();
  for (int i =1 ; i<lines.length;i+=10){
    lines[i].move();
    lines[i].display();
  }
}
class Line {
  float x, y;
  float diameter;
  float speed;

  Line(float xp, float yp, float dia, float sp) {
    x=xp;
    y=yp;
    diameter = dia;
    speed=sp;
  }

  void move() {
    y+=speed;
    if (y>height){
    y= y - (height+diameter);
    }
 
  }
  
  void display(){
    stroke(x,y,random(diameter));
    strokeWeight(diameter/3);
    rect(x,y,diameter,3*diameter,x);
  }
}
