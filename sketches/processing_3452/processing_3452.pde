
float x,y,N,d;void draw(){if(mousePressed){for(y=0;y<600;y++)for(x=0;x<600;x++){d=dist(x,y,mouseX,mouseY)/50;if(d<1){stroke((noise(x/60,y/60,0.1*N)*21-10)*255,pow(1-d,6)*99);point(x,y);}}N++;}}

