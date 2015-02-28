
int n=350;void setup(){size(n,n);background(255);}void draw(){strokeWeight(random(5));point(random(n), random(n)+1);loadPixels();for(int i=n*n-1;i!=n;i--)pixels[i]=pixels[i-n]+i*2;updatePixels();}

