
int i=1,s=500;void setup(){size(s,s);}void draw(){for(loadPixels();i++%(s*32)>0;)pixels[i*7%(s*s)]=-i*(i>>19)/s<<i/s/s;updatePixels();}
