
size(250, 250);
background(165, 182, 56);
noStroke();
smooth();
fill(129, 80, 23);
  rectMode(CORNERS);
  rect(250, 0, 145, 100);
  rectMode(CORNERS);
  rect(0, 0, 105, 100);
fill(129, 80, 23);
  triangle(125, 150, 0, 150, 0, 250);
  triangle(125, 150, 250, 150, 250, 250);
fill(244, 243, 173);//orange
  triangle(0, 0, 0, 150, 125, 150);
  //big left triangle
  triangle(250, 0, 250, 150, 125, 150);
  //big right triangle
  triangle(125, 150, 105, 100, 145, 100);
  //centre triangle
  triangle(0, 250, 50, 250, 50, 210);
  triangle(250, 250, 200, 250, 200, 210);
fill(171, 214, 155);//light blue
  rectMode(CORNERS);
  rect(125+40, 100, 250, 20);
  rectMode(CORNERS);
  rect(125-40, 100, 0, 20);
fill(129, 80, 23);//dark brown
  rectMode(CORNERS);
  rect(125+60, 100, 250, 40);
  rectMode(CORNERS);
  rect(125-60, 100, 0, 40);
fill(171, 214, 155);//light blue
  triangle(125-20, 150, 0, 150, 0, 250-15);
  triangle(125+20, 150, 250, 150, 250, 250-15);
fill(129, 80, 23);//dark brown
  rect(125-40, 175, 125+40, 250);
fill(171, 214, 155);//light blue
  rect(125-20, 195, 125+20, 250);

