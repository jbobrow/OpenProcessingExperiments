
float w=500,m=150,i,j,x,y,r,t;void draw(){smooth();background(0);for(i=m;i<w-m;i+=6)for(j=m;j<w-m;j+=6){r=2E3/(dist(x=mouseX,y=mouseY,i,j)+1E2);ellipse(i+r*cos(t=atan2(j-y,i-x)),j+r*sin(t),6,6);}}

