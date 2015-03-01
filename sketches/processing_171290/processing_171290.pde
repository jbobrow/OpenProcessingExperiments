
void setup()
{
  size (600, 600);
  background (255);
}

void draw ()
{
  background (171, 209, 160);

  noStroke();

//cupcake
  fill (232, 190, 152);
  ellipseMode (CENTER);
  ellipse (width/2, height/2, 260, 140);

//cupcake foil
  fill (199, 68, 73);
  quad (170, 305, 430, 305, 375, 485, 223, 485);
 
 //cake cover
  fill (232, 190, 152);
  ellipse (width/2, height/2, 260, 60);

//frosting
  fill (248, 242, 166 );
  triangle ( 184, 265, 415, 265, 295, 182  );
  ellipse (216, 270, 90, 70);
  ellipse (300, 276, 100, 70 );
  ellipse (380, 270, 90, 70 );
 
  ellipse (230, 235, 60, 60 );
  ellipse( 365, 235, 60, 60 );

  //candle
    noFill ();
  stroke (0);
  strokeWeight(3);
 line(300, 120, 300, 78);
 
 noStroke();
  fill (167, 216, 255);
  rectMode (CENTER);
  rect (300, 155, 35, 125);
  
  //flame
  fill (252, 141, 71);
  triangle (300, 45, 305, 60, 295, 60);
  ellipse (300, 71, 18, 32);

      
  //top frosting
  
  fill (248, 242, 166);
  ellipse (300, 215, 145, 86);
  
  
  //flicker
  fill (random (0, 255), random (0, 255), random (0, 255), 80 );
  strokeWeight (2);
  stroke (random (0, 255), random (0, 255), random (0, 255), 80);
  
  ellipse (257, 75, 20, 20);
  ellipse (328, 83, 10, 10);
  ellipse(333, 28, 25, 25);
  ellipse (226, 32, 12, 12);
  ellipse (215, 133, 18, 18);
  ellipse (287, 39, 4, 4);
  ellipse (372, 100, 28, 28);
  ellipse ( 353, 143, 6,6);
  ellipse (398, 43, 8, 8);
  ellipse (167, 79, 9, 9);




  println (mouseX, mouseY);
}

