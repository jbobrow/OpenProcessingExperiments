
float p,r,m;int W=99,w;void setup(){size(W,W);}void draw(){r=random(1,W);stroke(r);m=millis();w=W/(int)r;p+=tan(r);fill(m,w,0,W);for(int i=0;i<W;i++){rect(p*i,p+i,w,w);if(p>W||p<0){p=0;filter(11);}}}

