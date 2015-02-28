
import ddf.minim.*;

 float[] x,y,vx,vy; 
 int[] Color;
 int num=200; 
 float angle,shapeholddist=5.5f , soundscale=50f;
 
  

 public void setup() { size(640,480,P2D); 
 setminim();  num=in.bufferSize();
 Color=new int[num]; x = new float[num]; y = new float[num]; vx = new float[num]; vy = new float[num];
 for(int  a = 0 ; a < num; a++) { x[a] = a*(float)(width)/num; y[a] = height/2;
Color[a]=color((int)random((int)x[a]*.4f,255),(int)x[a]*.4f,255-(int)x[a]*.4f,(int)random(200,255));
 angle = atan2(width/2-y[a], height/2-x[a]); vx[a] += cos(angle); vy[a] += sin(angle); } }
 float[] pegel=new float[num];
 public void draw() {fill(0,0,0,20);noStroke(); rect(0,0,width,height); 
  pegel=in.mix.toArray();
// float[] pegel=new float[num];

if(mousePressed) {
 int k = 1;
 if(mouseButton == LEFT) k *= 1;
 else if(mouseButton == RIGHT) k *= -1;
 for(int a = 0; a < num; a++) { angle = atan2(mouseY-y[a], mouseX-x[a]); vx[a] += k*cos(angle); vy[a] += k*sin(angle);}}


for(int a = 1; a < num; a++) {
	if(x[a] != x[a-1] || y[a] != y[a-1]){	float k = /*abs*/(pegel[a]);
angle = atan2(y[a-1]-y[a], x[a-1]-x[a]); vx[a] += k*cos(angle); vy[a] += k*sin(angle);}}



int step=2;

for(int a = 0; a < num; a+=step) {
	for(int b = num-1; b > 0; b-=step) {	
		float ka = /*abs*/(pegel[a])*.1f;
		float kb = /*abs*/(pegel[b])*.1f;
		angle = atan2(y[b]-y[a], x[b]-x[a]); vx[a] += ka*cos(angle); vy[a] += ka*sin(angle);
		angle = atan2(y[a]-y[b], x[b]-x[b]); vx[b] += kb*cos(angle); vy[b] += kb*sin(angle);

	}}

for(int a = 1; a < num; a++) {	if(x[a] != x[a-1] || y[a] != y[a-1]){	float dist=dist(x[a],y[a], x[a-1],y[a-1]);
if(dist>shapeholddist){ 
float	oldxa=x[a],	oldya=y[a];
	x[a]=(x[a]+x[a-1])*.5f;  y[a]=(y[a]+y[a-1])*.5f;

x[a-1]=(oldxa+x[a-1])*.5f;  y[a-1]=(oldya+y[a-1])*.5f; } 
else{	stroke(Color[a]); strokeWeight(pegel[a-1]+1); line(x[a],y[a]+pegel[a]*soundscale,x[a-1],(float) (y[a-1]+pegel[a-1]*soundscale));}
}	}
//for(int a = 1; a < num; a++) {	float k = abs(pegel[a])+.3f;angle = atan2(y[a-1]-y[a], x[a-1]-x[a]); vx[a] += k*cos(angle); vy[a] += k*sin(angle);}
//for(int a = 0; a < num-1; a++) {	float k = abs(pegel[a])+.3f;angle = atan2(y[a+1]-y[a], x[a+1]-x[a]); vx[a] += k*cos(angle); vy[a] += k*sin(angle);}
 

 
 loadPixels();
 
 for(int a = 0; a < num; a++) { x[a] += vx[a] *= .98f; y[a] += vy[a] *= .98f; 
  setAt(x[a], y[a], Color[a]); 
 setAt(x[a], y[a]+pegel[a]*soundscale, Color[a]); 
 setAt(x[a], y[a]-pegel[a]*soundscale, Color[a]); 
 setAt(x[a]-pegel[a]*soundscale, y[a], Color[a]); 
 setAt(x[a]+pegel[a]*soundscale, y[a], Color[a]); 
 
 setAt(x[a]-pegel[a]*soundscale, y[a]-pegel[a]*soundscale, Color[a]); 
 setAt(x[a]-pegel[a]*soundscale, y[a]+pegel[a]*soundscale, Color[a]); 
 setAt(x[a]+pegel[a]*soundscale, y[a]+pegel[a]*soundscale, Color[a]); 
 setAt(x[a]+pegel[a]*soundscale, y[a]-pegel[a]*soundscale, Color[a]); 
 }

// for(a = 0; a < num-1; a++) {stroke(cola[a]); strokeWeight(pegel[a+1]*scale); line(x[a],y[a]+pegel[a]*scale,x[a+1],(float) (y[a+1]+pegel[a+1]*scale));}

 fastBlur(pixels, 2, width, height);
 for(int a = 0; a < num; a++) {
	 setAt(x[a], y[a], Color[a]); 
 setAt(x[a], y[a]-pegel[a]*soundscale, Color[a]); 
 setAt(x[a]+pegel[a]*soundscale, y[a], Color[a]); 

 // BORDER-Bounce
 //if(x[a]<0){dx[a]*=-1;x[a]=0;}if(x[a]>width){dx[a]*=-1;x[a]=width;}
 //if(y[a]<0){dy[a]*=-1;y[a]=0;}if(y[a]>height){dy[a]*=-1;y[a]=height;}
 // BORDER-Jump
 if(x[a]<0){x[a]=width;} if(x[a]>width){x[a]=0;} 
 if(y[a]<0){y[a]=height;} if(y[a]>height){y[a]=0;}
 } 

 updatePixels();
//for(int a = 0; a < num-1; a++) {stroke(Color[a]); strokeWeight(pegel[a+1]*scale); line(x[a],y[a]+pegel[a]*scale,x[a+1],(float) (y[a+1]+pegel[a+1]*scale));}

 }
 
 public void setAt(int x, int y, int c) { if(x < 0 | x > width-1 | y < 0 | y > height-1) return; pixels[y*width+x] = c;}
 public void setAt(float x, float y, int c) {/*if(c>100)*/ setAt((int)(x), (int)(y), c); }
 
 
 
 




