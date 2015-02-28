
int t,x,X,Y,c,wa=255,m;
int hf=255,wf=hf,iff;

int h = 255;
int w = 255;
int i=0;
float df=0,ef=0,rf=.01,zf,nf;
void setup(){
 size(255,255,P3D); 
 loadPixels();
 
}

void draw(){
background(0);
df-=(mouseY-hf/2f)/hf/2f;//137
ef+=(mouseX-wf/2f)/wf/2f;//120
for (i=0;i<w*w;i++){
zf=i/wf;// use  '/' for horizontal or '%' for vertical 
X=int(i%wf/zf*hf);
Y = int(hf/2+noise(i%wf*rf+ef,i*rf/wf+df)*99/zf*h);
color c=Y+(get(X,Y)>>8&i);//w

pixels[i]=color(c-mouseY,c-mouseX,c*iff); 


}



} 


