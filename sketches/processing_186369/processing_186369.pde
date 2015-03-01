
size(600, 600);
colorMode(HSB);


for (int i=0; i<width; i = i+20)
{ 

  //println (i);

  //primera elipse ellipse (i,150,10,10);
  noStroke();
  ellipse (width/2, height/2, width- i, width- i);
  // segunda elipse ellipse (i, 300, random(100), random(300));
  fill ( i/3, 200, 200);
}

