
PImage I;int i,x,y,w=288,h=441;

void setup(){size(w=288,h=441);I=loadImage("ggg.jpeg");}
void draw(){for(i=10;i++<w*h;)set((x=i%w)^mouseX,(y=i/w)^mouseY,I.get(x,y));}


