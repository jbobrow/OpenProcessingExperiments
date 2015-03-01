
int gap;
//sets interger to gap
void setup(){
  // runs the code only once
size(500,400);
//sets the size of the sketch to 500 px in width and 400 px in height
}
void draw(){
  // runs the code as a loop at the default frame rate
background(255,255,255);
//sets background color to plum
noStroke ();

   
translate(width/2.2,height/2.5);
//centers squares and their transistions to happen from the center
fill (163,31,255);
//fills square shade of purple 
rect(-50-gap,-50-gap,50,50);
//Size of top left square

fill (155,60,250);
//fills square shade of purple 
rect(0,-50-gap,50,50);
//Size of top center square

fill (160,30,255);
//fills square shade of purple 
rect(50+gap,-50-gap,50,50);
//Size of top right square

fill (153,80,245);
//fills square shade of purple 
rect(-50-gap,0,50,50);
//Size of middle left square

fill (158,31,255);
//fills square shade of purple 
rect(0,0,50,50);
//Size of middle center square

fill (163,80,255);
//fills square shade of purple 
rect(50+gap,0,50,50);
//Size of middle right square

fill (153,31,240);
//fills square shade of purple 
rect(-50-gap,50+gap,50,50);
//Size of bottom left square

fill (148,21,245);
//fills square shade of purple 
rect(0,50+gap,50,50);
//Size of bottom center square

fill (158,31,255);
//fills square shade of purple 
rect(50+gap,50+gap,50,50);
//Size of bottom right square

gap = mouseX/2; 
//sets the integer gap to change size according to the x axis of the mouse
}



