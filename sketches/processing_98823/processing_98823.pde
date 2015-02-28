
int nelipses=300;
 
int nquadrats=15;
int mida=40;

//fons estàtic
float[] px = new float [nelipses];
float[] py = new float [nelipses];
float[] vx = new float [nelipses];
float[] vy = new float [nelipses];
float[] R = new float [nelipses];
float[] G = new float [nelipses];
float[] B = new float [nelipses];
 
//figures moviment
float[] px1 = new float [nquadrats];
float[] py1 = new float [nquadrats];
float[] vx1 = new float [nquadrats];
float[] vy1 = new float [nquadrats];
 
 
void setup(){
  size(400,400);
  rectMode(CENTER);
  background(255);
   
  //fons estatic
  for (int i=0; i<nelipses; i++){
    px[i]=random(width);
    py[i]=random(height);
    vx[i]=random(1,4);
    vy[i]=random(1,4);
    R[i]=random(80,255);
    G[i]=random(50,255);
    B[i]=random(50,255);
     
  }
   
  //figures moviment
    for (int t=0; t<nquadrats; t++){
    px1[t]=random(width);
    py1[t]=random(height);
    vx1[t]=random(1,5);
    vy1[t]=random(1,5);
     
  }
   
   
}
 
 
void draw(){
   
  dibuixa_fons();
  
  for (int t=0 ; t<nquadrats; t++){
     posiciona_element(px1[t],py1[t]);
     actualitza_posicio(t); 
   }
   
}
 
 
void mousePressed(){
  for (int t=0; t<nquadrats; t++){
    px1[t]=mouseX;
    py1[t]=mouseY;
  }   
}


void dibuixa_fons(){
  //fons estàtic
  for (int i=0 ; i<nelipses; i++){
   
    if ((px[i]<0) || (px[i]>width)){
      vx[i]=-vx[i];
    }
    if ((py[i]<0) || (py[i]>height)){
      vy[i]=-vy[i];
    }  
    noStroke();
    fill(0,G[i],B[i]); 
    ellipse(px[i],py[i],50,50);   
  }  
}




void posiciona_element(float px1,float py1){
  fill(255);
  rect(px1,py1,mida,mida);
 
}



void actualitza_posicio (int t){
   
    px1[t]+=vx1[t];
    py1[t]+=vy1[t];
     
   if (((px1[t]-mida/2)<0) || ((px1[t]+mida/2)>width)){
     vx1[t]=-vx1[t];
   }
   if (((py1[t]-mida/2)<0) || ((py1[t]+mida/2)>height)){
     vy1[t]=-vy1[t];
   }
 
}



