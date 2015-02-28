
int t,x,X,Y,c,w=255,m;
void setup(){size(w,w,P2D);}
void draw(){
for(x=0;++x<w*w;){
X=x%w;Y=x/w;
float n=noise(X/99f,Y/200f)*50,
c=(n*160-t*20+w*abs(sin(X+n)*sin(Y+n)));
set(X,Y,color(w,c,c));
}t++;}

