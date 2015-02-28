
PImage i;int w=720,h=500,sx=w,x,y;void setup(){i=loadImage("a.jpg");}void draw(){if(sx-->0)for(y=0;y++<h;)for(x=0;(x+=sx)<w;){stroke(i.get(x,y));line(x,y,x+sx,y);}}

