
float p;void setup(){size(240,120);}void draw(){background(255);p+=.01;for(int i=0;i<4;i++){for(float x=0;x<width;x++){stroke(200-i*50);line(x,height,x,height-noise(10*i+p+x/width)*(height-20*i));}}}

