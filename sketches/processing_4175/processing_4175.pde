
int i,w=400,u=999;float t=1;float[][]z=new float[u][4];float[]j;
void setup() { size(400,400); }
void draw(){background(0);stroke(255);t+=0.004;for(i=0;i<u;i++){j=z[i];n(0);n(1);
point(j[0]%=w,j[1]%=w);point(w-j[1],j[0]);
}}void n(int a){j[a+2]+=noise(j[0]/w+i/w,j[1]/w+i/w,a*t+i/t)-0.5;j[a]+=(j[a+2]*=0.8)+w;}

