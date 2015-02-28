
int t,i,w=255;
int x;
int a[]=new int[w*w];
float col;

void setup() {
  size(500,500);
  col=0;
}

void mouseDragged() {
  a[t]=mouseY;
  a[t+1]=mouseX-255;
}

void draw(){
background(w);
smooth();
stroke(189, 43, 166);
beginShape(20);
col=col+2;
for(x=0;x<t;x+=2){
  if(col<500){
  stroke(col/3,col/7,col/2);
  }
  if(col>500){
  col=0;
  }
  strokeWeight(2);
 vertex(w+cos((t-x)/255f)*a[x+1],a[x]);
}
if(a[t]>0){
t+=2;
}
endShape();

}
