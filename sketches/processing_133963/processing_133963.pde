
/* Not your average valentines day card. Interactive animations 
reveal a hidden text. Triggered by mouse position only */ 


int x1 = 0; 
int x2 = 500;
int x3 = 0;

void setup ()
{
  size (500, 500);
  background (#088A85);
  noStroke ();
  }

void draw ()
{
  textSize (24);
  fill (#088A85); 
  text ("I am curious", 50, 130);
  text ("what will happen next", 200, 255);
  text ("between us", 100, 380);
  fill (0);
  rect (0, 100, 10, 50);
  rect (490, 225, 10, 50);
  rect (0, 350, 10, 50);
  if (pmouseX >= 0 && (pmouseX <= 10))
 {
   if (pmouseY >= 100 && (pmouseY <= 150))
     {
    x1++;
    fill (0);
    ellipse (x1, 125, 50, 50); 
    fill (255);
    ellipse (x1-5, 115, 10, 3);
    ellipse (x1-5, 140, 10,3);
     }
  }
  if (pmouseX >=490 && (pmouseX <= 500))
  {
    if (pmouseY >= 225 && (pmouseY <= 275))
    {
      x2--;
      fill (0);
      ellipse (x2, 250, 50, 50);
      fill (255);
      ellipse (x2+5, 235, 10, 3);
      ellipse (x2+5, 265, 10, 3);
    }
  }
  if (pmouseX >= 0 && (pmouseX <= 10))
 {
   if (pmouseY >= 350 && (pmouseY <= 400))
     {
    x3++;
    fill (0);
    ellipse (x3, 375, 50, 50); 
    fill (255);
    ellipse (x3-5, 360, 10, 3);
    ellipse (x3-5, 390, 10,3);
     }
  } 
}


