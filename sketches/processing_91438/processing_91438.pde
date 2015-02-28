
//Lucy Barker
// Introduction to Digital Design, u 8196, Sem 1, Uni of Canberra 2013, MA Digital Design 103JA

// code adapted from bouncing ball demo by Mitchell Whitelaw

// demostrates loading an image, mouse interaction, ArrayLists and Custom Classes, Iteration and Functions with Arguements.

PImage img;//declare a variable to store an image

Ball myBall; // decalre a variable to store my object
ArrayList explosion = new ArrayList(); // make a new arraylist called 'explosion'


void setup() {
  size(1000, 800);//set the size of the window
  frameRate(40);//specify the frame rate here to change the speed at which the 'explosion' unfolds
  img = loadImage("nightsky2.jpg"); // load image 'nightsky.jpg' (saved in data folder) and set as value for variable img
 
}

void draw() {
colorMode(HSB); // change the colour mode to (hue, saturation, brightness)
imageMode(CENTER);//change the way the image is positioned by beig able to specify the centre points.
image(img,500,400);//draw the img variable ' nightsky' with the centre of the image at the centre of the window.
  noStroke();//no stroke to our balls
  PVector newpos = new PVector(mouseX, mouseY); //set our variable pVector 'newpos'at the position of the mouse.
  myBall = new Ball( newpos, random(120)); // set the variable myBall as a our object located at the position of the mouse with a random diameter of 0-120 pix.  Using the 2 paramenters or arguments set in our constructor on tour Class/object tab
  explosion.add(myBall); // add our new object 'myBall' to the Arraylist 'explosion'
  for (int i=0; i<explosion.size(); i++) { // loop through the arraylist indefinelty
    Ball tempBall = (Ball) explosion.get(i); // get a 'Ball' out of the ArrayList and store it in the tempBall variable
    tempBall.render(); // now draw my object by calling the custom function 'render'
    tempBall.move();//and animate the object by calling the custom function 'move'
  }
}





class Ball{ // here I am creating a CUSTOM CLASS, signified with a capital letter.
  // a class in composed of both data and functions which can be housed within OBJECTS.

  // I now go on to create a template for my OBJECT.
  // the template will describe both the state(data) and the behaviour(function) of the OBJECT.  
  //We can use this model to represent real world objects

  float diam; // diameter of the Ball
  PVector pos; // position (as a PVector) of the Ball
  PVector vel; // velocity (as a PVector) of the Ball
  color col;//colour of the Ball


  Ball( PVector _pos, float _diam ){ // constructor, belongs to the Class structure, it is used to make a new object from the class 'Ballt'
    // this function, with 2 arguments, runs once when the object is made
    // this is our personal setup function for the object
    pos = _pos; // assign our internal pos
    diam = _diam; // assign our internal diam
    vel = new PVector(random(-6,6)*1.5,random(-6,6)*1.5); // initial velocity of the Balls will vary
    col = color(random(255),190,255,220);//colours of the Balls will vary
  }
  
  void render(){ //  //  the function render to show what the object looks like
  fill(col);//colour with our assigned variable col
    ellipse( pos.x, pos.y, diam,diam );//draw the dot at pos.x,pos.y and make it round with the same value for width and height
  }
  
  void move(){ // our move function to animate the object
    pos.add(vel); // update our position to create movement by adding the current velocity vector
    vel.y = vel.y + 0.1; // add in some gravity by increasing the downward velocity 'y'
    diam = diam * 0.92;// as the Ball moves decrease it's size each frame by 92%
    if (diam == 0) {
      explosion.remove(this); // if the Ball becomes so small that it disappears it can be removed from the ArrayList
    }
    
  }
  

}



