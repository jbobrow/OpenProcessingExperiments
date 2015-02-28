
 float[] t = new float[700/2];
float[] b = new float[700/2];
float []l = new float [400/2];
float[] r = new float [400/2];

void setup(){
  size(700,400);
  background (255);
}

void draw(){

 
  for (int i  = 0; i< width/2 ;i =  i+2){
   line(t[i],0,pmouseX,pmouseY); 
  }
    for (int j  = 0; j< width/2 ;j =  j+2){
   line(b[j],height,pmouseX,pmouseY); 
  }
   for (int k  = 0; k< height/2 ;k =  k+2){
   line(0,l[k],pmouseX,pmouseY); 
  }
  
   for (int k  = 0; k< height/2 ;k =  k+2){
   line(width,r[k],pmouseX,pmouseY); 
  }
}

void mouseMoved(){
 stroke(random(255)); 
}

void mousePressed(){
 background(0); 
}

