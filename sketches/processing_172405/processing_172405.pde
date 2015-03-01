
//pink sine ellipses

size(600,120);
background (210,255,106);
stroke (#CF71FF);
fill(250,83,241,30);
float angle1 = 5.0;
for (int x = 0; x <= width; x +=5) {
  float y= 60+ (sin(angle1)*30.0); ellipse(x,y,x*.4,y*.4);
angle1 += PI/20.0;
}


//orange cosine ellipses
stroke (#F7B95A);
fill(232,115,9,30);
float angle2 = 5.0;
for (int x = 0; x <= width; x +=5) {
  float y= 60+ (cos(angle2)*30.0); ellipse(x,y,x*.4,y*.4);
angle2 += PI/20.0;
}




