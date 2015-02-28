
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/112158*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
ArrayList<Circle> circles; 

void setup(){

    size(800, 800);
    // Create an empty array list called circles that stores circle objects.
    circles = new ArrayList<Circle>();
}

void draw(){
    background(0);

    
     if (circles.size() > 1) {
        for (int i = 1; i < circles.size(); i++) {
            Circle c = circles.get(i);
            Circle cwaffle = circles.get(i-1);
                stroke(247,255,222);
                strokeWeight(4);
                line(c.x, c.y, cwaffle.x, cwaffle.y);
                stroke(216,255,103);
                strokeWeight(2);
                line(c.x, c.y, cwaffle.x, cwaffle.y);
                
            }
        }
    

    // Go through the array and call functions (display and grow) for each object.
    for (int i = 0; i<circles.size(); i++) {
        Circle c = circles.get(i);
        c.displayStroke();
        c.display();

    }
  

    // When the mouse is pressed, go to the last item in the array and call the grow function
    if (mousePressed) {
        circles.get(circles.size()-1).grow();
    }
}

// When the mouse is pressed add a new circle object to the array 'circles'
void mousePressed() {
    circles.add(new Circle());
    // Print the number of objects in the array list
    println(circles.size());
}

// Create a class called circle
class Circle {
    int x, y;   
    int previousX, previousY;
    float size;
    // Constructor
    // This runs when you create the object which is why…
    //…you need to set x & y to the mouse position and the size here…
    // and not in your functions.
    Circle() {
        // set x and y to mouseX and mouseY respectively.
        x = mouseX;
        y = mouseY;
    }

    // Function that, when called, displays the object
    void display() {
        fill(0);
        stroke(216,255,103);
        strokeWeight(2);
        ellipse(x, y, size, size);
    }

    void displayStroke() {
        noFill();
        stroke(247,255,222);
        strokeWeight(11);
        ellipse(x, y, size, size);
    }

    // Fucntion that, when called, sets the size of the circle to the…
    //…distance between the centre of the circle and the position of the mouse.
    void grow() {
        if (mousePressed) {
        size = (dist(x, y, mouseX, mouseY))*2;
        }
    }
}


