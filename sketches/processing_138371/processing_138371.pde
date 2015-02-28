
//Math 2 - Curves
//Exercise #2
/*2. Use the data from the curve y=x8 to drawing something unique.*/


  size (400, 400);


  for (int x= 0; x<400; x++) {
    float n = norm (x, 0.0, 400);
    float y = pow(n, 8);
    y *= 400;
    point (x, y);

    line(x, y, 0, 400);
    noFill();
    ellipse(x,y, 30,30);
    //ellipse(x/2,y/2,15,15);
  }



