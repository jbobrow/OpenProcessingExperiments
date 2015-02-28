
// eunkic ICE#3
// variables declarations

float x, y;
float wd, ht;

// functions

void setup () // functions header
{  
  size (400, 400);
  background (29, 89, 129); // functions body
}


void draw () 
{
  x = mouseX;
  y = mouseY;
  wd = 400;
  ht = 400;

  fill (255, 238, 41, 30); // added opacity because it looks prettier
  noStroke ();
  ellipse (x, y, .2*wd, .2*ht);

}


