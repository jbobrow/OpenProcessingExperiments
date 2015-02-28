
int x,y,i;void setup(){size(200,200,P2D);}void draw(){for(y=200;--y>=0;)for(x=200;--x>=0;){set(x,y,get(int(x+noise(x/10,y/20,i*.05+9)*5-2),int(y+noise(x/10,y/20,i*.05)*5-2))-1);}i++;filter(BLUR);}

