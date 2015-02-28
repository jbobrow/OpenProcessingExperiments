
float p,a;int W=99,w,c=255;void draw(){smooth();a+=0.01;p*=sin(a);p+=a;w=W/(int)random(1,W);for(int i=1;i<p;i++){fill(c,c,W);rect(W/2,p*i,random(-w,w),w);ellipse(W/2,W/3,p/i,p/i);}filter(11);}                         
 


