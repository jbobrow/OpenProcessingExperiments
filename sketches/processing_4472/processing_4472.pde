
int q=99;int[]X=new int[q];void setup(){noStroke();for(int i=0;i<q;i++){X[i]=ceil(random(q));}}void draw(){background(q);for(int e=0;e<q;e++){int r=X[e];ellipse(r*2,e,r,r);X[e]=r-1;if(r<0)X[e]=q;}}


