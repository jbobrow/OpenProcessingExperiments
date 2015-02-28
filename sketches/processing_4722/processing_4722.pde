
float w=500,m=150,i,j,x,y,r,t;void draw(){smooth();noStroke();background(0);for(i=m;i<w-m;i+=2)for(j=m;j<w-m;j+=2){r=2E3/(dist(x=mouseX,y=mouseY,i,j)+1E2);rect(i+r*cos(t=atan2(j-y,i-x)),j+r*sin(t),2,2);}}

