
int n=350;void setup(){size(n,n);background(255);}void draw(){point(mouseX,mouseY);loadPixels();for(int i=n*n-n-1;i>n;i--) pixels[i]=int((pixels[i-n]+pixels[i+1]+pixels[i-1])/3);updatePixels();}

