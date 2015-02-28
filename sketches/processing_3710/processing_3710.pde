
int x,y,i,c,n,w,r;void draw(){}void mouseClicked(){if(r<=n)n++;w=256/n;for(i=r=n*n;i-->0;){x=i%n*w;y=i/n*w;r-=c=noise(i,mouseX/w+mouseY/w*n)<.5==(get(x+3,y+3)&1)>0?1:0;fill(-c);rect(x,y,w,w);}}

