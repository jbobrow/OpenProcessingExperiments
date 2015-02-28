


void setup() {
  size(400, 550);
  background(200);
  noFill();
  int numOfCol = 300/12;
  int numOfRows = 500/numOfCol;
  
  //Now use nested for loop to generate a graph
  for(int a = 1; a<=numOfRows; a += 1){
    for(int b = 1; b<numOfCol-10; b +=1){
      pushMatrix();
      //push and pop matrix will help reset the rotation of the sqaure
      translate(numOfCol*b, numOfCol*a);
      rotate(radians(random(-a*4, a*4)));
      rect(0,0,numOfCol, numOfCol);
      popMatrix();
  }
  }
  
}


