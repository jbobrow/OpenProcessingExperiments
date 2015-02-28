
 
int nCircles = 1; //number of circles at the beginning of the program
 
Circle[] circles = new Circle[nCircles]; // Declare an array of objects. 
// The number of elements in the array in this case is 1  because nCircles = 1
 
void setup() { 
  // Standard Setup 
  size(500, 500); 
  noStroke(); 
  smooth(); 
 
  // Construct the first circle 
  circles[0] = new Circle(250, 250, 400);   

  
} 
 
void draw(){ 
   background(255); 
  for (int i = 0; i < circles.length; i++) { 
    circles[i].display(); 
  } 
} 
 
void mousePressed(){ 
   //boolean skip = false;  This an example of a "toggle" though it doesn't work for this particular sketch
  for (int i = 0; i < circles.length; i++) { 
    if(dist(mouseX, mouseY, circles[i].x, circles[i].y) < circles[i].d/2){ 
      create(circles[i].x, circles[i].y, circles[i].d); 
      kill(i);
      // skip = true;  Another component of the toogle
      //break; // and another
    } 
  } 

  } 
 
// if (!skip) {  Also part of the toggle
//   
// }
// 
 void create(float xpos, float ypos, float diameter){ //these are also temporary variables. Each function needs 
  //its own unique temporary variables. 
     smooth(); 
    Circle c = new Circle(xpos-diameter/4, ypos-diameter/4, diameter/2.2); 
    Circle e = new Circle(xpos-diameter/4, ypos+diameter/4, diameter/2.2); 
    Circle f = new Circle(xpos+diameter/4, ypos-diameter/4, diameter/2.2); 
    Circle g = new Circle(xpos+diameter/4, ypos+diameter/4, diameter/2.2); 
    //We append to the already existing array a new element, just like you would write y = y+5
    circles = (Circle[]) append(circles, c); 
    circles = (Circle[]) append(circles, e); 
    circles = (Circle[]) append(circles, f); 
    circles = (Circle[]) append(circles, g); 
  }  
  
    void kill(int victim) {//"victim" is another temporary variable
    if(circles.length>0){
     for (int i=victim; i<circles.length-1; i++) {
      circles[i] = circles[i+1];
     } 
     circles = (Circle[]) shorten(circles);
    }
  }
 
class Circle { 
  float x, y, d; // Class variables 
 
  // Contructor 
  Circle(float _x, float _y, float _d) { 
    x = _x; 
    y = _y; 
    d = _d; 
  } 
 
 
  

 
  void display() { 
     smooth(); 
    fill(0); 
    ellipse(x,y,d,d); 
  } 
 
} 
 
 

