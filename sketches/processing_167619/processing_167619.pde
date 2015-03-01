
float a, b, c;
float delta;


void setup(){
  size(800, 600);
  a = -5.0;
  b = -1.0;
  c = -2.0;
  delta = sq(b) - 4*a*c;
}

void draw(){
  background(10, 43, 125);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("The equation: " ,width/2, height/4);
  text(a + "x^2 + " + b + "x + " + c + " = 0", width/2, 3 * height/8);
  
  if(delta>0){
    text("has two solutions: x1 = " + (-b-sqrt(delta))/2/a + ", x2 = " + (-b+sqrt(delta))/2/a, width/2, height/2);
  }else if(delta == 0){
    text("has one real solution: x0 = " + (-b)/2/a, width/2, height/2);
  }else{
    text("has no real solutions", width/2, height/2);
  }
}


