
void setup(){size(500,500);}void draw(){int m=499,x=int(random(m)),k=x*x,y=k%m,X=x,Y=y;while(get(x,y)==get(m,m)&&k-->0){X=x;Y=y;x=(x+m+int(random(3))-1)%m;y=(y+m+int(random(3))-1)%m;}point(X,Y);}

