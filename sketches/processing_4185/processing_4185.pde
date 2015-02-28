
float p,q,a,m;int W=100,w;void draw(){rectMode(CENTER);a+=0.01;m=millis();w=W/(int)random(1,W);p+=noise(a,0.5);for(int i=1;i<p;i++){fill(m);q=p*i;rect(q,q,w,w);rect(W-q,q,w,w);}if(p>W)p=0;filter(13);}

