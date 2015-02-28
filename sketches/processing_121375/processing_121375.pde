
float[] x = new float[100000];
float[] y = new float[100000];
float[] vx = new float[100000];
float[] vy = new float[100000];
//float speed = 1;
float[] diameter = new float[100000];
int count =  0;
int[] n =new int[100000];
float R[] = new float[100000];
float G[] = new float[100000];
float B[] = new float[100000];

float X[] = new float[100000];
float VX[] = new float[100000];
float mou[] = new float[100000];

void setup(){
  noStroke();
  size(550,550);
  
  rectMode(CENTER);
}

void draw(){
  background(200);
   smooth();
  
    if (mousePressed) {
    count =  count + 1;
    x[count-1] = mouseX;
    y[count-1] = mouseY;
    vx[count-1] = abs(mouseX-pmouseX)/3*random(-1,1);
    vy[count-1] = abs(mouseY-pmouseY)/3*random(-1,1);
    mou[count-1] = abs(mouseX-pmouseX)/3+abs(mouseY-pmouseY)/3  ;    
       VX[count-1] = mou[count-1];
       R[count-1] = random(0);
       G[count-1] = random(0);
       B[count-1] = random(0);
       diameter[count-1] = 10;
  }
  
  for(int i=0; i<count; i++){
     if(VX[i]<0.1){
      
        vx[i]=int((mouseX + x[i] ) );
        vy[i]=int((mouseY + y[i] ) );
    }
      vx[i] *= 0.995;
      vy[i] *= 0.995;
    x[i] = x[i] + vx[i]  ;
    y[i] = y[i] + vy[i]  ;
    
    if(VX[i]>0.1){
    if(y[i] > height){
      vy[i] = vy[i] * -1;
      y[i] = height;
    }
    
    if(y[i] < 0){
      vy[i] = vy[i] * -1;
      y[i] = 0; 
    }
    
    if(x[i] > width){
      vx[i] = vx[i] * -1;
      x[i] = width;
    }
    
    if(x[i] < 0){
      vx[i] = vx[i] * -1;
      x[i] = 0; 
    }
     VX[i] *= 0.995;
     X[i] = X[i] + VX[i];
     for(int j=0; j<count; j++){
     if((x[i]-x[j])*(x[i]-x[j])+(y[i]-y[j])*(y[i]-y[j])<=50*(diameter[i]/2+ diameter[j]/2)*(diameter[i]/2+ diameter[j]/2)){
      line(x[i],y[i],x[j],y[j]);
     }
     }
      pushMatrix();
      translate(x[i],y[i]);
      
      rotate(X[i]);
      //noFill();
      //strokeWeight(1);
      stroke(R[i],G[i],B[i],20);
      fill(255,0,0);
      //noStroke();
      ellipse(VX[i]*1,VX[i]*1,1.5,1.5);
       //ellipse(VX[i]*-1,VX[i]*1,2,2);
        //ellipse(VX[i]*1,VX[i]*-1,2,2);
         ellipse(VX[i]*-1,VX[i]*-1,1.5,1.5);
       popMatrix();
     
      }
    }
 
if(count>1000000){
  count = 0;
}
println(count);

}







