
float a, b, c, d, e, f, q, t, k;
float z1, x1, y1;
float x, y, z;
float cosA1, cosB1, cosC1;
float angA, angB, angC;


void setup() {
  size (500, 500);
  background (250);
  smooth();
  stroke(0);
  a = 250;
  b = 158;
  c = width * 3/4;
  d = height * 3/4;
  e = width * 1/4;
  f = d;
}

void draw() {


  if (key== CODED)
  {
    if (keyCode == UP)
    {
      a = mouseX;
      b = mouseY;
    }
    else if (keyCode == RIGHT)
    {
      c = mouseX;
      d = mouseY;
    }
    else if (keyCode == LEFT)
    {
      e = mouseX;
      f = mouseY;
    }
  }
  background(240, 250, 18, 20);


  if (keyCode == UP) {
    fill (50, 20, 180);
    text ("angle A = " + angA, width/2, 10);
    text ("Length of X "  + x, width/2, height/20);
    text ("Length of Y "  + y, width/2, 40);
  }
  else if (keyCode == RIGHT) {
    fill (255, 0, 0);
    text ("angle C = " + angC, width*3/4, height/2);
    text ("Length of Z "  + z, width*3/4, height/2 +20);
    text ("length of Y "  + y, width*3/4, height/2 + 40);
  }
  else if (keyCode == LEFT) {
    fill (28, 157, 19);
    text ("angle B = " + angB, 10, height/2);
    text ("Length of X "  + x, 10, height/2 + 20);
    text ("Length of Z "  + z, 10, height/2 + 40);
  }
  else {
    //angle A
    fill(0);
    text ("angle A =" + angA, width/2, 10);
    text ("Length of X "  + x, width/2, height/20);
    text ("Length of Y "  + y, width/2, 40);
    //angle B
    text ("angle B = " + angB, 10, height/2);
    text ("Length of X "  + x, 10, height/2 + 20);
    text ("Length of Z "  + z, 10, height/2 + 40);
    //angle C
    text ("angle C = "+ angC, width*3/4, height/2);
    text ("Length of Z "  + z, width*3/4, height/2 +20);
    text ("length of Y "  + y, width*3/4, height/2 + 40); 
  }

  triangle(a, b, c, d, e, f);

  



  //line labels
  text ("X", (e+(a - 15))/2, ((f - 15) +b) /2);
  text ("Y", (c +(a + 15))/2, (d + b)/2);
  text ("Z", (e + c)/2,  (d + 15));

  z1 = z;
  y1 = y;
  x1 = x;

  z = sqrt ((c-e)*(c - e) + (d - f)*(d - f));
  x = sqrt ((a - e)*(a - e) + (b - f)*(b - f));
  y = sqrt ((c - a)*(c - a) + (d - b)*(d - b));
  
  angB = atan((d)*(d)/(c - e)*(c- e));
}
