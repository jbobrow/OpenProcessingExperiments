
//Lucy Barker
// Introduction to Digital Design, u 8196, Sem 1, Uni of Canberra 2013, MA Digital Design 103JA

// this code has been adapted from a a project in Mitchell Whitelaws class on Swarm properties.

// it demonstrates CUSTOM CLASSES and objects (with constructors), ArrayLists, functions (with arguements), iteration, keyboard interaction, saving files


Dot myDot; // declare a variable to store my object in
ArrayList swarm = new ArrayList(); // create a new ArrayList called 'swarm'

void setup() {//vital function runs once at the start
  size(1000,800);//set the size of the page at 800 pix wide by 800pix high
  background(0);// set the background colour to white
 
}


void draw() {//the draw function runs continuously (30 frames sec) and calls on all the other custom functions we created on the object/class tab
background(0);
   
  for (int i=0; i<swarm.size(); i++){ // the for structure tells it to loop through the ArrayList infintiely as it has no fixed size.  See previous code sketches for more in depth description of how the for structure loop works.
    Dot freshDot = (Dot) swarm.get(i); // get an object 'Dot' out of the Array List'swarm' and call it freshDot
    freshDot.render(); // draw my new object, as specified on our custom class tab.  This will not happen until mouse is pressed and the variables of the ellipse (pos.x, pos.y, diam, diam) are given any meaningful value.
    freshDot.move();// make my new object
    freshDot.cohere();//make my object stick close to the others, as specified on our custom class tab
    freshDot.align();//make my object travel at the same velocity to the others, as specified on our custom class tab
    freshDot.avoid();//make my object avoid touching the others, as specified on our custom class tab
    //freshDot.toMouse();//this function will cause the objects to move towards the mouse but I don't want to use it in this instance.
   freshDot.bounce();//make my object bounce off the sides if it hits the edges of the page
  }
 
}

void mousePressed(){//calls the folllowing to occur when the mouse is pressed
 for (int i=0; i<20; i++){// each time the mouse is pressed it will create 20 iterations or 'instnaces' of our object.  For more detailed description of how this works refer to a previous sketch.
 //PVector newpos = new PVector(mouseX,mouseY);//this code which is turned off would cause the 20objects to appear at the location the mouse is pressed.
PVector newpos = new PVector(random(width),random(height));// here we declare a new PVector 'newpos' which has it's position anyway on the screen.
  myDot = new Dot( newpos, 3 ); // here we refer back to our object 'constructor' on the other tab. With the click of the mouse our new object is assigned a random position and a diamneter of 3. The info is then stored in myDot.
  swarm.add(myDot); // here we add the data assigned to 'myDot' to our ArrayList 'swarm'
 }
}
class Dot { // here I am creating a CUSTOM CLASS, signified with a capital letter.
  // a class in composed of both data and functions which is represented as OBJECTS.

  // I now go on to create a template for my OBJECT.
  //It will describe both the state(data) and the behaviour(function) of the object.  
  //We can use this model to represent real world objects

  float diam; // declare a variable to describe the size of the dot, 'it's diameter'
  PVector pos; // declare 'pos'the position of a Dot (as a PVector)
  PVector vel; // declare a variable 'vel' the velocity of a Dot (as a PVector)
  PVector acc; // declare a variable 'acc' the acceleration of a Dot (as a PVector)
  color col;//declare 'col' a variable for the colour of a Dot

  int avoid_distance = 15;//declare a variables and assign it values for the following ...
  float avoid_strength = 0.2;

  int cohere_distance = 120;
  float cohere_strength = 0.07;

  int align_distance = 30;
  float align_strength = 0.05;

  float mouse_attract = 0.05;

  float maxvel = 5;


  Dot( PVector _pos, float _diam ) { // constructor, belongs to the Class structure and functions to make a new object from the class 'Dot'
    // this function, with 2 arguments, runs once when the object is made
    // this is our personal object setup function
    pos = _pos; // assign our internal pos
    diam = _diam; // assign our internal diam
    vel = new PVector(random(-1, 1), random(-1, 1)); // initial velocity of dot will vary.
    col =  color(random(255), random(255), random(255), random(50, 150));
    acc = new PVector(0, 0);// starts with no acceleration.  If this were to be representative of an object in the real world,
    // such as a ball, we would add gravity in here
  }

  void render() { //  our function 'render' to show what the object looks like
   //add in some lines and circles connecting the points (or our objects Dot)
    stroke(col,random(180));//colour with our assigned variable col, randomise the 'alpha' value to add visual interest and help look like they are moving through space
    strokeWeight(random(2));
  for (int i=0; i<swarm.size(); i++) { // loop through the ArrayList created on the setup() tab, to store my Dot objects
      Dot neighbour = (Dot) swarm.get(i); // get one out of the ArrayList and declare it 'neighbour'
      float distance = pos.dist( neighbour.pos ); // distance from one Dot to the next
      if (distance < 200) { // if the distance between the concecutive points is less than the avoid distance specfied at the begining then we create a 'push'to move them apart
       line(pos.x,pos.y,neighbour.pos.x,neighbour.pos.y);//then draw a line
    noFill();
       ellipse(pos.x,pos.y,random(140),70);//draw ellipses at the end point of the lines
       ellipse(neighbour.pos.x,neighbour.pos.y,random(140),70);//draw ellipses at the end point of the lines, give them random widths so they look like they are revolving.
      }
    }
}

  void move() { // our 'move' function to animate the object

    //vel.mult(0.95); // because velocity is represented as a PVector we must use the '.mult' to multiply.  This amount represents friction. And is only needed when representing real life. 
    vel.add(acc); // update velocity vector by adding the current acceleration vector
    vel.limit(maxvel); // limit the velocity to a maximum value specified in our variable declared above.
    pos.add(vel); // update our position to create movement by adding the current velocity vector
    acc.mult(0); // then reset acceleration back to zero
  }

  void bounce() { // make a function that makes the Dots bounce back when they hit the edge of the page
    if (pos.x < 0) { // left edge 
      vel.x = vel.x * -1; // reverse the x velocity
    }

    if (pos.x > width) { // if our object Dot hits theright edge 
      vel.x = vel.x * -1; // reverse the x velocity
    }

    if (pos.y < 0) { // if our object Dot hits the top edge 
      vel.y=vel.y * -1; // reverse the y velocity
    }

    if (pos.y > height) { // bottom edge 
      vel.y = vel.y * -1; // reverse the y velocity
    }
  }

  //this function is not being called on in this sketch but has been left in so it can be easily called on if desired.
  void toMouse() {//this function we make causes the lines to 'chase' the mouse
    PVector m = new PVector(mouseX, mouseY);// mouse position signified by'm'
    PVector mpull = PVector.sub(m, pos);//velocity is the difference between these 2 points over time
    mpull.normalize();//make, mpull, a unit vector by setting it's length to 1
    mpull.mult(mouse_attract);// alter the speed the object moves towards the mouse by the variable factor 'mouse_attract' we created earlier
    acc.add(mpull);//add,mpull vector to acceleration
  }



  void avoid() { // this function we are about to create means the Dots or lines will avoid colliding.
    for (int i=0; i<swarm.size(); i++) { // loop through the ArrayList created on the setup() tab, to store my Dot objects
      Dot neighbour = (Dot) swarm.get(i); // get one out of the ArrayList and declare it 'neighbour'
      float distance = pos.dist( neighbour.pos ); // distance
      if (distance < avoid_distance) { // if the distance between the concecutive points is less than the avoid distance specfied at the begining then we create a 'push'to move them apart
        PVector push = PVector.sub(pos, neighbour.pos); // the 'push' or the velocity with which they move apart in calculated by the diff of the 2 positions
        push.normalize(); // scale the vector to 1
        push.mult(avoid_strength); // control this velocity by multiplying it by the 'avoid strength'specified at the beginning.
        acc.add(push); // add this vector to the global acceleration
      }
    }
  }

  void cohere() { // stick together
    // find the middle of my neighbour Dots 
    // and move towards that location 
    PVector mid_pos = new PVector(); // declare a new variable 'mid_pos' to store the average position of my neighbours
    int neighbour_count = 0; // declare a variable 'neighbour count' and set it at zero.

    for (int i=0; i<swarm.size(); i++) { // for the entire ArrayList of indefinite size
      Dot neighbour = (Dot) swarm.get(i); // get an object out and store it's info in 'neighbour'
      float distance = pos.dist( neighbour.pos ); // declare a variable 'distance'and set it as equal to the distance between our object and it's neighbour.
      if (distance < cohere_distance) { // if this distance is less than our variable set at the begining or in other words 'they are within a certain dist of each other'
        mid_pos.add(neighbour.pos); // then add my neighbours position to the average position of all our neighbours
        neighbour_count++; // now we need to add 1 to the neighbour count
      }
    }
    mid_pos.div( neighbour_count ); // now we need to divide the new mid_pos by the new neighbour count
    PVector pull = PVector.sub(mid_pos, pos); //  to make a pull velocity we need to subtract subtract the 2 positions, the mid position of all the neighbours, and the position of our current object.
    pull.normalize(); // scale the vector to 1
    pull.mult(cohere_strength); // multiply the pull vector by our variable 'cohere_strength'
    acc.add(pull); // add this pull vector to the global acceleration
  }

  void align() { // fly in the same direction and match speed ie match velocity as this pVector holds speed and direction info
    // find the average velocity of my neighbours
    // then head in that direction
    PVector ave_vel = new PVector(); // to store the average velocity
    int neighbour_count = 0; // neighbour count variable set at 0

    for (int i=0; i<swarm.size(); i++) { // loop through the list
      Dot neighbour = (Dot) swarm.get(i); // get an object out and store it's info in 'neighbour'
      float distance = pos.dist( neighbour.pos ); // declare a variable 'distance'and set it as equal to the distance between our object and it's neighbour.
      if (distance < align_distance) { // if this distance is less than our variable set at the begining or in other words 'they are within a certain dist of each other'
        ave_vel.add(neighbour.vel); // add my neighbours velocity to the average velocity
        neighbour_count++; // add 1 to the neighbour count
      }
    }
    ave_vel.div( neighbour_count ); // now to establish the new ave velocity divide by the neighbour count
    // make a pull by subtracting the positions
 ave_vel.normalize(); // first scale the velocity to 1
    ave_vel.mult(align_strength); // now multiply it by our variable 'align_strength'
    acc.add(ave_vel); // add this pull to the global acceleration
  }
}

void keyPressed() {
  if (key=='s') {
    save("spagetti.tiff");
  }
  if (key==' ') { //if space bar is pressed...
    background(0);
   swarm.clear();//clear the drawing
  }
}



