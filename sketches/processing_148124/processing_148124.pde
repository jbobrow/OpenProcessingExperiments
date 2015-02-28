
Circle[] circles =  new Circle[6];//creates 6 circles

void setup() {
  size(600,805);
  background(0);
  smooth();
  frameRate(1);
  for (int i=0; i < circles.length; i++) {
    circles[i]= new Circle (int (random(200,400)), int (random(150,650)));
  }
}

void draw() {
  background(0);
  for (int i=0; i < circles.length; i++) {
    //for loop to initialiaze array, 4 lines become one line, 
    //telling it to display/ change
    circles[i].display();
   
  }//end loop
}//end draw

class Circle {
  float cx;
  float cy;
  float h;
  float s;
  float b;
  float opacity;
  float dia;
  int howMany;


  Circle(int centerX, int centerY) {
    cx= centerX;
    cy= centerY;
    h= random (130, 180);
    s= random (50, 150);
    b= random (50, 150);
    //h= 161;
    //s= 84;
    //b= 150;
    opacity= 35;
    //dia= random(20, 400);
    howMany= 6;
  }//end circle

  void display() {
    for (int i = 0; i < howMany; i++) {
      Circle circles= new Circle(int (random(200,475)), int (random(200,663)));
      //circle1
      noFill();
      stroke(161, 84, 150);
      fill(h, s, b, opacity);
      //circle1
      dia= random(10, 290); 
      ellipse(cx, cy, dia, dia);
      circles= (Circle[]) append(circles, Circle);
      //circle2
      /*dia= random(111, 210);
      ellipse(cx, cy, dia, dia);
      //circle3
      dia=random(10, 110); 
      ellipse(cx, cy, dia, dia);*/
    }
  }
}



