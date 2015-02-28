
int x=25;

void setup(){
  size (300, 600);
  background (255);
}

void draw (){
//  int y=1;
//  while (y < x){
//  line (0, width/x*y, width/x*y, width/x*y);
//  y=y+1;
// }

  noStroke ();
  int z=20;
  int rgb=66;
  while (z < height){
  fill(189+rgb, 189+rgb, 222+rgb, 10);
  rect(0, 1*z, width, height/z); 
  z=z+1;
  rgb=rgb-1;
  }

//  noStroke ();
//  fill (189, 189, 222, 128);
//  rect (0, 0, width, height/20);
//  fill (159, 179, 222, 128);
//  rect (0, height/25, width, height/20);
//  fill (179, 242, 154, 128);
//  rect (0, height/20+height/20*18, width, height/20); 
  
}



