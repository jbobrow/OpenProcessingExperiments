



size(1000, 1000);
float x = 0;
colorMode(HSB,10);


while (x<width) {


  float y = 0;

  while (y<height) {
   float z = sin(x/30+y/23)*sin(x/21-y/14)*sin(x/2+y/3);
    float hu = map(z, -1,1,0,10);
   
    stroke(hu,9,9);
    point(x, y);
    y=y+1;
  }

  x=x+1;
}



