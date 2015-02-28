
int y,x,c;float q,s;void draw(){colorMode(3);c++;for(x=-1;x<512;q=64+64*sin(x++*.01))for(y=-1;y<256;s=64+64*sin(radians(y++*-.2))+q+(128*sin(radians((x+y+c*5)/2)))/2)set(x,y,color(s,255-s/2,255));}

