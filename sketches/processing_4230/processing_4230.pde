
float p,q,a,d;int W=99,w;void draw(){smooth();a+=0.01;w=(W)/(int)random(1,W);p*=sin(a);p+=a;for(int i=1;i<p;i++){fill(255,W);d=dist(0,9,p,p);ellipse(w,d+p,p*i,d/i);ellipse(W-w,d,p*i,d/i);}filter(11);}                     
 


