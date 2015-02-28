
//My variables


float ballY;
float ballX;



void setup()
{
  size(600, 800);
  background(255, 255, 255);
  smooth();
  frameRate(15);


//Initialize my variables
ballY = (random(800)); 
ballX = (random(800));
}


void draw()
{
   //earth
  strokeWeight(0);
  fill(65, 112, 247);

  ellipse(100, 100, 150, 150);
  //planet
  fill(245, 121, 5);
  ellipse(350, 350, 350, 350);
  //the arc
  noFill();
  strokeWeight(20);
  arc(345, 355, 365, 100, 0, PI);
     fill(255, 255,255);
  //meteor 
  strokeWeight(6);
  fill(6, 33, 113, 115);
  rect( 0, 0, width, height);
  fill( 80, 57, 42);
  ellipse( mouseX, mouseY, 50, 50 );

    //stars 
strokeWeight(0);
fill(255, 255, 255);

  ellipse( ballX, ballY, 25, 25);

  println( "ballY: " + ballY);
  ballY = (random(800));
  ballX = (random(800));
}


