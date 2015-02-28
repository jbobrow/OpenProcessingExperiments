
float p,r,m;int W=99,w;void setup(){size (W,W);}void draw(){r=random(1,W);m=millis();w=W/(int)r;p+=tan(r);fill(0,m,w,W);for(int i=0;i<p;i++){rect((p*i)+r,(p*i)+w,w,w);}if(p>W||p<0){p=0;filter(11);}}

