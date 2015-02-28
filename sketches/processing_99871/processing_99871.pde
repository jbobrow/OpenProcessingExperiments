


PVector mouse;
int bg_colour=0;
int motion=1;
int mousemode=0;
int facetcol = 1;

int thresh=210;
int mousethresh=150;

int avoid_distance = 60;
float avoid_strength = 0.6;

int cohere_distance = 130;
float cohere_strength = 0.07;

int align_distance = 60;
float align_strength = 0.03;

float mouse_attract = 0.009;

float maxvel = 1.6;


ArrayList swarm = new ArrayList(); // create a new ArrayList called 'swarm' to store our objects or Dots


void setup() {
  size(1500, 1000);
  //size(displayWidth,displayHeight); // good for time of projection
  colorMode(HSB);// change colour mode to Hue Saturation and Brightness
  for (int i=0; i<42; i++) {//do this 5 times
      PVector newpos = new PVector(800, 500);//make the postion at the mouse
      Dot myDot = new Dot( newpos, 1 ); // create the objects at the mouse diameter 1pix (see constuctor) 
      myDot.col=color(random(255), random(180, 210), 255, 90);// defien the colour
      swarm.add(myDot);// add the objects to the Array
      myDot.col=color(random(255), random(180, 210), 255, 90);
 
}
}

// begin draw functions
void draw() {
 
  if (bg_colour==0) { // background is set as black but this code helps us switch to white
    background(0);
  }
  else {
    background(255);//if bg_color is not equal to 0 then the background is changed to white
  }

  for (int i=0; i<swarm.size(); i++) { // for the entire array this perform the following functions
    Dot myDot = (Dot) swarm.get(i); // first remove an object from the list and call it myDot
    myDot.render(); // draw the triangle fan shapes
    if (motion==1) { // define motion=1 as the state of movement
      myDot.move();
    }
    myDot.cohere();
    myDot.align();
    myDot.avoid();
    if (mousemode==1) {//switch to control mouse mode on/off. Because mouse = 0 was set at the beginning it needs to be changed to mouse = 1 before the function will work
      myDot.toMouse();
    }
    myDot.bounce();//make my object bounce off the sides if it hits the edges of the page
  }
}



void keyPressed() {
  
//add 5 colour vertex
  if (key=='5') {// if key is 5
    for (int i=0; i<5; i++) {//do this 5 times
      PVector newpos = new PVector(mouseX, mouseY);//make the postion at the mouse
      Dot myDot = new Dot( newpos, 1 ); // create the objects at the mouse diameter 1pix (see constuctor) 
      myDot.col=color(random(255), random(180, 210), 255, 90);// defien the colour
      swarm.add(myDot);// add the objects to the Array
    }
  }

//freeze movement
  if (key == ' ') { // if spacebar is pressed
    if (motion == 1) {//if animation is moving (as defined in draw funct) 
      motion=0;// stop it by changing to motion=0
    } 
    else if (motion == 0) { //if it is already stationary
      motion=1;//change back to a state of movement
    }
  }
  
//delete objects around mouse within 'mouse thresh'range
  if (keyCode == SHIFT) {// if key pressed is Shift
    for (int i=0; i<swarm.size(); i++) { // loop through the entire ArrayList 
      Dot removeDot=(Dot)swarm.get(i);// set remove dot as an object taken out of the array
      mouse =new PVector (mouseX, mouseY);// set "mouse as the positio of the mouse
      float distance = removeDot.pos.dist(mouse);// set the variable 'distance' as the distance between these objects and the mouse
      if (distance < mousethresh) {// if this distnace is less that the amout defined in the 'mousethresh' variable 
        swarm.remove(removeDot);// then delete these objects fro the array
      }
    }
  }
  if (key == '1') {// these 2 keys will change the area that the SHIFT key effects when deleteing objects
    mousethresh-=10;
  }
  if (key == '2') {
    mousethresh+=10;
  }
  if (key == '3') {// this will print the value of "mouse thresh"
    println(mousethresh);
  }
  //delete last 5 objects added
  if (key == 'd') {
    println("deletinglast");
    println(swarm.size());
    for (int i=0; i<5; i++) { // 5 times
      Dot removeDot=(Dot)swarm.get(swarm.size()-1);//remove dot is defined as the last 5 points added to the array
      swarm.remove(removeDot);// remove from array
      println(swarm.size());
    }
  }
//delete first 5 objects added
  if (key == 'f') {
    println("deletingfirst");
    for (int i=0; i<5; i++) { // do this 5 times
      Dot removeDot=(Dot)swarm.get(0);//removeDot is defined ere as the first 5 points of the aray.  point 1 being equivalent to '0'
      swarm.remove(removeDot);// remove them from the array
      println(swarm.size());
    }
  }
//increase thresh & therefore size of triangles
  if (key == '>') { // for > key
    thresh=thresh+10;// increase the variable disnace that dictates if a vertex is created
    println("increasethresh");
    println(thresh);
  }
  //decrease thresh therefore size of triangles
  if (key == '<') {
    thresh=thresh-10;// decrease the variable distance that dictates if a vertex is created
    println("decreasethresh");
    println(thresh);
  }
// switch to preferred mode, colour stays as is
  if (key == 'm') { 
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
// swith to prefferd state
  if (key == 'n') {
    swarm.clear(); // empty the list
    makeDots(30); // make 30 white new agents
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
//clear the screen
  if (key == 'c') {

    swarm.clear();//clear the array
     for (int i=0; i<35; i++) {//do this 5 times
      PVector newpos = new PVector(600, 400);//make the postion at the mouse
      Dot myDot = new Dot( newpos, 1 ); // create the objects at the mouse diameter 1pix (see constuctor) 
      myDot.col=color(random(255), random(180, 210), 255, 90);// defien the colour
      swarm.add(myDot);// add the objects to the Array
      myDot.col=color(random(255), random(180, 210), 255, 90);
 
}
    
  }

//toggle between coloured vertex and white
  if (key == 'h') {// if h is pressed
    if (facetcol == 1) {//if white 
      for (int i=0; i<swarm.size(); i++) { //run through the arrayList 
        Dot myDot = (Dot) swarm.get(i);//get the objects out
        myDot.col=color(random(255), random(180, 210), 255, 90);//make the objectscoloured
      }
      facetcol = 0;//and then call them coloured
    } 
    else if (facetcol == 0) { // if coloured as defined above
      for (int i=0; i<swarm.size(); i++) { // run through the array
        Dot myDot = (Dot) swarm.get(i);//remove objects
        myDot.col=color(255, 110);// and set them as a transparent white
      }
      facetcol=1;// then colour state is called white again
    }
  }
  
//change background coloour to white
  if (key == 'b') {// if be is pressed
    if (bg_colour == 0) {// and bg_coloour is 0 as defined above
      background(255);//then change it to white
      bg_colour=1;//and cal the bg_colour 1
    }
    else if (bg_colour==1) { // or the opposite
      bg_colour=0;
    }
  }
// increase velocity of swarm 
  if (key == CODED) {
    if (keyCode == UP) {// is up arrow pressed
      println("faster");
      maxvel+=0.2;/// in crease the maximum velocity which is the defining velocity
      println(maxvel);
    }
  } 
  // decrease velocity of swarm 
  if (keyCode == DOWN) { // if down arrow pressed
    maxvel-=0.2;//reduce the defining velocity which is the maximum velocity
    println("slower");
    println(maxvel);
  }
{// increase avoidance of objects
  if (keyCode == RIGHT) //by pressing right key
    avoid_strength+=0.1;
    avoid_distance+=10;
    println(avoid_strength);
    println(avoid_distance);

    println(avoid_strength);
  }
  // decrease avoidance of objects
  if (keyCode == LEFT) {//left arrow
    avoid_strength-=0.1;
    avoid_distance-=10;
    println(avoid_strength);
    println(avoid_distance);
  }
// increase coherence of objects
  if (key == ']') {
    cohere_distance += 10;
    cohere_strength += 0.01;
  }
// decrease coherence of objects
  if (key == '[') {
    cohere_distance -= 10;
    cohere_strength -= 0.01;
  }
// increase alignment of objects - infact not very useful
  if (key=='l') { 
    align_distance += 10;
    align_strength += 0.01;
  }
  // decrease alignment of objects - infact not very useful
  if (key=='k') {
    align_distance -= 10;
    align_strength -= 0.01;
  }
// change mode so objects are atttracted to mouse
  if (keyCode == TAB) {//using Tab key
    if (mousemode == 1) {//if objects are behavin gindependantly to mouse as set at the start
      mousemode=0;// then apply the to mouse function
    } 
    else if (mousemode == 0) { // otherwise if the mouse function is already running
      mousemode=1;//stop it
    }
  }
  //these keys control the amount of control the mouse has when in 'mouse attract' mode
   // strength of attraction to mouse increased
  if (key=='w') {  
    mouse_attract += 0.001;
  }
  // strength of attraction to mouse decreased
  if (key=='q') {   
    mouse_attract -= 0.001;
  }

}


void makeDots( int numdots ) { // a function created to make it easy to make a specified number of objects when required
  for (int i=0; i<numdots; i++) {// each time the mouse is pressed it will create a specified number of our objects and progress thourhg the loop that many times to create the objects
    PVector newpos = new PVector(random(width), random(height));// here we declare a new PVector 'newpos' which has it's position anywhere on the screen.
    Dot myDot = new Dot( newpos, 1 ); // here we refer back to our object 'constructor' on the other tab. A specified number of new objects will be made at random positions across the screen.
    swarm.add(myDot); // these new objects referred to as myDot are added to the ArrayList
  }
}

class Dot { // here I am creating a CUSTOM CLASS, signified with a capital letter.
  // a class in composed of both data and functions which is represented as OBJECTS.

  //now create a template for my OBJECT.
  //It will describe both the state(data) and the behaviour(function) of the object.  

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

    beginShape(TRIANGLE_FAN);// beings  recording vertices for a triangle fan shape which begins and ends with the vertex in the centre of the shape and creates triangle out from that central pt
    noStroke();
    fill(col);//fill with colour declared above
    vertex(pos.x, pos.y);//begin the traingle fan shape at the position of any of our "Dots"


    for (int i=0; i<swarm.size(); i++) { // loop through the ArrayList created (to store our objects) on the setup() tab
      Dot neighbour = (Dot) swarm.get(i);//get the objects out and call thenm neighbour

      float distance = pos.dist( neighbour.pos );//take the distance between any 2 object positons 
      if (distance < thresh) {// if that distance is less that the amount defined  by thresh (on our universal tab)
        vertex(neighbour.pos.x, neighbour.pos.y);// then make it a vertex and create a triangle
      }
    }
    vertex(pos.x, pos.y);//once all possible vertexes are found, finnish the Fan with the last vertex(same as first)
    endShape(TRIANGLE_FAN);// stop recording the shape
  }


  void move() { // our 'move' function to animate the object/Dot

    vel.add(acc); // update velocity vector by adding the current acceleration vector
    vel.limit(maxvel); // limit the velocity to a maximum value specified in our variable declared on the main tab.
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
    mpull.mult(mouse_attract);// alter the speed the object moves towards the mouse by the variable factor 'mouse_attract' created on the main tab
    acc.add(mpull);//add this force to the acceleration
  }



  void avoid() { // this function will mean the Dots will avoid colliding.
    for (int i=0; i<swarm.size(); i++) { // loop through the ArrayList created on the setup() tab, 
      Dot neighbour = (Dot) swarm.get(i); // get one out of the ArrayList and declare it 'neighbour'
      float distance = pos.dist( neighbour.pos ); // declare a variable 'distance' to refer to the distance between them
      if (distance < avoid_distance) { // if the distance between 2 points is less than the avoid distance specfied at the begining then we create a 'push'to move them apart
        PVector push = PVector.sub(pos, neighbour.pos); // the 'push' or the velocity with which they move apart in calculated by the diff of the 2 positions
        push.normalize(); // scale the velocity to 1
        push.mult(avoid_strength); // control this velocity by multiplying it by the 'avoid strength'specified at the beginning.
        acc.add(push); // add this force to the global acceleration
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
    pull.mult(cohere_strength); // multiply the pull velocity by our variable 'cohere_strength' (this also makes it easier to control)
    acc.add(pull); // add this force to the global acceleration
  }

  void align() { // fly in the same direction and match speed ie match velocity as this pVector holds speed and direction info
    // find the average velocity of my neighbours
    // then head in that direction
    PVector ave_vel = new PVector(); // to store the average velocity
    int neighbour_count = 0; // neighbour count variable set at 0, ie no one is close

      for (int i=0; i<swarm.size(); i++) { // loop through the list
      Dot neighbour = (Dot) swarm.get(i); // get an object out and store it's info in 'neighbour'
      float distance = pos.dist( neighbour.pos ); // declare a variable 'distance'and set it as equal to the distance between our object and it's neighbour.
      if (distance < align_distance) { // if this distance is less than our variable set at the begining or in other words 'they are within a certain dist of each other'
        ave_vel.add(neighbour.vel); // add my neighbours velocity to the average velocity
        neighbour_count++; // add 1 to the neighbour count
      }
    }
    ave_vel.div( neighbour_count ); // now to establish the new ave velocity divide by the neighbour count
    ave_vel.normalize(); // scale this velocity to 1
    ave_vel.mult(align_strength); // now multiply it by our variable 'align_strength'
    acc.add(ave_vel); // add this force to the global acceleration
  }
}



