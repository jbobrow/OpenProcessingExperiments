
int f,i,j,c=156,s=88;void setup(){size(s*5,s*5,P3D);noStroke();}void draw(){f=f%c+6;for(i=0;i<s;i++){for(j=0;j<s;j++){fill((f+j*4+i^f)%c,(i*f-i)%c,(f+j*3-i+f)%c);rect(j*5,i*5,random(8),random(9));}}}

