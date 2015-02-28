


// TODO:
// create 3 PImage variables
// for ex:
PImage together;
// inside setup, load each image

// let's make variables to keep track of each "situation":
int TOGETHER = 1;
int PARTITION = 2;
int INDIA = 3;
int PAKISTAN = 4;
// TODO:
// create a variable to keep track of which sitation you're in:
int situation = TOGETHER;

// TODO: create a variable for each sound clip that you want to play
// TODO: inside setup(), load each sound clip from a file
// TODO: also create another PImage variable for each visual thingy you want to show
// TODO: and in setup(), use loadImage() to load all those 

void setup() {

// TODO: load each image:
together = loadImage("...");
// repeat this 2 more times

}

void draw() {

// TODO: 
// put a big if statement that checks which "situation" you're in, and draws accordingly
if ( situation == TOGETHER ) {
  // draw the together image ... using image();
} else if ( situation == PARTITION ) {
  // etc ...
} else if ( situaation == INDIA ) {

} // and add the last 'else if' here ...


}

void mousePressed() {
// TODO: you'll want another big if statement in here for each of teh 4 situations
// for example, if the current situation is PARTITION, then check mouseX and mouseY to
// determine where the user has clicked, and set the 'situation' variable accordingly


}



