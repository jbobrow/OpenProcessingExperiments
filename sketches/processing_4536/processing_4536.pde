
int s=unhex("E4791"),r=s,n,i,j,t;void draw(){set(0,1,get(0,0,32,600));for(i=0;i<32;i++){t=0;if((s>>i)%2!=0)point(i,1);for(j=0;j<5;j++){t*=2;if((s>>(i+j+30)%32)%2!=0)t++;}n*=2;if((r>>t)%2!=0)n++;}s=n;}



