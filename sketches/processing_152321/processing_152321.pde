
float spin_x = 0;
float spin_y = 0;
float r = 0;


void setup(){
  size(400,400);
  
  noStroke();
  
}

void draw(){
  translate(200,200);
  background(#94DBD6);
  fill(#F5AF16);
  rotate(r);
  ellipse(spin_x + r,spin_y + r,30,30);
  ellipse( 30 + r, 30 + r, 30, 30);
  ellipse( -30 + r, -30 + r, 30, 30);
  
  r = r + .1;
  
  if(r > 150){
    r = 0;
  }
 
}

