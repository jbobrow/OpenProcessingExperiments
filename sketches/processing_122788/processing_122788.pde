
void setup ()
{
  size (600, 800);
  background (0);
 
}
void draw ()
{
  
  
  
  translate (width/2, 100);
  if (hour()>7 && hour () <20)
  {
    background (255, 200, 8);
  }
  else 
  {
    background (51, 63, 108);
  }
  for (int s=0; s<360; s+=30)
  {
 
 pushMatrix ();
 rotate (radians (s));
 translate (-20, 80);
 fill (255);
 rect (0, 0, 50, 10);
 popMatrix ();
  }
  // Sekunden
  float sec = map(second(), 0, 60, 0, 360);
  pushMatrix ();
  rotate (radians(sec));
  rotate (radians(180));
  translate (0, 60);
  stroke (150, 5, 18);
  fill (100);
  ellipse (0, 0, 30, 30);
  popMatrix ();
  resetMatrix ();
  
  
  
  
  translate (width/2, 300);
   for (int s=0; s<360; s+=30)
  {

 pushMatrix ();
 rotate (radians (s));
 translate (-20, 100);
 fill (255);
 rect (0, 0, 50, 10);
 popMatrix ();
  }
// Minuten
  float min = map(minute(), 0, 60, 0, 360);
  pushMatrix ();
  rotate (radians(min));
  rotate (radians(180));
  translate (0, 80);
  stroke (150, 5, 18);
  fill (100);
  ellipse (0, 0, 40, 40);
  popMatrix ();
  resetMatrix ();
  
  
  
  
    translate (width/2, 550);
   for (int s=0; s<360; s+=30)
  {

 pushMatrix ();
 rotate (radians (s));
 translate (-20, 130);
 fill (255);
 rect (0, 0, 50, 10);
 popMatrix ();
  }
 // Stunden
  float h = map(hour(), 0, 60, 0, 360);
  pushMatrix ();
  rotate (radians(h));
  rotate (radians(180));
  translate (0, 95);
  stroke (150, 5, 18);
  fill (100);
  ellipse (0, 0, 60, 60);
  popMatrix ();
  resetMatrix ();

if(second() == 1)
rotate (radians(2));
if(second () == 3)
rotate (radians (2));
if(second () == 5)
rotate (radians(2));
if(second () == 7)
rotate (radians (2));
if(second () == 9)
rotate (radians (2));
if(second () == 11)
rotate (radians (2));
if(second () == 13)
rotate (radians (2));
if(second () == 15)
rotate (radians (2));
if(second () == 17)
rotate (radians (2));
if(second () == 19)
rotate (radians (2));
if(second () == 21)
rotate (radians (2));
if(second () == 23)
rotate (radians (2));
if(second () == 25)
rotate (radians (2));
if(second () == 27)
rotate (radians (2));
if(second () == 29)
rotate (radians (2));
if(second () == 31)
rotate (radians (2));
if(second () == 33)
rotate (radians (2));
if(second () == 35)
rotate (radians (2));
if(second () == 37)
rotate (radians (2));
if(second () == 39)
rotate (radians (2));
if(second () == 41)
rotate (radians (2));
if(second () == 43)
rotate (radians (2));
if(second () == 45)
rotate (radians (2));
if(second () == 47)
rotate (radians (2));
if(second () == 49)
rotate (radians (2));
if(second () == 51)
rotate (radians (2));
if(second () == 53)
rotate (radians (2));
if(second () == 55)
rotate (radians (2));
if(second () == 57)
rotate (radians (2));
if(second () == 59)
rotate (radians (2));




if(hour() ==1 )
fill (254, 1, 1);
if(hour() == 2)
fill (254, 1, 120);
if(hour() == 3)
fill (254, 1, 227);
if(hour() == 4)
fill (203, 1, 254);
if(hour() == 5)
fill (102, 1, 254);
if(hour() == 6)
fill (37, 1, 254);
if(hour() == 7)
fill (1, 31, 254);
if(hour() == 8)
fill (1, 96, 254);
if(hour() == 9)
fill (1, 150, 254);
if(hour() == 10)
fill (1, 180, 254);
if(hour() == 11)
fill (1, 230, 254);
if(hour() == 12)
fill (1, 254, 233);
if(hour() == 13)
fill (1, 254, 180);
if(hour() == 14)
fill (1, 254, 138);
if(hour() == 15)
fill (1, 254, 84);
if(hour() == 16)
fill (1, 254, 43);
if(hour() == 17)
fill (25, 254, 1);
if(hour() == 18)
fill (114, 254, 1);
if(hour() == 19)
fill (256, 254, 1);
if(hour() == 20)
fill (197, 254, 1);
if(hour() == 21)
fill (254, 251, 1);
if(hour() == 22)
fill (254, 191, 1);
if(hour() == 23)
fill (254, 120, 1);
if(hour() == 24)
fill (254, 31, 1);

  stroke (0);
  rect (150, 300, 50, 10);
  
  
  if(second() == 1)
rotate (radians(-4));
if(second () == 3)
rotate (radians (-4));
if(second () == 5)
rotate (radians(-4));
if(second () == 7)
rotate (radians (-4));
if(second () == 9)
rotate (radians (-4));
if(second () == 11)
rotate (radians (-4));
if(second () == 13)
rotate (radians (-4));
if(second () == 15)
rotate (radians (-4));
if(second () == 17)
rotate (radians (-4));
if(second () == 19)
rotate (radians (-4));
if(second () == 21)
rotate (radians (-4));
if(second () == 23)
rotate (radians (-4));
if(second () == 25)
rotate (radians (-4));
if(second () == 27)
rotate (radians (-4));
if(second () == 29)
rotate (radians (-4));
if(second () == 31)
rotate (radians (-4));
if(second () == 33)
rotate (radians (-4));
if(second () == 35)
rotate (radians (-4));
if(second () == 37)
rotate (radians (-4));
if(second () == 39)
rotate (radians (-4));
if(second () == 41)
rotate (radians (-4));
if(second () == 43)
rotate (radians (-4));
if(second () == 45)
rotate (radians (-4));
if(second () == 47)
rotate (radians (-4));
if(second () == 49)
rotate (radians (-4));
if(second () == 51)
rotate (radians (-4));
if(second () == 53)
rotate (radians (-4));
if(second () == 55)
rotate (radians (-4));
if(second () == 57)
rotate (radians (-4));
if(second () == 59)
rotate (radians (-4));

  
  stroke (0);
  rect (400, 300, 50, 10);
}




