
size (500, 500);
background(255);
smooth();
fill(255);
stroke(102);

//quadrent #1
int dotSpace = 50;
int dotSize = 5;
int startQuadX = 30;
int startQuadY = 30;
float quadBorderX = width/2;
float quadBorderY = height/2; 
float destinationX = quadBorderX - 5;
float destinationY = quadBorderY - 5;
color lineColor=color(255); //(0, 255, 206);
color arcFill= color(5,20);//(0,255,206,30);
color circleColor=color(0, 255, 206);//(227, 96, 66);
color circleFill=color(0, 255, 206);

for (int x=startQuadX; x<= quadBorderX; x+=dotSpace) {
  for (int y=startQuadY; y<= quadBorderY; y+=dotSpace) {
    //the circles  
    stroke(circleColor);
    fill(circleFill);
    ellipse (x, y, dotSize, dotSize);
    //the lines    
    stroke(lineColor);
    fill(arcFill);
    //noFill();
    beginShape();
    curveVertex(destinationX, destinationY);
    curveVertex(destinationX, destinationY);
    curveVertex(random (x, quadBorderX), random (y, quadBorderY));
    curveVertex(random (x, quadBorderX), random (y, quadBorderY));
    curveVertex(x, y);
    curveVertex(x, y);
    endShape();
  }
}

//quadrant #2 (lower right)

startQuadX = width/2+20;
startQuadY = height/2+20;
quadBorderX = width-30;
quadBorderY = height-30; 
destinationX = width-30;//width/2+5;
destinationY = height-30;//height/2+5;
for (int x=startQuadX; x<= quadBorderX; x+=dotSpace) {
  for (int y=startQuadY; y<= quadBorderY; y+=dotSpace) {
    //the circles  
    stroke(circleColor);
    fill(circleFill);
    ellipse (x, y, dotSize, dotSize);
    //the lines    
    stroke(lineColor);
    fill(arcFill);
    //noFill();
    beginShape();
    curveVertex(x, y);
    curveVertex(x, y);
    curveVertex(random (x, quadBorderX), random (y, quadBorderY));
    curveVertex(random (x, quadBorderX), random (y, quadBorderY));
    curveVertex(destinationX, destinationY);
    curveVertex(destinationX, destinationY);
    endShape();
  }
}
//quadrant #3 (lower left)

startQuadX = 30;
startQuadY = height/2+20;
quadBorderX = width/2 ;
quadBorderY = height-30; 
destinationX = 30; //quadBorderX - 5;
destinationY = height-30;//height/2 +5;
for (int x=startQuadX; x<= quadBorderX; x+=dotSpace) {
  for (int y=startQuadY; y<= quadBorderY; y+=dotSpace) {
    //the circles  
    stroke(circleColor);
    fill(circleFill);
    ellipse (x, y, dotSize, dotSize);
    //the lines    
    stroke(lineColor);
    fill(arcFill);
    //noFill();
    beginShape();
    curveVertex(x, y);
    curveVertex(x, y);
    curveVertex(random (x, quadBorderX), random (y, quadBorderY));
    curveVertex(random (x, quadBorderX), random (y, quadBorderY));
    curveVertex(destinationX, destinationY);
    curveVertex(destinationX, destinationY);
    endShape();
  }
}

//quadrant #4 (upper right)

startQuadX = width/2+20;
startQuadY = 30;
quadBorderX = width-30 ;
quadBorderY = height/2-20; 
destinationX =  width-30;//width/2+5;
destinationY = 30;//height/2 -5;
for (int x=startQuadX; x<= quadBorderX; x+=dotSpace) {
  for (int y=startQuadY; y<= quadBorderY; y+=dotSpace) {
    //the circles  
    stroke(circleColor);
    fill(circleFill);
    ellipse (x, y, dotSize, dotSize);
    //the lines    
    stroke(lineColor);
    fill(arcFill);
    //noFill();
    beginShape();
    curveVertex(x, y);
    curveVertex(x, y);
    curveVertex(random (x, quadBorderX), random (y, quadBorderY));
    curveVertex(random (x, quadBorderX), random (y, quadBorderY));
    curveVertex(destinationX, destinationY);
    curveVertex(destinationX, destinationY);
    endShape();
  }
}
                
                
