
void setup () {
  size(400,400);
  background(255,0,90);
  
}

void draw() {
  for(int m=100; m <= width; m+=100){ // sets the parameters for the progression 
    //of the circles drawn on the x-axis
    for(int n=100; n <= height; n+=100){ // sets the parameters for the progression
    //of the circles drawn on the y-axis
      circles(m,n);
    }
  }
}

 
void circles(int x, int y) { // function defines the two types circles drawn
  fill(54,49,48,20);
  ellipse(x,y,y/5,y/5); // combined with the for() command in void draw, this 
  // sets up a series of circles that vary in size according to their placement
  //on the y-axis
  fill(193,166,175,20);
  ellipse(x,y,x/5,x/5);// combined with the for() command in void draw, this 
  // sets up a series of circles that vary in size according to their placement
  //on the x-axis
  
}

