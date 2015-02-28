
int num=300;
float[] X=new float[num];
float[] Y=new float[num];
float[] r=new float[num];
float[] g=new float[num];
float[] b=new float[num];



void setup(){
  size(400,400);
  background(255);
  noStroke();
    for(int p=0;p<50;p++){
      for(int q=0;q<50;q++){
      fill(10+p*15,q*15,20);
      rect(q*20,p*20,20,20);
    }
  }
   
}
 


void draw(){

  setCir();
  drawCir(3);
 
 
  
}

void setCir(){
  for(int i=0;i<num;i++){
    X[i]=random(mouseX-25,mouseX+25);
    Y[i]=random(mouseY-25,mouseY+25);
    r[i]=mouseY;
    g[i]=mouseX;
    b[i]=random(255);
    }
}

void drawCir(float dia){
for(int i=0;i<num;i++){
  fill(r[i],g[i],b[i]);
  if (frameCount%10==3&&mousePressed==true){
  ellipse(X[i],Y[i],dia,dia);
   }
  }
}

