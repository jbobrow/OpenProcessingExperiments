
float x,y,N,t,S=30;void draw(){for(y=0;y<256;y+=3)for(x=y%3;x<256;x+=3){N=0;stroke(y,(n(S)+n(1)+S)*7,y,y);line(x,y,n(1)+x,n(1)+y);}t++;}float n(float a){return noise(a/S*x,(a*y+t)/S,t/S/a+N++)*60-S;}

