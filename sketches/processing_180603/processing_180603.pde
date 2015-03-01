


void setup ()
{
  size (500, 600);
  
  stroke  (255);
  strokeWeight (0.5);
  fill (0);
   background (#F5A30A);

   //clockfeet
  fill (#FC0D29);
  ellipse (210, 140, 20, 20);
  ellipse (290, 140, 20, 20);

  //clockbody
  rect (200, 60, 100, 80);

  //cutoutsonclock
  noStroke ();
  fill (#F5A30A);
  ellipse ( 200, 60, 50, 50);
  ellipse (300, 60, 50, 50);

  //face
  stroke (#FCDA82);
  strokeWeight (2);
  fill (200);
  ellipse (250, 100, 70, 70);

  //hands
  stroke (0);
  strokeWeight (2);
  line (250, 100, 250, 80);
  strokeWeight (1);
  line (250, 100, 240, 70);
  stroke (255);
  strokeWeight (0.5);

  //fireback
  fill (#2A2D52);
  rect (100, 160, 350, 400);

  //flue
  fill (0);
  rect (240, 170, 30, 250);
  
//firesidepanels
  fill (180);
  rect (40, 170, 95, 450);
  rect (360, 170, 100, 450);
  fill (150);
rect ( 50,180,75, 440);
rect (365,180,75,440);

//sidedecoration
fill (100);
ellipse (85, 250, 50,50);
ellipse(85,350, 50,50);
ellipse (85,450,50,50);

ellipse (400, 250, 50,50);
ellipse(400,350, 50,50);
ellipse (400,450,50,50);

  //mantle
  fill (#765820);
  rect (25, 150, 450, 25);

  //leftcards
  fill (200);
  rect (150, 105, 35, 45);
  
  fill (255);
  rect (150, 100, 30, 50);
  
   fill (#7DBF28);
ellipse (165, 120,25,35);
stroke (255);
strokeWeight (3);
point (165,120);

stroke (#FA0D48);
strokeWeight  (2);
line (150,140, 165,140);

  //rightcard
  fill (200);
  rect (310, 105, 35, 45);
  fill (255);
  rect (310, 100, 30, 50);
fill (#BF284E);
rect (315,110,15,15);
fill (255);
rect (315,110,5,5);
stroke (#FA0D48);
strokeWeight  (2);
line (320,135, 330,135);
  
  strokeWeight (0.5);
  //flange
  fill (0);
  rect (230, 245, 50, 110);

  //stove
  rect (150, 250, 200, 200);
  //topplate
  rect (145, 250, 210, 5);

  //topvents
  fill (10);
  ellipse (200, 280, 15, 15);
  ellipse (250, 280, 15, 15);
  ellipse (300, 280, 15, 15);

  //leftdoor
  rect (160, 295, 90, 120);
  //rightdoor
  rect (250, 295, 90, 120);

  //bottomvents
  fill (0);
  ellipse (200, 400, 15, 15);
  ellipse (300, 400, 15, 15);

  //feet
  triangle (150, 450, 180, 450, 150, 500);
  triangle (350, 450, 320, 450, 350, 500);

  //hearth
  fill (#CE212D);
  rect (0, 490, 500, 10);
}

void draw ()
{
  //flames
  stroke (#F2590C);
  strokeWeight (random (1, 4));
  line ((random (175, 235)), 310, (random (175, 235)), 380);
  line ((random (260, 325)), 310, (random (260, 325)), 380);
  
   stroke (#FAE30D);
  strokeWeight (random (1, 4));
  line ((random (180, 230)), 370, (random (180, 230)), 380);
  line ((random (260, 325)), 370, (random (260, 325)), 380);

  //cndels
  noStroke ();
  fill (#FCF50D, 70);
  ellipse (90, 110, (random (20, 30)), (random (20, 30)));
  fill (255);
  noStroke ();
  rect (80, 110, 20, 40);
  strokeWeight (random (0.5, 2));
  stroke (#FC0D29, 50);
  line (90, (random (100, 110)), 90, 110);
  noStroke ();
  fill (#FCF50D, 70);
  ellipse (390, 110, (random (20, 30)), (random (20, 30)));
  fill (255);
  rect (380, 110, 20, 40);
  strokeWeight (random (0.5, 2));
  stroke (#FC0D29, 50);
  line (390, (random (100, 110)), 390, 110);

  //leftwindow
  fill (#F07007, 20);
  //fill (#F0D507,10);
  rect (170, 300, 70, 85);

  //rightwindow
  fill (#F07007, 20);
  //fill (#F0D507,10);
  rect (260, 300, 70, 85);

  //handle
  stroke (0);
  strokeWeight (4);
  fill (0);
  ellipse (260, 350, 10, 10);
  line (260, 350, 280, 370);
  
  //stockings
  //border
 stroke (#0CA72F);
  strokeWeight (1);
  fill (250,36,15);
  rect (55,190,40,100);
  ellipse (55, 290,80,35);
//tie
  strokeWeight (5);
  stroke (#0CA72F);
  line (90,190, 95, 170);
  
 //textbox
 fill (#FA0808);
 rect (0, 500,500,100);
 
//message
  textSize (20);
  stroke (255);
  strokeWeight (2);
  fill (0);
  text ("     To all my viewers  ", 25, 515, 500, 50);
  text  ("          Have a Merry Winter Solstice",30, 545,500,50);
  text (" ", 120, 575, 500,50);
  
}

  void keyPressed() 
  {
  save("xmascard.png");
}

