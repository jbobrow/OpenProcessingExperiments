
void setup ()
{
  size (700, 700);
/*  frameRate (30); */
}

/* int grad = 1; */

void draw ()
{
  background (255);
  noFill ();
  stroke (139, 149, 141);

  rect (71, 71, 558, 558);

  line (124, 350, 576, 350);
  ellipse (214, 350, 28, 28);
/*  ellipse (428, 350, 105, 105);*/
  ellipse (428, 350, 53, 53);
  ellipse (480.5, 350, 53, 53); 

  line (124, 175, 576, 175);
/*  ellipse (486, 175, 28, 28); */
  ellipse (272, 175, 105, 105);
  ellipse (272, 175, 53, 53);
  ellipse (219.5, 175, 53, 53);
/*  ellipse (325.5, 175, 53, 53); */
  
  
  
  line (124, 525, 576, 525);
  ellipse (486, 525, 28, 28);
  ellipse (272, 525, 105, 105);
/*  ellipse (272, 525, 53, 53); */
/*  ellipse (219.5, 525, 53, 53); */
  ellipse (325.5, 525, 53, 53);
  


/*
  line (237, 175, 463, 175);
  
  line (237, 525, 463, 525);
  
  translate (width / 2, height / 2);
  rotate(radians(grad));
  grad++;
  println (grad + "°");
    if (grad >360) {grad = 0;}
  rectMode (CENTER);
  rect (0, 0, 558, 558); */
  

}

void keyPressed ()
{
  saveFrame ("Export/geometrydaily.png");
}


