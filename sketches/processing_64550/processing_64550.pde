



size(1000, 1000);
float x = 0;



while (x<width) {


  float y = 0;

  while (y<height) {
   float z = sin(x/y*200);
    float col = map(z, -1,1,0,255);
    stroke(col);
    point(x, y);
    y=y+1;
  }

  x=x+1;
}






