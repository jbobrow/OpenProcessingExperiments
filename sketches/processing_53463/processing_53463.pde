

//x value now exists and subject to change
int a = 0;
 
//initialize my canvas
void setup(){
  //canvas size and colour
  size(250,250);
  background(255,255,255);
  //drawing ellipses from their center point
  ellipseMode(CENTER);
  //drawing shapes without lines
  noStroke();
  //smoothing or anti-aliasing
  smooth();
  //circles are bright green
  fill(0,4,13);
}
 
void draw(){
  //rate speed
  frameRate(30);
   
  //creates rings that get larger
  fill(249,250,15);
  ellipse(125,125,a+15,a+15);
  fill(255,255,255);
  ellipse(125,125,a+10,a+10);
  fill(249,250,15);
  ellipse(125,125,a+5,a+5);
  fill(50,15,155);
  ellipse(125,125,a,a);  
  fill(0,250,0);
  ellipse(a,a,135,135);
  fill(0,250,0);
  ellipse(+a,a,125,125);
   
  //reset values to re-emit when rings are larger than screen size
  if(a>350){
    a=0;
  }else{
    a+=10;
  }
}

