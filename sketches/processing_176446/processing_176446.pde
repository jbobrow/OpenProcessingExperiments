
// I am new to English, so please don't mind my language misstake
// In this assignment, i have tried to make a dynamic and variable-driven drawings in processing.
// i have used rectangles with moving colors. I would like to hear your on my art work.

// working with sutep, draw, if,intiger, for,  float, and arrays,variables,for loops
// global variables, int and color pallette


int x = 25;
int y = 25;




color [] palette = {#54FFB4,#4567E8,#FF3AF5,#E8772F,#FFF48A};
//setup
void setup(){
  
// size and background color
size(800,600);
background(palette[1]);
}
// draw()
void draw(){
// float, loops, arrays and if 
  float r = random(1,5);
strokeWeight(5);
stroke(palette[int(r)]);
fill(#FF2200);

rect(x, y, 40,40);
if (x < width){
   x += 50;
   if (x > width) {
     y +=50;
     x = 25;
     int x = 25;
int y = 25;
color [] palette = {#7BD3D1,#0298D1,#4077EB,#1A60DC,#072B76};


// setup ()

  size(900,700);
  background(palette[0]);
  
  
}


  // for statment
  
  
  for (int x = 25; x < width; x += 50){
    for (int y = 25; y < height; y +=50){

  strokeWeight(10);
  stroke(palette[int(r)]);
  fill(#F70A0A);
  rect(x,y,50,50);
    }
  }
}


   }





