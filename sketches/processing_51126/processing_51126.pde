
size(500, 500);
smooth();
noFill();


stroke(230);
strokeWeight(1);
for (int i=-100;i<height;i+=20) {
  for (int k=-200;k<width/2;k+=10) {
    if (k%3==0)
    {
      arc(k, i, k, k, radians(30), radians(120));
    }
    else
    {
      arc(k+250, i, k, k, radians(30), radians(120));
    }
  }
}

stroke(255);
strokeWeight(1);
for (int i=-100;i<height;i+=10) {
  for (int k=-200;k<width/4;k+=10) {
    if (k%3==0)
    {
      arc(k, i, k, k, radians(30), radians(120));
    }
    else
    {
      arc(k+250, i, k, k, radians(30), radians(120));
    }
  }
}



