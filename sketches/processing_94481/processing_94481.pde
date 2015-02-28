
//As I wanted to rotate the objects made with my brush
//I use arraylist.
ArrayList brushes;

void setup() {
  size(600, 600);
  frameRate(100); //make my program update fast
  brushes = new ArrayList();
}

void draw() {
  background(255);
  for (int i = brushes.size()-1 ; i>= 0; i--) {
    Brush sunbrush = (Brush) brushes.get(i);

    sunbrush.display();

  }
  if (mousePressed) {
    brushes.add(new Brush(mouseX, mouseY, 0.6));
  }
}

//make a class
class Brush {
  float xVal;
  float yVal;
  float size;
  float angle;
  int life = 200;

  Brush( float temp_xVal, float temp_yVal, float temp_size) {
    xVal = temp_xVal;
    yVal = temp_yVal;
    size = temp_size;
  }

  void display() {
    pushMatrix();
    
    strokeWeight(10);
    translate(xVal, yVal);
    scale(size);
    angle = angle + radians((mouseY+mouseX)/100+2);//angle value interacts with mouse position
    rotate(angle);
    life = life-1;//objects start to diappear when time goes by
   
   //brush object
    stroke(200, xVal/2, yVal/2, life);
    point(0, -40);
    point(40, 0);
    point(0, 40);
    point(-40, 0);

    point(20*sqrt(2), -20*sqrt(2));
    point(20*sqrt(2), 20*sqrt(2));
    point(-20*sqrt(2), 20*sqrt(2));
    point(-20*sqrt(2), -20*sqrt(2));

    point(0, 0);

    //face
    //noFill();
    //ellipse(0, 0, 50, 50);
    // point(-10, -5);
    //point(10, -5);
    // strokeWeight(4);
    //arc(0, 0, 20, 20, 1, PI-1);
    popMatrix();
  }

}
