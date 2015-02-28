
float x,X,a,b;int W=200,w;void draw(){rectMode(CENTER);a=(a+0.9)%W;b=(b+a)%W;x*=cos(b);x+=a;w=W/(int)random(1,W);for(int i=0;i<w;i+=2){X=x+i;stroke(X,X);fill(a,b,X,X);rect(X,X,w,w);rect(W-X,X,w,w);}}

