
Mover[] m1 = new Mover[100];

void setup(){
  size(640, 480);
  background(0);
  for (int i = 0; i < 100; i++)
  {
    m1[i] = new Mover(int(random(width)), int(random(height)), int(random(7)+1));
  }
}

void draw(){
  background(0);
  for (int i = 0; i < 100; i++)
  {
    m1[i].display();
  }
}

class Mover {

  int x;
  int y;
  int speed;
  int diameter = 13;

  Mover(int _x, int _y, int _speed) {
    x = _x;
    y = _y;
    speed = _speed;
  }

  void display() {
    if(x<0 || x>width){
      speed *= -1;
    }
    
    if (abs(y-mouseY)<100 && abs(x-mouseX)<100)
    {
      diameter +=1;
    }
    else{
      diameter = 13;
    }
    
    x = x + speed;
    stroke(100, 50, 0);
    fill(random(50, 255), random(50, 255), random(50, 255));
    //fill(200, 100, 0);
    ellipse(x,y,diameter,diameter);
  }

}
