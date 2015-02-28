
int w,h;float s;void setup(){size(w=400,h=200);}void draw(){s=sin(TWO_PI*millis()/1000);
for(int y=0;y++<h;){for(int x=0;x++<w;){set(x,y,int(get(w-x,h-y)+s*color(noise((s*s)/(y+x)))));}}filter(11);}

