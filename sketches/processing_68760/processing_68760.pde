
//Christopher Chan
//ckchan@andrew.cmu.edu
//Assignment 3
//(c) written on sept 5 2012

float a, b, re, gr, bl, x ;

void setup ()
{
  size (400, 400);
  smooth ();
  a = 50;
  b = 50;
  re = 255;
  gr = 255;
  bl = 255;
  x = 30;
}

void draw ()
{
  frameRate (x);
  fill (#000000, 10);
  rect (0, 0, 400, 400);
  stroke (re, gr, bl, 65);
  line (pmouseX-random(-a, a), pmouseY-random(-b, b), pmouseX+random(-a, a), pmouseY+random(-b, b));
  line (pmouseX-random(-a, a), pmouseY-random(-b, b), pmouseX+random(-a, a), pmouseY+random(-b, b));
  line (pmouseX-random(-a, a), pmouseY-random(-b, b), pmouseX+random(-a, a), pmouseY+random(-b, b));
  line (pmouseX-random(-a, a), pmouseY-random(-b, b), pmouseX+random(-a, a), pmouseY+random(-b, b));
  line (pmouseX-random(-a, a), pmouseY-random(-b, b), pmouseX+random(-a, a), pmouseY+random(-b, b));
  line (pmouseX-random(-a, a), pmouseY-random(-b, b), pmouseX+random(-a, a), pmouseY+random(-b, b));    
  line (pmouseX-random(-a, a), pmouseY-random(-b, b), pmouseX+random(-a, a), pmouseY+random(-b, b));
  line (pmouseX-random(-a, a), pmouseY-random(-b, b), pmouseX+random(-a, a), pmouseY+random(-b, b));
  line (pmouseX-random(-a, a), pmouseY-random(-b, b), pmouseX+random(-a, a), pmouseY+random(-b, b));
  line (pmouseX-random(-a, a), pmouseY-random(-b, b), pmouseX+random(-a, a), pmouseY+random(-b, b));

  noStroke ();
  noFill ();
  rect (mouseX-a, mouseY-b, a*2, b*2);
}

void keyPressed () {
  if (key == 'q') {
    a = a+10;
  }
  else if (key == 'a') {
    a = a-10;
  }
  else if (key == 'z') {
    a = 50;
  }  
  
  else if (key == 'w') {
    b = b+10;
  }
  else if (key == 's') {
    b = b-10;
  }
  else if (key == 'x') {
    b = 50;
  }
  
  else if (key == 'e') {
    re = re+15;
  }
  else if (key == 'd') {
    re = re-15;
  }
  else if (key == 'c') {
    re = 255;
  }
  
  else if (key == 'r') {
    gr = gr+15;
  }
  else if (key == 'f') {
    gr = gr-15;
  }
  else if (key == 'v') {
    gr = 255;
  }
  
  else if (key == 't') {
    bl = bl+15;
  }
  else if (key == 'g') {
    bl = bl-15;
  }
  else if (key == 'b') {
    bl = 255;
  }
  
  else if (key == 'y') {
    x = x+5;
  }
  else if (key == 'h') {
    x = x-5;
    if(x<=0){
      x = 1;
    }
  }
  else if (key == 'n') {
    x = 30;
  }  
}


