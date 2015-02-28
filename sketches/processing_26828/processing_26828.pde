
//Jasmine Hoyle
//April 2011
//SDES3107 Project 1

//Declare Variables
float flwrX;
float flwrY;
float flwrXsecond;
float flwrYsecond;
float flwrXthird;
float flwrYthird;
float circleR;
float circleG;
float circleB;
boolean going = false;
boolean blackcircle=false;

void setup() {
  size(500,500);        // Set the size of the window
  flwrX = width/2;      // Flower always starts in the middle
  flwrY = height - 600; // Flower starts above the screen
  flwrXsecond = width-86;      // second flower starts off-center
  flwrYsecond = height - 600;
  flwrXthird = width/6; //third flower starts off-center
  flwrYthird = height-600;
  smooth();
}

void draw() {

  background(150, 200, 255);  // Draw a blue background 


  // Set ellipses and rects to CENTER mode
  ellipseMode(CENTER);

  //Draw the first flower
  // Draw Petals
  // flwrX and flwrY are used for the shape locations.
  fill(255);
  arc(flwrX, flwrY, 120, 10, -PI, 0);  
  arc(flwrX, flwrY, 120, 10, 0, PI);
  arc(flwrX, flwrY, 10,120, -PI/2, PI/2);
  arc(flwrX, flwrY, 10,120, PI/2, 3*PI/2);


  // Draw Flower Lines
  fill(255);
  line(flwrX-35, flwrY+45, flwrX+35, flwrY-45);
  line(flwrX+35,flwrY+45, flwrX-35, flwrY-45);
  line(flwrX-45, flwrY+25, flwrX+45, flwrY-25);
  line(flwrX+45, flwrY+25, flwrX-45,flwrY-25);

  //Draw the Coloured Circles
  fill(circleR, circleG, circleB);
  ellipse(flwrX-35,flwrY+45, 10,10);
  ellipse(flwrX+35,flwrY-45,10,10);
  ellipse(flwrX-35,flwrY-45,10,10);
  ellipse(flwrX-45,flwrY+25,10,10);
  ellipse(flwrX+45,flwrY-25,10,10);
  ellipse(flwrX+45,flwrY+25,10,10);
  ellipse(flwrX-45, flwrY-25,10,10);
  ellipse(flwrX+35, flwrY+45, 10, 10);


  // Draw Flower Center
  fill(circleR,circleG, circleB);
  ellipse(flwrX, flwrY, 20, 20);
  
   
   //Draw second flower
   // Draw Petals
  // flwrXsecond and flwrYsecond are used for the shape locations.
  fill(255);
  arc(flwrXsecond, flwrYsecond, 120, 10, -PI, 0);  
  arc(flwrXsecond, flwrYsecond, 120, 10, 0, PI);
  arc(flwrXsecond, flwrYsecond, 10,120, -PI/2, PI/2);
  arc(flwrXsecond, flwrYsecond, 10,120, PI/2, 3*PI/2);


  // Draw Flower Lines
  fill(255);
  line(flwrXsecond-35, flwrYsecond+45, flwrXsecond+35, flwrYsecond-45);
  line(flwrXsecond+35,flwrYsecond+45, flwrXsecond-35, flwrYsecond-45);
  line(flwrXsecond-45, flwrYsecond+25, flwrXsecond+45, flwrYsecond-25);
  line(flwrXsecond+45, flwrYsecond+25, flwrXsecond-45,flwrYsecond-25);

  //Draw the Coloured Circles
  fill(circleR, circleG, circleB);
  ellipse(flwrXsecond-35,flwrYsecond+45, 10,10);
  ellipse(flwrXsecond+35,flwrYsecond-45,10,10);
  ellipse(flwrXsecond-35,flwrYsecond-45,10,10);
  ellipse(flwrXsecond-45,flwrYsecond+25,10,10);
  ellipse(flwrXsecond+45,flwrYsecond-25,10,10);
  ellipse(flwrXsecond+45,flwrYsecond+25,10,10);
  ellipse(flwrXsecond-45, flwrYsecond-25,10,10);
  ellipse(flwrXsecond+35, flwrYsecond+45, 10, 10);

  // Draw Flower Center
  fill(circleR,circleG, circleB);
  ellipse(flwrXsecond, flwrYsecond, 20, 20);
  
  //Draw Flower Three
  // Draw Petals
  // flwrXthird and flwrYthird are used for the shape locations.
  fill(255);
  arc(flwrXthird, flwrYthird, 120, 10, -PI, 0);  
  arc(flwrXthird, flwrYthird, 120, 10, 0, PI);
  arc(flwrXthird, flwrYthird, 10,120, -PI/2, PI/2);
  arc(flwrXthird, flwrYthird, 10,120, PI/2, 3*PI/2);

  // Draw Flower Lines
  fill(255);
  line(flwrXthird-35, flwrYthird+45, flwrXthird+35, flwrYthird-45);
  line(flwrXthird+35,flwrYthird+45, flwrXthird-35, flwrYthird-45);
  line(flwrXthird-45, flwrYthird+25, flwrXthird+45, flwrYthird-25);
  line(flwrXthird+45, flwrYthird+25, flwrXthird-45,flwrYthird-25);

  //Draw the Coloured Circles
  fill(circleR, circleG, circleB);
  ellipse(flwrXthird-35,flwrYthird+45, 10,10);
  ellipse(flwrXthird+35,flwrYthird-45,10,10);
  ellipse(flwrXthird-35,flwrYthird-45,10,10);
  ellipse(flwrXthird-45,flwrYthird+25,10,10);
  ellipse(flwrXthird+45,flwrYthird-25,10,10);
  ellipse(flwrXthird+45,flwrYthird+25,10,10);
  ellipse(flwrXthird-45, flwrYthird-25,10,10);
  ellipse(flwrXthird+35, flwrYthird+45, 10, 10);

  // Draw Flower Center
  fill(circleR,circleG, circleB);
  ellipse(flwrXthird, flwrYthird, 20, 20);



  // Flower Moves Down + Random Colour Change on Key Press
  if (blackcircle) {
  circleR = random(255);
  circleG = random(255);
  circleB = random(255);
    
  }
  
  else {
 circleR = 255;
 circleG = 255;
 circleB = 255;
  }
 

  if (going) {
    flwrY = flwrY + .7; 
    flwrYsecond = flwrYsecond +1.1;
    flwrYthird= flwrYthird +.9;
  }

//flower restarts from the top of the screen when it reaches the bottom of the screen
  if(flwrY>height+100) {
    flwrY=height-600;
  }
  
  if(flwrYsecond>height+100) {
    flwrYsecond=height-600;
  }

if (flwrYthird>height+100){
  flwrYthird=height-600;
  }
}
void mousePressed() {
  going = true;
}

void keyPressed() {
  blackcircle = true;
}




 
  
 
 


