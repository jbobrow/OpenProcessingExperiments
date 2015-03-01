
Spot sp;

ArrayList<Spot> spots;
void setup() {
  size(600, 600);
  smooth();
  noStroke();

  spots= new ArrayList<Spot>();

  for (int i=0; i<=100; i=i+1) {
    spots.add(new Spot(random(width), random(height), 10, 3, #0000ff));
  }
}

void draw() {
  fill(0, 50);
//rect(0, 0, width, height);


  for (int i=0; i<spots.size (); i++) {
    Spot s = spots.get(i);

    s.move();
    s.displayCircle();
  }
}

class Spot {
  float x, y;
  float diameter;
  float speed ; 
  color dog;


  int directionX=1;
  int directionY=1;

  Spot(float xpos, float ypos, float dia, float sp, color c ) {
    x=xpos;
    y=ypos;
    diameter=dia;
    speed=sp;
    dog= c;
  }

  void move() {
    y+= (speed * directionY*2);
    x+=(speed * directionX);
    if ((y>(height- diameter)) || (y<diameter/4)) {
      directionY *= -1;
    }

    if (x>width|| x<0) {
      directionX *= -1;
    }
  }

  void displayCircle() {

    fill(map(sqrt(sq(width/2-x)+sq(height/3-y)), mouseX, mouseY, 50, 255), //r
    map(sqrt(sq(width/3-x)+sq(height/2-y)), mouseX, mouseY, 50, 255),      //g
    map(sqrt(sq(width/1.5-x)+sq(height/2-y)), mouseX, mouseY, 50, 255)  //b
    );   
   
    ellipse(x, y, diameter, diameter);
  }
}



