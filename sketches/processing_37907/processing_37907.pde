
size (400, 400);
background (0);
 
//nested loop

for (int x=0; x<width; x+=100) { 
  //sets position of circles along x-axis
  
  for (int y=0; y<height; y+=100) {
    //sets position of circles along y-axis
    
    for (int circleSize=0; circleSize<width; circleSize+=25){
      //sets size of circles to increase in increments of 25
      
 // circles  
    noFill();
    stroke(0,x,y);
    ellipse(x,y,circleSize,circleSize);
    
    }
  }
}


