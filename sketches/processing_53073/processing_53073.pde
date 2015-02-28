
//Emit
//x value now exists and subject to change
int x = 0;

//initialize my canvas
void setup(){
  //canvas size and colour
  size(250,250);
  background(0);
  //drawing ellipses from their center point
  ellipseMode(CENTER);
  //drawing shapes without lines
  noStroke();
  //smoothing or anti-aliasing
  smooth();
  //circles are bright green
  fill(0,250,0);
}

void draw(){
  //speed of rings emitting
  frameRate(60);
  
  //creates double rings that get larger
  fill(0,150,0);
  ellipse(125,125,x+15,x+15);
  fill(0);
  ellipse(125,125,x+10,x+10);
  fill(0,150,0);
  ellipse(125,125,x+5,x+5);
  fill(0);
  ellipse(125,125,x,x);
    
  //redraw center dot, brightness depends on x
  fill(0,(255 - x),0);
  ellipse(125,125,25,25);
  
  
  //reset values to re-emit when rings are larger than screen size
  if(x>350){
    x=0;
  }else{
    x+=10;
  }
}               
