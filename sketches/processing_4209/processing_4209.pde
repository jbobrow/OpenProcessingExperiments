
int i,d,x,y,n=10,m=51,k;void draw(){smooth();k=key%3+1;if(mousePressed)rect(-1,-1,501,501);for(i=0;i<m*m;i++,d=(int)dist(mouseX,mouseY,x=i%m*n,y=i/m*n)){if(d<30)ellipse(x,y,d/k,d/k);else point(x,y);}}

