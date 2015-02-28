
int n=2,r=10,w=320,m=int(w*.2),f=6/*settings: n=steps r=border w=width,height m=mouseradius f=force*/,X,Y;PImage t;p[][]p=new p[w+1][w+1];PVector T=new PVector(0,0);
void setup(){size(w,w,P3D);colorMode(HSB,2);noStroke();t=loadImage("0.png");t.resize(w-r*n*2,w-r*n*2);for(int x=r;x<w/n-r;x++){for(int y=r;y<w/n-r;y++){p[x][y]=new p(x*n,y*n);}}}
void draw(){fill(0,0,0,.3);rect(0,0,w,w);for(int x=r;x<w/n-r-1;x++){for(int y=r;y<w/n-r-1;y++){p[x+1][y+1].u();float k=1+sin((abs(p[x][y].o.z)*abs(p[x][y].d.z)));tint(k,k,255);T.x=(x-r)*n;T.y=(y-r)*n;
if(x!=r||y!=r){beginShape();texture(t);vertex(p[x][y].d.x,p[x][y].d.y,T.x-1,T.y-1);vertex(p[x+1][y].d.x,p[x+1][y].d.y,T.x,T.y-1);vertex(p[x+1][y+1].d.x,p[x+1][y+1].d.y,T.x,T.y);vertex(p[x][y+1].d.x,p[x][y+1].d.y,T.x-1,T.y);endShape();}}}}
class p{PVector o=new PVector(0,0,0);PVector d=new PVector(0,0,0);p(int tx,int ty){o.x=tx;o.y=ty;d.x=tx;d.y=ty;}void u(){o.z+=0.01*(o.x-d.x);d.z+=0.01*(o.y-d.y);
if(mousePressed){X=mouseX;Y=mouseY;float D=0.001*f*(m/dist(X,Y,d.x,d.y));if(mouseButton==LEFT){o.z+=D*(X-d.x);d.z+=D*(Y-d.y);}else{o.z+=-D*(X-d.x);d.z+=-D*(Y-d.y);}}o.z*=.95;d.z*=.95;d.x+=o.z;d.y+=d.z;}}

