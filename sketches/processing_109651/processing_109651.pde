
/*
SM2705_groupA
Assignment 1
Choi Wing Chu Belinda
sid 53084917
*/

//assign random color for bgc(background color)
color bgc= color(random(0, 255), random(0, 225), random(0, 225));

void setup()  {
  size(600, 600);
  smooth();
  strokeWeight(2);
}

//make diagonals radiation centred at the input pt.
void diag_rad(float x, float y)  {
  int mar= 50;    //mar(margin)
  for (int t= 0; t< width; t= t+mar)  {     //t(top)
    line(t, 0, x, y);
  }
  for (int r= 0; r< height; r= r+mar)  {    //r(right)
    line(width, r, x, y);
  }
  for (int b= 0; b< width; b= b+mar)  {     //b(bottom)
    line(b, height, x, y);
  }
  for (int l= 0; l< height; l= l+mar)  {    //l(left)
    line(0, l, x, y);
  }
  line(width, height, x, y);
}

void draw()  {
  background(bgc);
  //change bgc if mouse is pressed
  if (mousePressed)  {
    bgc= color(random(0, 255), random(0, 225), random(0, 225));
  }
  //change stc(stroke color) into black if bgc is white
  if (bgc== color(255, 255, 255))  {
    color stc= color(0, 0, 0);
  }
  //assign stc into white
  color stc= color(255, 255, 255);
  stroke(stc);
  float mx= mouseX;
  float my= mouseY;
  int dia= 200;  //dia(diameter)
  diag_rad(mx, my);
  ellipse(mx, my, dia, dia);
}

//end of codes.

/*
references:
- http://processing.org/reference/
- http://processing.org/examples/
- http://processing.org/tutorials/drawing/
*/
