
size(250,250);  //size of sketch
background(255);  //white bg
smooth();//anti-aliasing (smooth edges)

float x=15;  //define x
translate(125,125);  //origin is now in middle

pushMatrix();

  scale(2.5);
  rotate(.5);
    for (x=12.5; x<125; x=x+20) {  //x starts at 12.5, and adds 20 as long as it is less than 125
      stroke (200-x,80+x,2*x,50);  //color of stroke--using x creates a gradient effect
        line (x-125,0,0,0-x); //top left quadrant
        line (x,0,0,x-125);  //top right quadrant
        line (x-125,0,0,x);  //bottom left quadrant
        line (x,0,0,125-x);  //bottom right quadrant
    }

rotate(-.5);
  for (x=12.5; x<125; x=x+20) {  //x starts at 12.5, and adds 20 as long as it is less than 125
    stroke (200-x,80+x,2*x,50);  //color of stroke--using x creates a gradient effect
      line (x-125,0,0,0-x); //top left quadrant
      line (x,0,0,x-125);  //top right quadrant
      line (x-125,0,0,x);  //bottom left quadrant
      line (x,0,0,125-x);  //bottom right quadrant
  }
  
popMatrix();

for (x=12.5; x<125; x=x+20) { 
  stroke (225-x,100+x,1+2*x); 
    line (x-125,0,0,0-x);
    line (x,0,0,x-125);  
    line (x-125,0,0,x);  
    line (x,0,0,125-x);  
}

rotate (PI/4); //rotate 90 deg
  for (x=12.5; x<125; x=x+20) { 
    stroke (200-x,80+x,2*x); 
      line (x-125,0,0,0-x);
      line (x,0,0,x-125); 
      line (x-125,0,0,x); 
      line (x,0,0,125-x); 
  }

rotate (PI/8); //rotate 45 deg
  for (x=12.5; x<125; x=x+20) { 
    stroke (200-x,80+x,2*x);  
      line (x-125,0,0,0-x); 
      line (x,0,0,x-125);  
      line (x-125,0,0,x);  
      line (x,0,0,125-x);  
  }

rotate (PI/4); //rotate 90 deg
  for (x=12.5; x<125; x=x+20) {  
    stroke (200-x,80+x,2*x);
    line (x-125,0,0,0-x);
    line (x,0,0,x-125);  
    line (x-125,0,0,x);  
    line (x,0,0,125-x);  
  }

