
int n=2,r=10,w=256,m=int(w*.2),X,Y;  //settings: n=steps r=border w=width,height m=mouseradius X=mouseX Y=mouseY
PImage t;p[][]p=new p[w+1][w+1];
void setup(){size(w,w,P3D);colorMode(HSB);noStroke();
 t=loadImage("0.png");t.resize(w-r*n*2,w-r*n*2);
 for (int x=r;x< w/n-r;x++){for (int y=r;y< w/n-r;y++){p[x][y]=new p(x*n,y*n);}}}
void draw(){fill(0,0,0,20);rect(0,0,w,w);
for (int x=r;x< w/n-r-1;x++){for (int y=r;y< w/n-r-1;y++){p[x+1][y+1].u();
float k=128+sin((abs(p[x][y].v)*abs(p[x][y].V))/10)*128;
tint(k,k,255);
if(x>r&&y>r)q(p[x][y].c,p[x][y].C,p[x+1][y].c,p[x+1][y].C,p[x+1][y+1].c,p[x+1][y+1].C,p[x][y+1].c,p[x][y+1].C,(x-r)*n,(y-r)*n);}}}
void q(float a,float b,float c,float d,float e,float f,float g,float h,int u,int v){beginShape();texture(t);vertex(a,b,u-1,v-1);vertex(c,d,u,v-1);vertex(e,f,u,v);vertex(g,h,u-1,v);endShape();}
class p{float l;float L;float c;float C;float v;float V;p(int tx,int ty){l=tx;L=ty;c=tx;C=ty;}
void u(){v+=0.01*(l-c);V+=0.01*(L-C);if (mousePressed){X=mouseX;Y=mouseY;float d=0.006*(m/dist(X,Y,c,C));if (mouseButton==LEFT){v+=d*(X-c); V+=d*(Y-C);}else{v+=-d*(X-c);V+=-d*(Y-C);}}v*=.95;V*=.95;c+=v;C+=V;}}

