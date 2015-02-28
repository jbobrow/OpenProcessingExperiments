
//"Halfway There" is a dynamic sketch of lines in bright colors. This artwork has an unfinished feel to it, as the title suggests. 
//It is made up of code blocks, variables, arrays, and while loop, using the Camille color palette. 

//declare global variables
float x;
float y;
float counter = 0;
color [] camille = {#88B464, #FF03C0, #E8DF77, #FFFFFF, #000000 };
color [] palette = camille;

//setup code block 
void setup() {
  //largest canvas
  size(1280, 720);
  //brightest background
  background(palette[2]);
  //choose loop or no loop
  noLoop();
}

//draw code block
void draw() {
    //while statement
    while(counter < width) {
    float r = random (5); 
    //stroke weight and colors
    strokeWeight(random(2));
    stroke(camille[int(r)]);
    //introduce a local floating variable
    float z = random(height);
    //call upon global variables x and y
    x = random(height/2);
    y = random(width/2);
    //use the primitive function 
    line(x, y, z, z);
    //increment using selected operator
    counter++;
  }
}
  


