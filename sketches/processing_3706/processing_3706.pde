
PImage i;int c=0;void setup(){ size(500,500);smooth();}void draw(){i=get();tint(250);image(i,1,2,496,495);if(c%99>9&&c%99<40)line(400,0,400,500);line(496,99,495,300);if(c>40)rect(99,400,150,9);c++;}

