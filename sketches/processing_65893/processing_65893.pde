
PFont f;
int n=150;
int q=20;
float [] puntoX=new float[n];
float [] puntoY=new float[n];

void setup(){
size(500,500,JAVA2D);
smooth();
f = createFont("AppleCasual-16",16,true);
background(255);
for(int i=0;i<n;i++){
  float r=min(width,height)/2.5;
puntoX[i]=r*cos(2*PI*i/n)+noise(q);
puntoY[i]=r*sin(2*PI*i/n)+noise(q);
}
}

void draw(){
  println(frameCount);
background(255);
textFont(f);
  fill(0,0,200);
  text("Envolvente para k="+int(frameCount/60+1),width/3-10,25);
envolvente(int(frameCount/60)+1);
}

void envolvente(int k){
for(int i=0;i<n;i++){
  pushMatrix();
  translate(width/2,height/2);
  rotate(int(frameCount/20));
  stroke(0,0,255,150);
  strokeWeight(2);
  line(puntoX[i],puntoY[i],puntoX[(k*(i+1))%n],puntoY[(k*(i+1))%n]);
  popMatrix();
}
}



