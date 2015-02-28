
/*
//    Line Forest
//    by Martin Melcher
*/

ArrayList Lifelines;

void setup() {
  size(720, 480, P3D);
  background(0);
  stroke(255);
  strokeWeight(2);
  Lifelines = new ArrayList();
  smooth();
}

void draw() {
  background(0);
  stroke(255);
  
  pushMatrix();
  //translate(width,0,0);
  
  Lifelines.add(new Lifeline(mouseX, height-100, -100, mouseX, height-100-random(height/2), -100,  random(5)));

  for (int i = Lifelines.size()-1; i >= 0; i--) {
    Lifeline l = (Lifeline) Lifelines.get(i); 
    l.display();
    l.move();
    if (l.finished()) {
      Lifelines.remove(i);
    }
  }
  popMatrix();
}

void keyPressed() {
    if(keyCode == ENTER) {
     saveFrame("line-######.png");
    } 
}

class Linie3D {
  float xpos, _xpos, xpos2, _xpos2;
  float ypos, _ypos, ypos2, _ypos2;
  float zpos, _zpos, zpos2, _zpos2;

  Linie3D(float _xpos, float _ypos, float _zpos, float _xpos2, float _ypos2,  float _zpos2) {
    xpos = _xpos;
    xpos2 = _xpos2;
    ypos = _ypos;
    ypos2 = _ypos2;
    zpos = _zpos;
    zpos2 = _zpos2;
  }

  void display() {
    fill(255);
    line(xpos, ypos, zpos, xpos2, ypos2, zpos2);
  }
}

class Lifeline extends Linie3D {
  float life, _life;
  float speed, _speed;

  Lifeline(float xpos, float ypos, float zpos, float xpos2, float ypos2, float zpos2, float _speed) {
    super(xpos, ypos, zpos, xpos2, ypos2, zpos2);
    speed = _speed;
    life = 320;
  } 

  void move() {

   zpos += 2;
   zpos2 = zpos;
   
   //ypos2 = abs(ypos2 + random(-5,5));
  }

  boolean finished() {
    life -= 2;
    if (life < 0) return true;
    else 
      return false;
  }
}
