
float w=500,i,j,x,y,r,t;void draw(){smooth();noStroke();fill(0,15);rect(0,0,w,w);fill(w);for(i=0;i<w;i+=20)for(j=0;j<w;j+=20){r=3E3/(dist(x=mouseX,y=mouseY,i,j)+1E2);ellipse(i+r*cos(t=atan2(j-y,i-x)),j+r*sin(t),2,2);}}

