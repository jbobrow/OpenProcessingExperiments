
float l;int d=300;void setup(){size(d,d);smooth();fill(0,50);}void draw(){rect(0,0,d,d);translate(150,150);for(int r=0;r++<360;){stroke(255,9);rotate(r);line(0,0,d*noise(r,l+=.1)/2,0);}}


