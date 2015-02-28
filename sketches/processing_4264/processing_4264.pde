
float n,a,b,C;int W=200;void draw(){smooth();a+=0.01;n=noise(a)*W/3;a=(a+n)%W;b=(b+a)%W+n*2;C+=cos(b);for(int i=0;i<n;i++){fill(W,W,n,n);ellipse(b,a,n/i,n/i);fill(C,b,W,n/2);ellipse(a,b,i,i);}}


