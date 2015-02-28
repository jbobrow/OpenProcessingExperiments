
int count=600;

Path[] myPath= new Path[count]; //sets up path

void setup() {
  size(200, 200);
  background(255);

  for (int i=0; i<myPath.length; i++ ) {
    myPath[i] = new Path();
  }

  smooth();
}


void draw() { 
  for (int i=0; i<myPath.length; i++ ) {
    myPath[i].update();
    myPath[i].draw();
  }
}
void mousePressed() {  //redraws road paths when pressed

    noStroke();
  rect(random(25, 40), 0, random(5, 10), height);  // streets/roads the emerge from traffic created by paths
  rect(0, random(25, 40), width, random(5, 10));
  rect(0, 100, width, random(20, 30));
}

class Path {

  float x= int(random(width));
  float y= int(random(height));
  float speed= 0;


  Path() {
  }

  void update() {

    y=y+speed; 

    x=x+int(random(-4, 4));
    y=y+int(random(-1, 1));

    if (y>50) {
      speed= speed* -0.85;  //slows the amount of points added to canvas in the y direction
    }
  }


  void draw() {

    point(x, y);   //creates the traffic
    stroke(150);
  }
}


