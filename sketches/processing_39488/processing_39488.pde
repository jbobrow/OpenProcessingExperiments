
int w=512,x,y,t;void draw(){t++;for(background(y=w);y-->0;)for(x=w;x-->0;)set(x,y,get(x,y)^~get(x^t,y^x));}

