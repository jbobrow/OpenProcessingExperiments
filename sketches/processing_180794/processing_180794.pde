

float x = 0;
float y = 0;

float swimmerx = 10;
float swimmery = 300;

float r = 0;
float r2 = 0;

float time = 0;

void setup ()
{
  size (400, 400);
}
void draw ()
{
  background (#6EACFC);

  //jetty
  stroke (0);
  strokeWeight (1);
  fill (#764708);
  rect (250, 270, 150, 150);
  
  //divingboard
  fill (180);
  ellipse  (280, 265, 10, 10);
  ellipse (320, 265, 10, 10);
  rect (180, 255, 200, 5);

  //underjetty
  fill (#6EACFC);
  rect (280, 280, 130, 150);

  //mill
  noStroke ();
  fill (#CE3425);
  rect (0, 0, 150, 100);
  stroke (#CE3425);
  strokeWeight (10);
  line (0,200, 100, 100);
  
  //race
  stroke (#896E46);
  strokeWeight (8);
  line(0, 40, 110, 50); 
  noStroke ();
  fill(0);
  rect (0, 30, 90, 20);
  
  //water
  fill (#C2D6FC, 95);
  ellipse (118,76,20,50);
  ellipse (130, (random(150, 400)), (random (30)), (random (50, 100)));
  
  //wheel
    translate (100, 100);
  rotate (r); 
  //spokes
  stroke (0);
  strokeWeight (10);
  line (x, y, x+60, y);
  line (x, y, x - 60, y);
  line (x, y, x, y + 60);
  line (x, y, x, y - 60);

  resetMatrix ();

  fill(0);
  ellipse (100,100,75,75);
  noFill ();
  stroke (#67643E);
  strokeWeight (5);
  ellipse (100,100,65,65);

  translate (100, 100);
  rotate (r2);
noStroke ();
  fill (95,95,95);
   ellipse (x,y,30,30);

   resetMatrix(); 
 //swimmer
  noStroke();
  fill (#FCC2E5, 90);
  ellipse (swimmerx, swimmery, 25, 25);
  ellipse (swimmerx, swimmery + 50, 40, 80);
 //eyes
  fill (#5F5D2F);
  ellipse (swimmerx - 5, swimmery, 5, 5);
  ellipse (swimmerx + 5, swimmery, 5, 5);
//nose
ellipse (swimmerx, swimmery + 3, 2,2);
stroke (#983E02);
strokeWeight (4);
//mouth 
point ( swimmerx, swimmery +5);
//cap
noStroke ();
fill (255);
ellipse (swimmerx, swimmery - 8, 18,8);

  stroke (255);

  float x = 0;

  while (x < width) 
  {
    stroke (#A1F2D1);
    line(x, 300 + 20 * noise(x / 100, time), x, height);
    x = x + 1;
  }

  time = time + 0.02;

  fill (0);
  textSize (20);
  text ("whoooooo - cold!", 20, 380);
  
  r = r + 0.01;
  r2 = r2 + 0.02;
   swimmerx = swimmerx + 0.1;
   
   if    (swimmerx >130)
   {
     swimmerx = 130;
   
   }
}

