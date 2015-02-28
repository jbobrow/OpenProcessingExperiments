

  size(200,200);
  smooth();
  noFill();
  translate (width/2, height/2);
  for (int i=0;i<360;i+=30){
    rotate(radians(30));
    ellipse(0,0,30,50);
  }

