
float p;
void setup(){size(400,420);}
void draw(){background(255);p+=.01;for(int i=0;i<3;i++){for(float x=1;x<width;x++){stroke(200-i*50);line(x,height,x,height-noise(10*i+p+x/width)*(height-10*i));}}}
