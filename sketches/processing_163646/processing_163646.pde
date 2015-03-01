
//draw 2 white diagonals of rectangle/scottish flag

void setup(){
 size (400,240); 
 background( 50,100,200);
 
}

void draw(){
  strokeWeight(40);
  line(0,0,width,height);
  line(0,height,width,0); 
  
  
  color red = color(255,0,0);
  color white = color(255,255,255);
  stroke(white);
}
