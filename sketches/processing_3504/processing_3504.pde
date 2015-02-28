

int x,y,m=5,n=3,c=400;void setup(){size(400,400);background(0);}void draw(){smooth();stroke(x-y-c);line(x,y,c-y,x);x+=m;y+=n;if(x<0||x>c)m=-m;if(y<0||y>c)n=-n;}



