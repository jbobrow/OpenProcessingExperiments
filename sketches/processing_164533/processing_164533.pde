
int gap;
//sets interger to gap
void setup(){
  // runs the code only once
size(500,400);
//sets the size of the sketch to 500 px in width and 400 px in height
}
void draw(){
  // runs the code as a loop at the default frame rate
background(36,0,24);
//sets background color to plum
fill (243,222,191);
//fills squares in tan
   
translate(width/2.2,height/2.5);
//centers squares and their transistions to happen from the center
rect(-50-gap,-50-gap,50,50);
//Size of top left square
rect(0,-50-gap,50,50);
//Size of top center square
rect(50+gap,-50-gap,50,50);
//Size of top right square
rect(-50-gap,0,50,50);
//Size of middle left square
rect(0,0,50,50);
//Size of middle center square
rect(50+gap,0,50,50);
//Size of middle right square
rect(-50-gap,50+gap,50,50);
//Size of bottom left square
rect(0,50+gap,50,50);
//Size of bottom center square
rect(50+gap,50+gap,50,50);
//Size of bottom right square

gap = mouseX/2; 
//sets the integer gap to change size according to the x axis of the mouse
}



