
float x;  //x will be a decimal number which affects rotation

void setup(){  //run setup once
 size(250,250); //set up size of canvas
 background(0); //background is black
 noStroke(); //do not draw outlines of shapes
 ellipseMode(CENTER); //draw ellipses using coordinates of center
 rectMode(CENTER); //draw rectangles the same way
 smooth(); //anti-aliasing
 x = 0.0; //initialize x at 0
}

void draw(){  //repeating draw function
  frameRate(60);  //framerate for animation at 60fps
  background(0);  //redraw background black to clear previous draw
  translate(125,125); //origin to center of canvas
  stroke(50);  //stroke is greyscale value of 50
  strokeWeight(2);  //stroke is two pixels wide
  fill(0);  //inside of shapes is black to draw orbital rings
  for(int e = 220; e > 80; e-=40){ //loop draws orbital rings
    ellipse(0,0,e,e);  //diameters of 110, 90, 70, 50
  }
  noStroke();  //no outlines for orbiting forms or center form
  fill(255);  //forms are white
  rotate((-PI*x));  //turn outer-most form
  ellipse(110,0,10,10);
  rotate(PI*x*3);  //as we get closer to center
  ellipse(90,0,10,10);
  rotate((-PI*x)*5);  //the forms speed up
  ellipse(70,0,10,10);
  rotate(PI*x*7);  // like real planets
  ellipse(50,0,10,10);
  
  rotate((-PI*x)*9);  //center form rotates the fastest
  fill(0);  //it is also black
  stroke(255);  //but the outline is white
  strokeWeight(10);  //outline is thick, creating a square
  rect(0,0, 20, 20);  //inside of another square
  if(x>2.0){  //check value of x so we can reset it when the orbit has travelled around
    x=0.0;
  }else{
    x+=0.01;  //while orbit has not finished, keep increasing x
  }
}
