
void setup(){size(256,256);}void draw(){for(int i=0;i<width;i++)for(int j=0;j<height;j++){stroke(255,0,0);point(random(i),random(j));stroke(0,0,255 );point(width-random(i),height-random(j));}}

