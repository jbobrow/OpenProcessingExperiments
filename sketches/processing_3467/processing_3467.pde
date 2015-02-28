
float g,x=37,y=200;int w=500;void setup(){size(500,500);smooth();stroke(9,50);}void draw(){rect(0,0,w,w);translate(w/2,w/2);g=map(mouseY,0,w,1,30);for(int i=0;i<=100;i++){rotate(g);line(x,y,x,-y);}}

