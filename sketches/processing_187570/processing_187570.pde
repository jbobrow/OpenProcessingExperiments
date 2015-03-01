
int[][] nums;

void setup() {
  size(450, 450);
  smooth();
  
  //This isn't really used here, but it could be useful maybe? Puts numbers to each circle.
  nums=new int[3][3];
  for (int i=0; i<3; i++) {
    for (int j=0; j<3; j++) {
      nums[i][j]=i*3+j+1;
    }
  }
  stroke(255);
  strokeWeight(3);
}

void draw() {
  background(0);
  for (int i=0; i<3; i++) {
    for (int j=0; j<3; j++) {
      //When I hover over a circle, print its X,Y to the console, and fill it light gray
      if (mouseX>75+j*150-25 && mouseX<75+j*150+25 && mouseY>75+i*150-25 && mouseY<75+i*150+25)
      {
        println(i + " , " + j);
        fill(110);
        
      }
      else {
        fill(0);
      }
      
      //Draw lines from any circle NOT in the last coluumn
        //Then draw an extra diagonal line from any circle with the same X,Y coord.
          //THEN draw extra diagonals from the middle circle.
      if (j < 2){
        stroke(255);
        line(75+j*150, 75+i*150, 75+(j+1)*150, 75+i*150);
        if (i == j){
          stroke(255);
          line(75+j*150, 75+i*150, 75+(j+1)*150, 75+(i+1)*150);
          if(i == 1) {
            stroke(255);
            line(75+j*150, 75+i*150, 55+(j+1)*150, 95+(i-1)*150); //This is a makeshift fix, not sure where the exact problem here is
            line(75+j*150, 75+i*150, 75+(j-1)*150, 75+(i+1)*150);
          }
        }
      }
      
      //Draw lines from any circle NOT in the last row
      if (i < 2){
        stroke(255);
        line(75+j*150, 75+i*150, 75+j*150, 225+i*150);
      }
      
      //the dumb math here -> <offset> + i [or j] * <distance between circles>
      ellipse(75+j*150, 75+i*150, 50, 50);
    }
  }
}
