
int eSize = 3;

size(510,510);
background(255);


for(int x = 0; x <= width; x ++){
  stroke(x,180,255,127);
  line(x, 0, x, height); 
  
    stroke(x,25,25,27);
  line(width, 0, x, x);
  
    stroke(x,25,255,127);
  line(0, x, x, height);
  
    stroke(x,255,255,127);
  line(width, x, x, x);
  
  stroke(x,2,55,27);
  line(width, 150, x, height);
  
  stroke(250,255,255,255);
  line(width, 10, x, 89);
  
  
  noStroke();   
    stroke(0,0,0,0);
ellipse(0, 200, 200, 250);  
  
 
}


