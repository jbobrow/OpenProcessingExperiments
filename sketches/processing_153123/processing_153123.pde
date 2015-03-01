
Circle[] circles;
// add back in int numCircles = 50;
int s = 10;
PVector savedMouse; //The saved mouse position
int numCircles = 5;


void setup() {
  size(300, 300);
  smooth();
  background(0, 0, 20);
  savedMouse = new PVector(mouseX, mouseY); //Initialize the PVector

  

  // create an array and fill it with fixed circles
  circles = new Circle[5];
  circles[0] = new Circle(60,160, 20);
  circles[1] = new Circle(10,10, 20);
  circles[2] = new Circle(100,30, 20);
  circles[3] = new Circle(140,89, 20);
  circles[4] = new Circle(290,290, 20);

}

  
void draw() {
  // clear background
  
  // update and display the circles
  for (int i=0; i< numCircles; i++) { 
  circles[0].display();
    if (dist(circles[i].x, circles[i].y, mouseX, mouseY) < s) {
    fill(255);
    circles[i+1].display();
    }
  }
  

  // look of the lines
  stroke(255, 100);
  strokeWeight(0.5);

  for (int i=0; i< numCircles; i++) {
    // compare circle to other circles
      // draw line if distance is below 'radius of Circle'
      if (dist(circles[i].x, circles[i].y, mouseX, mouseY) < s) {
      savedMouse.x = mouseX; //Save the mouse position;
      savedMouse.y = mouseY;

      }
 
     
     else if (dist(circles[i].x, circles[i].y, savedMouse.x, savedMouse.y) < s) {
      noFill();
      
       
       //line(circles[i+1].x, circles[i+1].y, savedMouse.x, savedMouse.y);
       line(savedMouse.x, savedMouse.y, circles[i+1].x, circles[i+1].y);
       //line(circles[i].x, circles[i].y, savedMouse.x, savedMouse.y);

      
      }
      }

}


class Circle {
  float x, y, dia;

  Circle(float x, float y, float dia) {
    this.x = x;
    this.y = y;
    this.dia = dia;
  }


  void display() {
    // code for drawing the circles
    noStroke();
    fill(0, 255, 0, 30);
    ellipse(x, y, dia, dia);
  }
}
