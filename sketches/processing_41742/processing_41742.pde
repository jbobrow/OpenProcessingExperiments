
//Alex Nelson

//creating variables
float x1,y1;
color c1;

//making the background black 
void setup(){
  size(200,200);
  colorMode(RGB);
  background(0);
  smooth();
  
//randomizing the heights and widths of the rectangles between 0 and 100
  x1 = random(0,100);
  y1 = random(0,100);
  c1 = color(150,255,0);
}
 
void draw(){
 //each repeats across the page at different heights and distances from eachother
  x1 = x1 + random(0,5);
  y1 = y1 + random(-10,10);

//making the repetitive figures rectangles
  stroke(c1);
  rect(x1,y1,x1,y1);

}


