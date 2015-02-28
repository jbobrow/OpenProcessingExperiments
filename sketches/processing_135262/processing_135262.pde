
//Circles are fun. I wanted to create a bold in your face circle sketch. 
//A sketch that just makes one smile. 

//Color Palette

color[] palette = {#000000,#FCFB19,#3B79A3,#770200,#A80833};   //first set the array
color[] gettn = palette;       //define the array
float counter = 0;
color[] strokePalette = {#98BFBD,#657F7E};
color[] strokeColr = strokePalette;

//setup
void setup(){
   size(1280, 720);
  background(gettn[0]);  
}

//draw code block
void draw(){
  while(counter<600){
  strokeWeight(int(random (3, 5)));
  stroke(strokeColr[int(random(0, 2))]);
  fill(gettn [int(random(1, 5))]);
  float x = random(width);
  float y = random(height);
  float d = random(10,500);
  ellipse(x, y, d, d);
  counter += random(-1, 2);
}


}
