
float x = 25;
float y = 25;
float colour1 = 25;
float colour2 = 25;
float colour3 = 25;
float xspeed = 7;
float yspeed = 13;


void setup () {

  size (400, 400);
  smooth (); 
  ellipseMode (CENTER);
}

void draw () {

  noStroke ();
  background (110, 150, 200);
  fill (colour1, colour2, colour3);
  ellipse (x, y, 50, 50);

  x += xspeed;
  y += yspeed;

  if (x > width - 25) {

    xspeed = -xspeed;
    colour1 = random(255);
  } 
  else if (x < 25) {

    xspeed = -xspeed;
    colour3 = random(255);
  }

  if (y > height - 25) {

    yspeed = -yspeed;
    colour1 = random(255);
  } 
  else if (y < 25) {

    yspeed = -yspeed;
    colour2 = random(255);
  }

}

void mousePressed () {
 
  xspeed = random (-13, 13);
  yspeed = random (-13, 13);
  colour1 = random(255);
  colour2 = random(255);
  colour3 = random(255);
 
} 

