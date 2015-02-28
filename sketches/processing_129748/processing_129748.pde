

int x = 0 ;

void setup()
{
size(840, 500);


  noStroke();
}


void draw()
{
background (28, 191, 255);


fill (62, 255, 82, 90);
ellipse (320, 325, 80, 40);

  fill (32, 128, 23);
  rect( 250, 190, 50, 360);
  fill (random(255), random(255), random(255));
  ellipse(345,180,100,100);
    fill (random(255), random(255), random(255));
   ellipse(340,90,100,100);
     fill (random(255), random(255), random(255));
    ellipse(247,76,100,100);
      fill (random(255), random(255), random(255));
     ellipse(209,155,100,100);
       fill (random(255), random(255), random(255));
       ellipse(271,216,100,100);
  fill (#EBFA23);
  ellipse(280, 146, 100, 100);
  fill (138, 255, 200);
  rect (0, 456, width, 50);
  fill (255);
  ellipse(262,127,25,25);
  ellipse(298,127,25,25);
  fill(0);
  arc(280, 145, 50, 70, 0, PI - 0);
  fill(255);
rect (268, 145, 10, 15);
 rect (282, 145, 10, 15);
 fill (0);
 ellipse(264,132, 15,15);
 ellipse(299,132, 15,15); 
 

 fill(0);
 ellipse(x, 475, 25, 25 );

  x= x +1 ;
  if (x > width) { x = 0 ;
  }
 
 
 
   println(mouseX,mouseY);
}



