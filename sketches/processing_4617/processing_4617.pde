
float w=500,i,j,x,y,r,t;void draw(){fill(255,20);rect(0,0,w,w);fill(0);for(i=0;i<w;i+=18)for(j=0;j<w;j+=18,r=2E3/(dist(x=mouseX,y=mouseY,i,j)+1E2))ellipse(i+r*cos(t=atan2(j-y,i-x)),j+r*sin(t),9,9);}

