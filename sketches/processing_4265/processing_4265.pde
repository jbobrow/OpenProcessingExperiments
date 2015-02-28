
float a=5;float b=10;float c=9;void setup(){size(600,600);background(0);}void draw(){stroke(99+c,b,b);fill(b,a,c,c);ellipse(b,b,c,c);filter(BLUR,0.6);if(c>25){c=9;}a+=0.5;b+=0.8;c+=0.05;}

