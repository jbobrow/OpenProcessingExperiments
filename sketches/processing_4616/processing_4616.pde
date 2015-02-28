
float w=500,i,j,x,y,r,t;void draw(){noStroke();fill(0,9);rect(0,0,w,w);fill(w);for(i=0;i<w;i+=9)for(j=0;j<w;j+=9,r=9E3/(dist(x=mouseX,y=mouseY,i,j)+w))rect(i+r*cos(t=atan2(j-y,i-x)),j+r*sin(t),3,3);}

