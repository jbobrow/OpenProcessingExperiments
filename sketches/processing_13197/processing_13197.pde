
//float height= random (10,300);
//float width= random (10, 50);


void setup () {
  size (1500,500);
  background (255);
  smooth ();
}

void draw () {
  //buildings
  
  //first block
    rectMode (CENTER);
  rect (100,350, 75,300);
  fill (0);
  stroke (0);
  
   rectMode (CENTER);
  rect (150,350, 75,200);
  fill (0);
  stroke (0);
  
   rectMode (CENTER);
  rect (175,350, 75,400);
  fill (0);
  stroke (0);
  
  rectMode (CENTER);
  rect (250,350, 100,250);
  fill (0);
  stroke (0);
  
   rectMode (CENTER);
  rect (300,350, 75,550);
  fill (0);
  stroke (0);
  
    rectMode (CENTER);
  rect (350,350, 100,300);
  fill (0);
  stroke (0);
  
    rectMode (CENTER);
  rect (400,350, 75,200);
  fill (0);
  stroke (0);
  
  rectMode (CENTER);
  rect (450,350, 75,450);
  fill (0);
  stroke (0);

  //second block
    rectMode (CENTER);
  rect (700,350, 100,100);
  fill (0);
  stroke (0);
  
    rectMode (CENTER);
  rect (800,350, 125,125);
  fill (0);
  stroke (0);
  
    rectMode (CENTER);
  rect (850,350, 100,200);
  fill (0);
  stroke (0);
  
    rectMode (CENTER);
  rect (950,350, 100,175);
  fill (0);
  stroke (0);
  
    rectMode (CENTER);
  rect (1000,350, 100,100);
  fill (0);
  stroke (0);
  
  
  //third block
     rectMode (CENTER);
  rect (1200,350, 75,300);
  fill (0);
  stroke (0);
  
    rectMode (CENTER);
  rect (1250,350, 100,250);
  fill (0);
  stroke (0);
  
   rectMode (CENTER);
  rect (1300,350, 75,550);
  fill (0);
  stroke (0);
  
    rectMode (CENTER);
  rect (1350,350, 100,300);
  fill (0);
  stroke (0);
  
    rectMode (CENTER);
  rect (1400,350, 75,200);
  fill (0);
  stroke (0);
  
  rectMode (CENTER);
  rect (1450,350, 75,450);
  fill (0);
  stroke (0);
  
  //ground
  rectMode (CENTER);
  rect (750, 450, 1500,100);
  fill (0);
  stroke (0);
  
  
  
  stroke (0);
  abs (mouseX-pmouseX); //the speed at which the mouse is moving
  line (pmouseX, pmouseY, mouseX, mouseY);

}

void keyPressed () {
  background (255);
  rectMode (CENTER);
  rect (0, 450, 3000,100);
  fill (175);
  stroke (0);
}

