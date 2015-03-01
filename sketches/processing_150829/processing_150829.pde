


/*
*Creative Coding
*Week 2 molnar_trial stage two (7 June 2014)
*a stage by stage exercise
*by Janys Hyde
* remember to nest delete 'r' and save to image 's' inside void draw
curly brackets */

//stage one, creating grid of 25 squares
void setup() {
size ( 800, 800 );
background (0);
smooth();
rectMode (CORNER);
}

void draw() {
int x = 50;
int y = 50;
int d = 100;
fill(random(255), random(255), random(255));
//row 1
//fill (247, 17, 17);
rect (x, y, d, d);
rect (x*4, y, d, d);
rect (x*7, y, d, d);
rect (x*10, y, d, d);
rect (x*13, y, d, d);

//row 2
//fill (254, 255, 5);
rect (x, y*4, d, d);
rect (x*4, y*4, d, d);
rect (x*7, y*4, d, d);
rect (x*10, y*4, d, d);
rect (x*13, y*4, d, d);

//row 3
//fill (12, 5, 255);
rect (x, y*7, d, d);
rect (x*4, y*7, d, d);
rect (x*7, y*7, d, d);
rect (x*10, y*7, d, d);
rect (x*13, y*7, d, d);

//row 4
//fill (255, 5, 239);
rect (x, y*10, d, d);
rect (x*4, y*10, d, d);
rect (x*7, y*10, d, d);
rect (x*10, y*10, d, d);
rect (x*13, y*10, d, d);

//row 5
//fill (50, 255, 5);
rect (x, y*13, d, d);
rect (x*4, y*13, d, d);
rect (x*7, y*13, d, d);
rect (x*10, y*13, d, d);
rect (x*13, y*13, d, d);

if (keyPressed == true) {
switch( key ) {
case 's':
saveFrame("molnar_stage2.jpg");
break;
case 'r':
background(0);
break;
case 'q':
exit();
break;
default:
println("Unknown key command: ", key);
} // end switch
}

// // save your drawing when you press keyboard 's'
// if (keyPressed == true && key=='s') {
// saveFrame("stageone.jpg");
// }
// // quit program when you press keyboard 'q'
// else if (keyPressed == true && key == 'q') {
// exit();
// }
// // erase your drawing when you press keyboard 'r'
// else if (keyPressed == true && key == 'r') {
// background(0);
// }
}



