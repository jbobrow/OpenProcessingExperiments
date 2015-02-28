
//
// ITGM 315 - Fundamentals of Programming for Artists
// Winter 2013
// Professor Altman
//
// Matt Bone
// Programming assignment 1 - Getting Started with Processing
//

void setup() {
  size(800,800);
}

void draw() {
  background(150);

  ellipseMode(CENTER);
  rectMode(CENTER);

  fill(211,211,211);
  ellipse(420,467,30,25);    // Right leg knee
  fill(255,255,255);
  rect(420,375,25,150);      // Right leg thigh
  rect(420,560,25,150);      // Right leg shin
  fill(206,6,6);
  triangle(435,640,435,660,mouseX+500,660);  //Right foot
  fill(211,211,211);
  ellipse(420,650,23,23);
  fill(255,255,255);

  fill(211,211,211);
  ellipse(380,467,30,25);    // Left leg knee
  fill(255,255,255);
  rect(380,375,25,150);      // Left leg thigh
  rect(380,560,25,150);      // Left leg shin
  fill(206,6,6);
  triangle(365,640,365,660,mouseX-500,660);  // Left foot
  fill(211,211,211);
  ellipse(380,650,23,23);
  fill(255,255,255);

  fill(255-((float)mouseY/width)*255);  //Body
  ellipse(400,200,300,300);
  fill(255,255,255);

  ellipse(400,100,100,120);    //Head

  if (mousePressed && (mouseButton == LEFT)) {  // Left Eye
  
      ellipse(375,80,10,10);
      ellipse(375,80,6,8);
  } else {
      ellipse(375,80,25,25);
      ellipse(375,80,20,22);
  }
  
if (mousePressed && (mouseButton == RIGHT)) {  // Right Eye
     ellipse(425,80,30,40);
     ellipse(425,80,25,37);
  } else {
     ellipse(425,80,25,25);
     ellipse(425,80,20,22);
  }

  line(415,133,420,122);      //Face lines
  line(415,133,420,130);
  line(380,122,385,133);      
  line(380,130,385,133);

  stroke(0,0,0,((float)mouseX/width)*255);  //Right Arm and hand
  line(500,300,550,350);      
  line(550,350,600,250);
  line(600,250,618,205);
  line(600,250,608,212);
  line(600,250,599,218);
  line(600,250,589,220);
  stroke(0);

  stroke(0,0,0,255-((float)mouseX/width)*255);  //Left Arm and hand
  line(300,300,250,350);      
  line(250,350,200,250);
  line(200,250,182,205);
  line(200,250,192,212);
  line(200,250,201,218);
  line(200,250,211,220);
  stroke(0);

  line(415,125,415,180);      //Nossle
  line(385,125,385,180);
  noStroke();
  rect(400,150,28,50);
  stroke(0);
  fill(206,6,6);
  ellipse(400,180,30,20);
  fill(211,211,211);
  ellipse(403,177,5,5);
  ellipse(397,177,5,5);
  ellipse(393,183,5,5);
  ellipse(407,183,5,5);
  ellipse(400,183,5,5);

}


