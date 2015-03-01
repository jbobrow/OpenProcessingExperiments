
/*----------------------------------
 
 Copyright by Diana Lange 2014
 Don't use without any permission. Creative Commons: Attribution Non-Commercial.
 
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
 vimeo: https://vimeo.com/dianalange/videos
 
 -----------------------------------*/

PVector [] location;
PVector direction;
float step, speed, x, y, theta;
int dir=1;
boolean rev=false;


void setup () {
  size (600, 200);
  smooth();
  step = width/360.0*2;

  location = new PVector [30];
  location[0] = new PVector (0, height/2 + sin(theta)*50*dir);
  
  for (int i = 1; i < location.length; i++)
  {
    location[i] = location[0].get ();
  }
  //float angle = random (TWO_PI);
  //direction = new PVector (cos (angle), sin (angle));
}

void draw () {
  background (#57385c);
  move();
  display();
  theta += (TWO_PI/360.0*4);
  //if (frameCount%2==0 && frameCount > 359 && frameCount<721) saveFrame("image-###.gif");
}


PVector getHead () {
  return location [location.length-1].get();
}

void setHead (PVector pos) {
  location [location.length-1]= pos.get();
  updateBody ();
}

// HELPERS ---------------

void updateBody () {
  for (int i = 0; i < location.length-1; i++) {
    location [i] = location [i+1];
  }
}

// DISPLAY --------------------

void display () {
  noStroke();
  for (int i = 0; i < location.length; i++)
  {
    color c = lerpColor (#ffedbc, #A75265, map (i, 0, location.length, 1, 0 ) );
    float s = map (i, 0, location.length, 1, 40  );

    fill (c);
    ellipse (location[i].x, location [i].y, s, s);
  }
}


// MOVE -----------------------------------------

void move () {
  PVector location = getHead();

  if (x>width) rev=true;
  if (x<0) rev=false;
  if (rev) {
    x -= step;
  } else {
    x += step;
  }


  y = height/2 + sin(theta)*50*dir;

  location.x = x;
  location.y = y;

  setHead (location);
}

