
float p,a,r,w;int W=99;void draw(){r=random(1,W);a+=1;p=(sin(a)*(W+r));stroke(r);w=W/(int)r;fill(r,r,r*W,W*2);for(int i=0;i<W;i++){for(int j=1;j<p;j+=2){rect(p*i,p+j,w,w);}if(p>W){p=0;filter(11);}}}                  


