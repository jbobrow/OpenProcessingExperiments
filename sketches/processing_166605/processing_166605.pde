
//map(value, start1, stop1, start2, stop2)

float y = 0;
float mapx = 0;
float mapy = 0;


for (float x=-1; x <1; x=x+.01){
  y = 1-pow(x,4);
  mapx=map(x, -1, 1, 0, width);
  mapy=map(y, -1, 1, height, 0);

  point (mapx,mapy);
}


