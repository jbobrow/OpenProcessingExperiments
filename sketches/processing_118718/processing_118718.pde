
Ball []Balls=new Ball[4];
int a=0;
void setup() {
  size(500, 500);
  smooth();
  for (int i=0;i<Balls.length;i++) { // initial state, end condition. string - unsure; step 
    Balls[i]= new Ball();
  }
}

void draw () {
  background(255);
  for (int i=0;i<Balls.length;i++) {
    Balls[i].display();
    Balls[i].move();
  }
}
void keyPressed() {
  if (keyCode == ENTER) {
    saveFrame("screen-####.jpg");
  }
}
void mouseClicked(){
}
  
class Ball {
  float dia;
  float x;
  float y;
  boolean xhit;
  boolean yhit;

  Ball() {
    x = random(0+dia/2, 500-dia/2);
    y = random(0+dia/2, 500-dia/2);
    dia=random(10,50);
  }

  void display() {
    strokeWeight(1);
    fill(200, 0, 0);
    ellipse(x, y, dia, dia);
  }
  void move() {
    if (xhit==true) {
      x-=1;
    }
    if (xhit==false) {
      x+=1;
    }
    if (yhit==true) {
      y-=1;
    }

    if (yhit== false) {
      y+=1;
    }

    if (x>=width-dia/2) {
      xhit=true;
    }
    if (y>=height-dia/2) {
      yhit=true;
    }

    if (x<=0+dia/2) {
      xhit=false;
    }
    if (y<=0+dia/2) {
      yhit=false;
    }
  }
}



