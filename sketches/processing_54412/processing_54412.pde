

//using the same technique that’s been learned in class
ArrayList drawing = new ArrayList();
// the ArrayList is like a bucket. Information can be thrown in and taken out. It is much more flexible than and Array[]



void setup(  ) {// void setup is to set the canvas where the sketch is going to take place.

size(900,900);// The size is setting up the canvas size.
background(0);// The background color of the canvas is black. The color the Processing is using is RGB.
smooth();//smooth edges


}


void draw(  ) { //this code runs what is going to be sketched in the canvas


stroke(490, random(710,325), random(30,375),30);
//The stroke will control the size and the color of the line that is going to be drawn on the canvas.



}

void mouseDragged() {//add a new point  // check to see if there are other close points 
// if so, draw line conecting to theme connecting  them. When the mouse is dragged through the canvas, a line will be created.
  PVector theline = new PVector(mouseX, mouseY); //new PVector Creating a line  which is called the line and can it can be controlled using the mouse.

    drawing.add(theline); //Adding the line into the arrayList
    
    for (int i=0; i<drawing.size(); i++) {//‘For’ is a loop where the line is controlled 
    //so it will control the distance of each line that will be drawn onto the canvas.


    PVector l = (PVector) drawing.get(i); // get the line so that it can be drawn
    
    float distance = theline.dist(l); //This controls the distance between each line


    if (distance < 90) { // If tells the computer that when the distance between each line is less than 90 
    //then draw the line to connect the it.


     line(l.x,l.y, theline.x,theline.y );  // Drawing the line  within the X and Y axis.
      
    }
  }
}

