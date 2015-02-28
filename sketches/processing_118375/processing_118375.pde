
int eSize = 3;

size(510,510);
background(80,50,255);

for (int x = 0; x <= width; x ++) {
  
  stroke(46,79,40,78);
  line(x,0,x,0);
  
  stroke(24, 128, 125, 148);
  line(x,x,0,0);
  
  stroke(60, 28, 125, 127);
  line(0,x,x,height);
  
  stroke(89,x,58,127);
  line(width,0,x,0);
  
  stroke(25,8,58.160);
  line(width,0,x,height);
  
  stroke(35,26,58,120);
  line(height,x,0,width);
  
  


  stroke(24, 128, 125, 148);
  line(x,x,0,0);
  
  fill(255);
  ellipse(150, 150, 150, 150 );
 
  fill(0);
  ellipse(150, 150, 70, 70 );
  
  line(0,x,x,height);
  line(width,x,x,0);
}



