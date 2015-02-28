
int num=20;
float[]X=new float[num];
float[]Y=new float[num];
float[]AnX=new float[num];
float[]AnY=new float[num];
float[]R=new float[num];
float[]G=new float[num];
float[]B=new float[num];
  
void setup(){
  size(800,600,P3D);
   for(int i=0; i<num; i++){
     X[i]=random(200);
     Y[i]=random(200);
     AnX[i]=random(360);
     AnY[i]=random(360);
     R[i]=random(255);
     G[i]=random(255);
     B[i]=random(255);
   }
}
  
void draw(){
  background(255);
  lights();
  translate(width/2,height/2);
   for(int i=0; i<num; i++){
     AnX[i]+=1;
     AnY[i]+=1;
     pushMatrix();
     rotateX(radians(AnX[i]));
     rotateY(radians(AnY[i]));
     fill(R[i],G[i],B[i]);
     noStroke();
     translate(X[i],Y[i]);
     sphere(50);
     popMatrix();
   }
}
  
void mouseClicked(){
   for(int i=0; i<num; i++){
     X[i]=random(200);
     Y[i]=random(200);
     AnX[i]=random(360);
     AnY[i]=random(360);
     R[i]=random(255);
     G[i]=random(255);
     B[i]=random(255);
   }
}


