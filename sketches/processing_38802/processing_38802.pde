
//homework 7
//copyright Jessica Schafer
//note: I used a butterfly instead of my initials. they were getting old!


float puckx, pucky, speedX, speedY, dia;
//puckx, pucky: x, y of puck the butterfly
//speedX: increment of horizontal movement
//speedY: increment of vertical movement
//dia: diameter of puck
color col1, col2, col3, col4, col5;

void setup ()
{
 size (500, 500);
 smooth();
 puckx = width/2;
 pucky = height/2;
 speedX = 0;
 speedY = 0;
 dia = 100;
 col1 = color (255, 250, 213);//ivory
 col2 = color (189, 73, 50);//orange
 col3 = color (219, 158, 54);//gold
 col4 = color (255, 211, 78);//yellow
 col5 = color (16, 91, 99); //extra blue that works with these colors
}

void draw ()
{
  drawBackground();
  drawPuck();
  showSpeed();
  movePuckHorizontal();
  movePuckVertical();
  reset();
}

void reset()
{
 if (keyPressed)
 {
   puckx = width/2;
   pucky = height/2;
   speedX = 0;
   speedY = 0;
 } 
}

void movePuckVertical()
{
 if (frameCount > 50)
 {
     if (mouseY != pmouseY)
       {
         speedY = speedY + .03*(mouseY-pmouseY);
       }
     pucky = pucky + speedY;
  }
 
//loop around if goes off-screen 
 if (pucky > height + dia/2) 
   {
     pucky = -dia/2;
   }
 if (pucky < -dia/2)
   {
     pucky = height + dia/2; 
   }
}


void movePuckHorizontal()
{
  if (frameCount > 50)
  {
     if (mouseX != pmouseX) 
     {
      speedX = speedX + .03*(mouseX-pmouseX);
     }
     puckx = puckx + speedX;
   }  
 
 //loop around if goes off-screen
 if (puckx > width + dia/2)
   {
     puckx = -dia/2;
   }
 if (puckx < -dia/2)
   {
    puckx = width + dia/2; 
   }
}

void showSpeed()
{
  fill (col1);
  rect (0, height-30, width, height); 
  fill (col5);
  text ("horizontal speed: " + speedX, 30, 490); 
  text ("vertical speed: " + speedY, 250, 490);
}

void drawPuck ()
{
 //puck the butterfly!
  stroke (col2);
  //atennae
  strokeWeight(.5);
  line (puckx+25, pucky-25, puckx+25,pucky-40);
  line (puckx+25, pucky-25, puckx+40, pucky-25);
  noStroke();
  //wings
  fill (col3);
  ellipse (puckx, pucky+25, 50,50);
  ellipse (puckx-25, pucky, 50, 50);
  fill (col4);
  ellipse (puckx, pucky-25, 50, 50);
  ellipse (puckx+25, pucky, 50,50);
  //body
  stroke(col2);
  strokeWeight(5);
  line (puckx-25, pucky+25, puckx+25, pucky-25);
  noStroke();
}

void drawBackground()
{
 fill (col1, 50);
 rect (0, 0, width, height); 
}               
