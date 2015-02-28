
// very simple demonstration of classes 
// and arrays
//
// prints out the x and y coordinates of
// wherever you click

int i = 0;

// "Point" is a class name I made up to hold
// data for an individual point on the screen
// the [] indicates that I'm declaring a 
// variable of type "array".  So this line
// declares an array p of type Point with 
// 100 slots for x/y coordinates
Point[] p = new Point[100];

void setup() {

}

// this is my definition for 'Point'.  it
// holds data in its own x and y that reflects
// the x and y coordinate of the point
// this is basically a data type that I'm
// just making up.  kind of like 'color'
// which already exists in Processing
class Point {
    int x;
    int y;

    // this is the 'constructor' that says
    // what happens when we declare an 
    // object of type Point.  whenever I do
    // I'll set the initial x and y right then
    Point(int x1, int y1) {
        x = x1;
        y = y1;
    }     
}


void draw() {
}
    

void mousePressed() {
    // whenever the mouse is pressed, this
    // line creates a new Point object in the
    // array p and stores the mouse location
    p[i] = new Point(mouseX,mouseY);
    
    // this is how I access data in the array
    // p[i] means find the Point data in 
    // the array at index i (say 0, 1, etc.)
    // then access that data with the dot "."
    // operator, such as p.x, p.y.
    println("clicked: "+p[i].x+","+p[i].y);
 
    // increment our array index
    i++;
}

