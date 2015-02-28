
float X,Y,a,s,w,i,j;int S=100;void draw(){smooth();w=S/random(S);a+=cos(w);for(i=0;i<S;i+=w){for(j=0;j<S*4;j+=w*4){X=a+i;Y=a+j;stroke(X,Y);fill(j,j,0,Y);rect(X,Y,a,a);rect(S-X,Y,a,a);}}frameRate(2);}

