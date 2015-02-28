
void setup() {
  size(500,500);
  background(255);
  smooth();
  for(int x = 0; x < width; x += 25) {      //first loop creates x gridding and spacing
    for(int y = 0; y < height; y += 25) {   //second creates y gridding and spacing
      compose(x,y);                         //call for the function 'compose to draw within the grid created
    }
  }
  for(int s = 0; s < 100; s++) {            //create a second series of loops. This one creates the angle of rotation for the squares
    for(int t  = 0; t < 100; t++) {         //second one creates the amount of variant for the y position of the rectangle drawn
      composeII(s,t);                       //
    }
  }
}

void compose(float a, float b) {            //creating the function for the first compostion to draw the ellipses within the grid. Translation is used
  pushMatrix();           
  translate(a,b);      
  noStroke();      
  fill(200); 
  ellipse(a,b,50,50);
  popMatrix();
}

void composeII(float c, float d) {          //creating the second function using rotation instead of translation to create a shape
  pushMatrix();
  translate(width/2,height/2);
  rotate(c);
  stroke(d);
  noFill();
  rectMode(CENTER);
  rect(100,d,50,50);
  popMatrix();
}


