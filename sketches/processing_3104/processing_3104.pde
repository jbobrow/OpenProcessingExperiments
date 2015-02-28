
float[] x = new float[100];
float[] y = new float[100];
int a,k,m,r;


void setup(){
  smooth();
  noStroke();
  fill (0,200,0);
  size(300,300);
  for(int i=0;i<100;i++){
    x[i]=width/2;
    y[i]=height/2;
  }
}


void draw(){
  background(255);
  for(int i=1;i<100;i++){
    
    display(x[i],y[i],i);
  }
  
   emerge(x[m%100],y[m%100]);
   
}



void mousePressed(){
  m++;
  x[m%100]=mouseX;
  y[m%100]=mouseY;


}


void emerge(float X,float Y){

    k++;
    x[(m+k)%100]=x[m%100]+random(-10,10);
    y[(m+k)%100]=y[m%100]+random(-10,10);
  

}




void display(float X, float Y,int I){

  ellipse(X,Y,10,10);
}

