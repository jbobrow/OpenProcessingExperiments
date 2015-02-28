
//Mariana Moreno- Gonzalez
//April 3, 2012
//Math, Programming & Art:
//Nick Lally
//WK 12 HW: Running Stitches

Circle[] circles;
float angle;
int directionx;
int directiony;


void setup (){
  angle = 0;
  smooth ();
  noFill();
  stroke (255);
  strokeWeight (.25);
  size (600,600);
  background (0);
  circles= new Circle [50];
  for (int i = 0; i < circles.length; i++){
    circles [i] = new Circle (random (600), 0);
  }
  directionx=1;
  directiony=1;
}

void draw (){
  fill (random(100), 5);
  rect (0,0,width,height);
  for (int i = 0; i < circles.length; i++){
    circles[i].move();
    circles[i].display();
  }
}

class Circle{
  float x,y;
  Circle (float _x, float _y){
    x= _x;
    y= _y;
  }
  void move (){
    x += directionx;
    y += directiony;
    if(y > 600){
      directiony=-1;
    }
    if(x > 600){
      directionx=-1;
    }
    if(y < 0){
      directiony=1;
    }
    if(x < 0){
      directionx=1;
    }
  }
  void display (){
    float glowLight = sin (radians (angle));
    glowLight = map (glowLight, 0,0,0,255);
    fill (glowLight);
    ellipse (x,y,5,5);
    angle++;
  }

}

