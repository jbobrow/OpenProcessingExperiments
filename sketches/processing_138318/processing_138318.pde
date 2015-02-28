
size (500, 500);
background(0);
for (int x= 0; x < 500; x++) {
  for (float j = 1 ; j <50; j++) {
    float n = norm(x, 0.0, 500.0); 
    noFill();
    float y4 = 1-pow (1-n, 2*j); //bottom right
    y4 *= 500;
    stroke (164, 86, 145, 45);
    ellipse (x, y4, 5, 5);
    line (x, y4, 0, height);
    float y3 = 1-pow (n,2*j); //bottom right
    y3 *= 500;
    ellipse (x, y3, 5, 5);
    line (x, y3, width, height);
    float y2 = pow (n, 2*j);//top right
    y2 *= 500;
    ellipse (x, y2, 5, 5);
    line (x, y2, width, 0);
    float y = pow (1-n, 2*j); //begin
    y *= 500;
    ellipse (x, y, 5, 5);
    line (x, y, 0, 0);
  }
}



