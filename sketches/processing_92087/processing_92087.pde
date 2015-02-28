


//  LUCY BARKER u 3097464
//  Introduction to Digital Design, u 8196, Sem 1, Uni of Canberra 2013, MA Digital Design 103JA
//  This code has been adapted from a a project in Mitchell Whitelaws class on Swarm properties.
//  Swarm project
//  Haiku

//  PROJECTION FILE - interactive performance model



PVector mouse;
int bg_colour=0;
int motion=1;
int mousemode=0;
int facetcol = 1;

int thresh=210;
int mousethresh=150;

int avoid_distance = 80;
float avoid_strength = 0.6;

int cohere_distance = 130;
float cohere_strength = 0.07;

int align_distance = 60;
float align_strength = 0.03;

float mouse_attract = 0.009;

float maxvel = 1.8;


ArrayList swarm = new ArrayList(); // create a new ArrayList called 'swarm'

// set up poster proportions

void setup() {
  size(1200, 800);
  //size(displayWidth,displayHeight); // good for time of projection
  colorMode(HSB);
}

// begin draw functions
void draw() {

  if (bg_colour==0) {
    background(0);
  }
  else {
    background(255);
  }

  for (int i=0; i<swarm.size(); i++) { // for the entire array this perform the following functions
    Dot myDot = (Dot) swarm.get(i); // first remove an object from the list and call it freshDot
    myDot.render(); 
    if (motion==1) { 
      myDot.move();
    }
    myDot.cohere();
    myDot.align();
    myDot.avoid();
    if (mousemode==1) {//this function will cause the objects to move towards the mouse. Switched on with TAB key
      myDot.toMouse();
    }
    myDot.bounce();//make my object bounce off the sides if it hits the edges of the page
  }
}

//mouse activates animation by creatin objects

void mousePressed() {

  for (int i=0; i<5; i++) {
    PVector newpos = new PVector(mouseX, mouseY);
    Dot myDot = new Dot( newpos, 1 ); 
    swarm.add(myDot);
    println(swarm.size());
  }
}

//INTERACTIVE KEY CONTROLS

void keyPressed() {

  if (key=='5') {// add 5 colour vertex
    for (int i=0; i<5; i++) {
      PVector newpos = new PVector(mouseX, mouseY);
      Dot myDot = new Dot( newpos, 1 ); 
      myDot.col=color(random(255), random(180, 230), 255, 90);
      swarm.add(myDot);
    }
  }

  if (key == ' ') { //freeze movement
    if (motion == 1) {
      motion=0;
    } 
    else if (motion == 0) { 
      motion=1;
    }
  }

  if (keyCode == SHIFT) {//delete objects around mouse within 'mouse thresh'range
    for (int i=0; i<swarm.size(); i++) { // loop through the ArrayList created on the setup() tab, to store my Dot objects
      Dot removeDot=(Dot)swarm.get(i);
      mouse =new PVector (mouseX, mouseY);
      float distance = removeDot.pos.dist(mouse);
      if (distance < mousethresh) {
        swarm.remove(removeDot);
      }
    }
  }
  if (key == '1') {// these 2 keys will change the area that the SHIFT key effects when deleteing objects
    mousethresh-=10;
  }
  if (key == '2') {
    mousethresh+=10;
  }
  if (key == '3') {
    println(mousethresh);
  }
  
  if (key == 'd') {//delete last 5 objects added
    println("deletinglast");
    println(swarm.size());
    // Dot removeDot=(Dot)swarm.get(0);
    for (int i=0; i<5; i++) { 
      Dot removeDot=(Dot)swarm.get(swarm.size()-1);
      swarm.remove(removeDot);
      println(swarm.size());
    }
  }

  if (key == 'f') {//delete first 5 objects added
    println("deletingfirst");
    for (int i=0; i<5; i++) { 
      Dot removeDot=(Dot)swarm.get(0);
      swarm.remove(removeDot);
      println(swarm.size());
    }
  }

  if (key == '>') {//increase thresh hold & therefore size of triangles
    thresh=thresh+10;
    println("increasethresh");
    println(thresh);
  }
  if (key == '<') {
    thresh=thresh-10;
    println("decreasethresh");
    println(thresh);
  }

  if (key == 'm') { // switch to preferred mode
    thresh=210;

    avoid_distance = 80;
    avoid_strength = 0.6;

    cohere_distance = 130;
    cohere_strength = 0.07;

    align_distance = 60;
    align_strength = 0.03;

    mouse_attract = 0.009;

    maxvel = 1.8;
    println(swarm.size());
  }

  if (key == 'n') {// swith to prefferd state
    swarm.clear(); // empty the list
    makeDots(30); // make 30 new agents
    thresh=210;

    avoid_distance = 80;
    avoid_strength = 0.6;

    cohere_distance = 130;
    cohere_strength = 0.07;

    align_distance = 60;
    align_strength = 0.03;

    mouse_attract = 0.009;

    maxvel = 1.8;
  }

  if (key == 'c') {//clear the screen

    swarm.clear();
  }

  if (key == 'h') {//toggle between coloured vertex and white
    if (facetcol == 1) {//if white 
      for (int i=0; i<swarm.size(); i++) { //run through list 
        Dot myDot = (Dot) swarm.get(i);
        myDot.col=color(random(255), random(180, 210), 255, 90);//make coloured
      }
      facetcol = 0;//and then
    } 
    else if (facetcol == 0) { 
      for (int i=0; i<swarm.size(); i++) { 
        Dot myDot = (Dot) swarm.get(i);
        myDot.col=color(255, 110);
      }
      facetcol=1;
    }
  }

  if (key == 'b') {//change background coloour to white
    if (bg_colour == 0) {
      background(255);
      bg_colour=1;
    }
    else if (bg_colour==1) {
      bg_colour=0;
    }
  }

  if (key == CODED) {
    if (keyCode == UP) {// increase velocity of swarm
      println("faster");
      maxvel+=0.2;
      println(maxvel);
    }
  } 
  if (keyCode == DOWN) { // decrease velocity of swarm
    maxvel-=0.2;
    println("slower");
    println(maxvel);
  }

  if (keyCode == RIGHT) {// increase avoidance of objects
    avoid_strength+=0.1;
    avoid_distance+=10;
    println(avoid_strength);
    println(avoid_distance);

    println(avoid_strength);
  }
  if (keyCode == LEFT) {// decrease avoidance of objects
    avoid_strength-=0.1;
    avoid_distance-=10;
    println(avoid_strength);
    println(avoid_distance);
  }

  if (key == ']') {// increase coherence of objects
    cohere_distance += 10;
    cohere_strength += 0.01;
  }

  if (key == '[') {// decrease coherence of objects
    cohere_distance -= 10;
    cohere_strength -= 0.01;
  }

  if (key=='l') { // increase alignment of objects - infact not very useful
    align_distance += 10;
    align_strength += 0.01;
  }
  if (key=='k') {// decrease alignment of objects - infact not very useful
    align_distance -= 10;
    align_strength -= 0.01;
  }

  if (keyCode == TAB) {// change mode so objects are atttracted to mouse
    if (mousemode == 1) {
      mousemode=0;
    } 
    else if (mousemode == 0) { 
      mousemode=1;
    }
  }
  if (key=='w') {   // strength of attraction to mouse increased
    mouse_attract += 0.001;
  }
  if (key=='q') {   // strength of attraction to mouse decreased
    mouse_attract -= 0.001;
  }

}


void makeDots( int numdots ) {
  for (int i=0; i<numdots; i++) {// each time the mouse is pressed it will create 20 iterations or 'instnaces' of our object.  For more detailed description of how this works refer to a previous sketch.
    //PVector newpos = new PVector(mouseX,mouseY);//this code which is turned off would cause the 20objects to appear at the location the mouse is pressed.
    PVector newpos = new PVector(random(width), random(height));// here we declare a new PVector 'newpos' which has it's position anyway on the screen.
    Dot myDot = new Dot( newpos, 1 ); // here we refer back to our object 'constructor' on the other tab. With the click of the mouse our new object is assigned a random position and a diamneter of 3. The info is then stored in myDot.
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



    


  Dot( PVector _pos, float _diam ) { // constructor, belongs to the Class structure and functions to make a new object from the class 'Dot'
    // this function, with 2 arguments, runs once when the object is made
    // this is our personal object setup function
    pos = _pos; // assign our internal pos
    diam = _diam; // assign our internal diam
    vel = new PVector(random(-1, 1), random(-1, 1)); // initial velocity of dot will vary.
    col =  color(255, 110);
    acc = new PVector(0, 0);// starts with no acceleration.  If this were to be representative of an object in the real world,
    // such as a ball, we would add gravity in here
  }


  void render() {

    beginShape(TRIANGLE_FAN);
    noStroke();
    fill(col);
    vertex(pos.x, pos.y);


    for (int i=0; i<swarm.size(); i++) { // loop through the ArrayList created on the setup() tab, to store my Dot objects
      Dot neighbour = (Dot) swarm.get(i);

      float distance = pos.dist( neighbour.pos );
      if (distance < thresh) {
        vertex(neighbour.pos.x, neighbour.pos.y);
      }
    }
    vertex(pos.x, pos.y);
    endShape(TRIANGLE_FAN);
  }


  void move() { // our 'move' function to animate the object

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


  void toMouse() {//this function we make causes the lines to 'chase' the mouse
    PVector m = new PVector(mouseX, mouseY);// mouse position signified by'm'
    PVector mpull = PVector.sub(m, pos);//velocity is the difference between these 2 points over time
    mpull.normalize();//make this velocity, mpull, a unit vector by setting it's length to 1
    mpull.mult(mouse_attract);// alter the speed the object moves towards the mouse by the variable factor 'mouse_attract' we created earlier
    acc.add(mpull);//acceleration, change of velocity over time becomes the same as the mouse_factor.
  }



  void avoid() { // this function we are about to create means the Dots or lines will avoid colliding.
    for (int i=0; i<swarm.size(); i++) { // loop through the ArrayList created on the setup() tab, to store my Dot objects
      Dot neighbour = (Dot) swarm.get(i); // get one out of the ArrayList and declare it 'neighbour'
      float distance = pos.dist( neighbour.pos ); // distance
      if (distance < avoid_distance) { // if the distance between the concecutive points is less than the avoid distance specfied at the begining then we create a 'push'to move them apart
        PVector push = PVector.sub(pos, neighbour.pos); // the 'push' or the velocity with which they move apart in calculated by the diff of the 2 positions
        push.normalize(); // scale the velocity to 1
        push.mult(avoid_strength); // control this velocity by multiplying it by the 'avoid strength'specified at the beginning.
        acc.add(push); // add this push to the global acceleration
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
    pull.normalize(); // scale the velocity to 1
    pull.mult(cohere_strength); // multiply the pull velocity by our variable 'cohere_strength'
    acc.add(pull); // add this pull to the global acceleration
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



