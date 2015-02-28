
PFont f=createFont("",9);int w=240,h=100;void setup(){size(w,h);background(255);textFont(f,42);smooth();}void draw(){image(get(1,0,w-1,h),0,-1,w-1,h+1.01);}void keyPressed(){fill(0);text(key,200,95);}

