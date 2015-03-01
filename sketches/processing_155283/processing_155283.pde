
int j;void setup(){size(900,900);}void draw(){PImage i=get();filter(INVERT);rotate(sin(j*.01));image(i,j++%450,-(j%133)/10);}//#p5
