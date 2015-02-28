
/*

Random Lines
jacky@kwancreative.com
June 18,2009

*/

float x;
float y;


void setup () {

  size (600,600);
  smooth ();
  background (255);
  x = width/3;
  y = height/3;
}


void draw () {

  float newx = constrain (x + random (-20,20),0,width);
  float newy = constrain (y + random (-20,20),0,height);

  stroke (2);
  strokeWeight (1);
  line (x,y,1,1);

  x = newx;
  y = newy;
  
  line (y,x,1,1);
}

void mousePressed () {

  save("pattern" + key + ".jpg");

};

