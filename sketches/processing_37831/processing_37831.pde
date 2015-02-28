
void setup(){
  size (400,400);
  background(0);
}

void draw(){
  
  
  noFill();
  rectMode(CENTER);
  
  for(int x=0; x<width; x++){//creates a horizontal repetition of squares
    for(int y=0; y<height; y++){//creates a vertical repetition of the horizontal bar of repeated squares
      stroke(255);
      for(int rectSize=100; rectSize>0; rectSize-=5){//creates the repeated squares
        rect((0+(x*50)),(0+(y*100)),rectSize,rectSize);  //x is times 50 to get the overlap that creates the pattern
      }                                                  //as opposed to the *100 that gets them to line up side by side
    }
  }
}

