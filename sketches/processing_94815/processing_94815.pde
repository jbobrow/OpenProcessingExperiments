
int i; //Beginning  

void setup(){ //To get background
  fill(0); //Background color
  size(500,500); //Background size
  frameRate(5); //Frame size
  stroke(0); //Stroke weight
}

void draw(){ //Calling out voids
  if (random(0,1)< 0.5){ //if statement
  } else{ //else statement
  }
  for(i=0; i<10; i++){ //for statement
    int r= (int)random(-500,500); //int product information
    int m= (int)random(-500,500); //int product information
    orange(r,m,50); //orange call out
    tip(r,m,10); //tip of orange call out
  }
  orange(0,0,400); //first orange call out
  tip(0,0,20); //first tip call out
}

void orange(int x, int y, int size){ //Orange code
  smooth(); //To make it smooth
  fill(237,119,0); //Color of orange
  ellipse(250+x,250+y,size,size); //Shape of orange
}

void tip(int x, int y, int size){ //Tip code
  fill(17,137,39); //Tip color
  ellipse(250+x,55+y,size,size/2); //Shape of tip
}

              

