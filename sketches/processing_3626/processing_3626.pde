
float x,v,n,m,w,W=100;void draw(){n=noise(9);x+=cos(n);m=millis();w=W/random(1,W);fill(m,W);for(int i=0;i<W;i++){for(int j=0;j<x;j++){rect((x*i)+w/2,(x*j)+w,w,w);}if(x>W||x<0){x=0;filter(11);v++;}}}

