
float a,b,c,m,r,M;int W=99,C=255;void draw(){r=random(C);m=millis();M=m%C;a=(a+3)%W;b=(b+5)%W;c=r%W;for(int i=0;i<c;i++){fill(M,M,r,M);rect(a*i,b*i,c,r);fill(r,M,M,r);rect(W-r,c*i,b,a);filter(15,4);}}

