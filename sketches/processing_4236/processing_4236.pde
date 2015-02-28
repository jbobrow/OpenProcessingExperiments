
int g=250,f=110,h=600,d=0,m=d;void setup(){size(h,h);textFont(createFont("",f));}void draw(){};void keyReleased(){char l=key;fill(g,60);rect(0,0,h,h);if(l<f)l+=13;else l-=13;if(d>h)d=0;d+=f/2;m=(int)random(-f,g);fill(0);text(key,g-m,d);text(l,g+m,d);}	  

