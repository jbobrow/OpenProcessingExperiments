
float j; void setup(){size(320,240,P3D);}void g(int y){pixels[y]=color(random(j+100));}void keyPressed(){j=random(155);}void draw(){loadPixels();for (int i=76799;i>0;i=i-1){g(i);} updatePixels();}//:*


