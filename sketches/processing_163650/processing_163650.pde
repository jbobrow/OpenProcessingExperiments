
//draw 2 diagonals of rectangle/welsh flag

void setup(){
 size (400,240); 
 background( 0,0,0);
 
}

void draw(){
  color red = color(255,0,0);
  color white = color(255,255,255);
  color yellow = color (255,255,0);
  stroke(yellow);
  strokeWeight(40);
  //line(0,0,width,height);
  //line(0,height,width,0); 
  
  line(0,height/2,width,height/2);
  line(width/2,0,width/2,height);
}
