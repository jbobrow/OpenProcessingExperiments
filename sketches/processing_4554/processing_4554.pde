
int f,i,j,c=255,s=99;void setup(){size(s*5,s*5,P3D);noStroke();}void draw(){f=f%c+1;for(i=0;i<s;i++){for(j=0;j<s;j++){fill((f+j*5-i^f)%c,(i*f-i)%c,(f+j*2-i+f)%c);rect(j*5,i*5,random(9),random(9));}}}

