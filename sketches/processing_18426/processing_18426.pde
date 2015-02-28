
//01/22/2011  |  Molly Morin  |  mollymorin.com
//development sample for lesson 1, learning processing
//created for Emerging Formats for Digital Art, University of Notre Dame
//  Here we re-define the zoog from its center, and call it mouseX, mouseY
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
  rect(mouseX, mouseY,20,30);
  
  //spots on body
  //i just ballparked these and then monkeed around with them till they looked right
  noStroke();
  fill(255,0,0);//red
  ellipse(mouseX, mouseY-5, 4, 4);
  ellipse(mouseX, mouseY+1, 7, 7); 
  ellipse(mouseX, mouseY+6, 10, 10);
  
  //front left leg
  stroke(0); //solid black
  strokeWeight(2);
  line (mouseX-10, mouseY-15, mouseX-40, mouseY-45);//body segment
  stroke(0, 190);
  line (mouseX-40, mouseY-45, mouseX-20, mouseY-145);//middle segment
  strokeWeight(1);
  line (mouseX-20, mouseY-145, mouseX-10, mouseY-172);//end segment
  
  //front right leg
  //notice the symmetry...where x values are "-10 above, it is +10 here
  //y values are the same, as symmetry is along y axis
  stroke(0); 
  strokeWeight(2);
  line (mouseX+10, mouseY-15, mouseX+40, mouseY-45);//body segment
  stroke(0, 190);
  line (mouseX+40, mouseY-45, mouseX+20, mouseY-145);//middle segment
  strokeWeight(1);
  line (mouseX+20, mouseY-145, mouseX+10, mouseY-172);//end segment
  
  //back left leg
  stroke(0); 
  strokeWeight(3);
  line (mouseX-10, mouseY+15, mouseX-70, mouseY+65);//body segment
  strokeWeight(2);
  stroke(0, 190);
  line (mouseX-70, mouseY+65, mouseX-40, mouseY+145);//middle segment
  strokeWeight(1);
  line (mouseX-40, mouseY+145, mouseX-35, mouseY+175);//end segment
  
  //back right leg
  stroke(0); 
  strokeWeight(3);
  line (mouseX+10, mouseY+15, mouseX+70, mouseY+65);//body segment
  strokeWeight(2);
  stroke(0, 190);
  line (mouseX+70, mouseY+65, mouseX+40, mouseY+145);//middle segment
  strokeWeight(1);
  line (mouseX+40, mouseY+145, mouseX+35, mouseY+175);//end segment
  
}

//notes:  This is not effecient, even for a sketch without variables
//that's OK, we can make it more efficient later

