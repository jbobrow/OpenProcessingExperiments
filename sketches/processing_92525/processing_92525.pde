
// program test


//background(255)  //0 black  255 white
//background(255, 255, 255)  //RGB Coloring  red green and blue mix colors
//background(255, 0, 0)

// create a random number to generate differen colors using random() funciton.

//background(random(256), random(256), random(256))
//create routine that creates different colors mulitple times per second.
void draw() {
background(random(256), random(256), random(256))
}
void setup() {  //called once at beginning of program
frameRate(5)
}
