
//01/22/2011  |  Molly Morin  |  mollymorin.com
//development sample for lesson 1, learning processing
//created for Emerging Formats for Digital Art, University of Notre Dame

////setup:  this defines the size and some features of your sketch

void setup(){
  size (500,500);//the size of your sketch in pixels
  smooth();//turns on anti-ailiasing, witch smooths out some rough edges
}

////draw:  this is where the action happens

void draw(){
  //background color in Red, Green, Blue
  //there is a handy color wheel here:http://bluelobsterart.com/wordpress/wp-content/uploads/2009/03/rgb-color-wheel-lg.jpg
  background(250, 230, 160);//pale yellow
  
  //set the rectangle mode so it draws form the center
  //cause I like it that way
  rectMode(CENTER);
  
  //body
  stroke(0);//black
  fill(50);//almost black
  rect(250, 245,20,30);
  
  //spots on body
  //i just ballparked these and then monkeed around with them till they looked right
  noStroke();
  fill(255,0,0);//red
  ellipse(250, 240, 4, 4);
  ellipse(250, 246, 7, 7); 
  ellipse(250, 254, 10, 10);
  
  //front left leg
  stroke(0); //solid black
  strokeWeight(2);//line will have a thickness of 2
  line (240, 230, 210, 200);//this line is the segment that connects to the body
  stroke(0, 190);//semi-transparent black
  //I don't need to define stroke weight because it is the same
  line (210, 200, 230, 100);//middle segment
  strokeWeight(1);
  line (230, 100, 240, 73);//end segment
  
  //front right leg
  stroke(0); //solid black!!!need to be re-set
  strokeWeight(2);
  line (260, 230, 290, 200);
  stroke(0, 190);
  line (290, 200, 270, 100);
  strokeWeight(1);
  line (270, 100, 260, 73);
  
  //back left leg
  stroke(0); 
  strokeWeight(3);
  line (240, 260, 180, 310);//body segment
  strokeWeight(2);
  stroke(0, 190);
  line (180, 310, 210, 390);//middle segment
  strokeWeight(1);
  line (210, 390, 220, 420);//end segment
  
  //back right leg
  stroke(0); 
  strokeWeight(3);
  line (260, 260, 320, 310);//body segment
  strokeWeight(2);
  stroke(0, 190);
  line (320, 310, 290, 390);//middle segment
  strokeWeight(1);
  line (290, 390, 280, 420);//end segment
  
}

//notes:  This is not effecient, even for a sketch without variables
//that's OK, we can make it more efficient later

