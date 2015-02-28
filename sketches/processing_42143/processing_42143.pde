
PImage I;int i,x,y,w=900,h=450;void setup(){size(w,h);I=loadImage("m.jpg");} 
void draw(){for(i=0;i++<w*h;)set((x=i%w)^mouseX,(y=i/w)^mouseY,I.get(x,y));}


