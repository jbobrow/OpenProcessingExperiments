
float[] x=new float[100];
   float[] y=new float[100];
    float[] z=new float[100];


void setup(){
  size(500,500,P3D);
background(0);
}
void draw(){
 

  

    background(0);
    translate(width/2,height/2);
    rotateY(frameCount/100.0);
    strokeWeight(1);
    noFill();
    stroke(255);
    box(500);
    for(int i= 0; i<100; i++){
     
    point(x[i],y[i],z[i]);
    
  x[i]++;
  y[i]++;
  z[i]++;
  
  
}
}
