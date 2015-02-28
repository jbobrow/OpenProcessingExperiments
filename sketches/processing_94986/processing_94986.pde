
void setup(){
  size(200,200);
  background(255);
}


void draw(){
  int ex=2;
  int ladox = (width-7*ex)/8;
  int x=0;
for(x=0;x<200;x+=25){
  for(int y=0; y<200; y+=25){
   fill(255);
   rect(x,y,ladox,ladox);
  }
}
  fill(161,202,245);
  rect((3*(ladox+ex)), (0*(ladox+ex)), ladox, ladox);
  noLoop();
  
  fill(161,202,245);
  rect((4*(ladox+ex)), (0*(ladox+ex)), ladox, ladox);
  noLoop();
  
  fill(161,202,245);
  rect((2*(ladox+ex)), (1*(ladox+ex)), ladox, ladox);
  noLoop();
  
  fill(161,202,245);
  rect((3*(ladox+ex)), (1*(ladox+ex)), ladox, ladox);
  noLoop();
  
  fill(161,202,245);
  rect((4*(ladox+ex)), (1*(ladox+ex)), ladox, ladox);
  noLoop();
  
  fill(161,202,245);
  rect((5*(ladox+ex)), (1*(ladox+ex)), ladox, ladox);
  noLoop();
  
  fill(129,146,237);
  rect((1*(ladox+ex)), (2*(ladox+ex)), ladox, ladox);
  noLoop();
  
  fill(129,146,237);
  rect((2*(ladox+ex)), (2*(ladox+ex)), ladox, ladox);
  noLoop();
  
  fill(129,146,237);
  rect((3*(ladox+ex)), (2*(ladox+ex)), ladox, ladox);
  noLoop();
  
  fill(129,146,237);
  rect((1*(ladox+ex)), (3*(ladox+ex)), ladox, ladox);
  noLoop();
  
  fill(129,146,237);
  rect((2*(ladox+ex)), (3*(ladox+ex)), ladox, ladox);
  noLoop();
  
  fill(129,146,237);
  rect((2*(ladox+ex)), (4*(ladox+ex)), ladox, ladox);
  noLoop();
  
  fill(94,111,206);
  rect((3*(ladox+ex)), (4*(ladox+ex)), ladox, ladox);
  noLoop();
  
  fill(94,111,206);
  rect((2*(ladox+ex)), (5*(ladox+ex)), ladox, ladox);
  noLoop();
  
  fill(94,111,206);
  rect((3*(ladox+ex)), (5*(ladox+ex)), ladox, ladox);
  noLoop();
  
  fill(94,111,206);
  rect((4*(ladox+ex)), (5*(ladox+ex)), ladox, ladox);
  noLoop();
  
  fill(54,108,173);
  rect((3*(ladox+ex)), (6*(ladox+ex)), ladox, ladox);
  noLoop();
  
  fill(54,108,173);
  rect((4*(ladox+ex)), (6*(ladox+ex)), ladox, ladox);
  noLoop();
  
  fill(54,108,173);
  rect((4*(ladox+ex)), (7*(ladox+ex)), ladox, ladox);
  noLoop();
  
  fill(31,71,118);
  rect((5*(ladox+ex)), (6*(ladox+ex)), ladox, ladox);
  noLoop();
  
  fill(31,71,118);
  rect((6*(ladox+ex)), (6*(ladox+ex)), ladox, ladox);
  noLoop();
  
  fill(31,71,118);
  rect((6*(ladox+ex)), (5*(ladox+ex)), ladox, ladox);
  noLoop();
  
  fill(31,71,118);
  rect((7*(ladox+ex)), (5*(ladox+ex)), ladox, ladox);
  noLoop();
  
  fill(31,71,118);
  rect((7*(ladox+ex)), (4*(ladox+ex)), ladox, ladox);
  noLoop();
  
  fill(31,71,118);
  rect((6*(ladox+ex)), (3*(ladox+ex)), ladox, ladox);
  noLoop();
    
}
