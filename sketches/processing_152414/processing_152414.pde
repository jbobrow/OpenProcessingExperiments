
Circle[] circles;
// add back in int numCircles = 50;
int s = 10;
PVector savedMouse; //The saved mouse position
PVector newMouse;


void setup() {
  size(300, 300);
  smooth();
  background(0, 0, 20);
savedMouse = new PVector(60, 160); //Initialize the PVector
newMouse = new PVector(0, 0); //Initialize the PVector
  

  // create an array and fill it with fixed circles
  circles = new Circle[5];
  circles[0] = new Circle(60,160, 20);
  circles[1] = new Circle(10,10, 20);
  circles[2] = new Circle(100,30, 20);
  circles[3] = new Circle(140,89, 20);
  circles[4] = new Circle(290,290, 20);

}

  void mouseClicked() {  
  newMouse.x = mouseX; //Save the mouse position;
  newMouse.y = mouseY;
  println("Current saved mouse position: " + newMouse.x + ", " + newMouse.y); //Prit the saved mouse position
  
  
  }
  
void draw() {
  // clear background
  
  // update and display the circles
  for (int i=0; i< 5; i++) { 
    circles[i].display();
  }
  

  // look of the lines
  stroke(255, 100);
  strokeWeight(0.5);

  for (int i=0; i< 5; i++) {
    // compare circle to other circles
      // draw line if distance is below 'radius of Circle'
      if (dist(circles[i].x, circles[i].y, mouseX, mouseY) < s) {
      savedMouse.x = mouseX; //Save the mouse position;
      savedMouse.y = mouseY;
      // println("Current saved mouse position: " + savedMouse.x + ", " + savedMouse.y); //Prit the saved mouse position
      //line(newMouse.x, newMouse.y, savedMouse.x,  savedMouse.y);
     
      }
 
     
     else if (dist(circles[i].x, circles[i].y, newMouse.x, newMouse.y) < s) {
      noFill();
       // curve(random(-0.1, 0.1), random(-0.1, 0.1), newMouse.x, newMouse.y, savedMouse.x,  savedMouse.y, random(-0.1, 0.1),random(-0.1, 0.1));
       
       line(newMouse.x, newMouse.y, savedMouse.x, savedMouse.y);
       redraw();
      
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
