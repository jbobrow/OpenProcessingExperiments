
int u=7,v=9,s=73,i,x,y,d=513;void setup(){textFont(createFont("",v,false));}void draw(){fill(255,12);rect(-1,-1,d,d);fill(0);for(i=0;i<4088;i++)text(char((mouseX+get(x=i%s,y=i/s))&255),x*u,(1+y)*v);}
