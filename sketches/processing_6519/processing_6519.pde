

import peasy.*;
PeasyCam cam;



int p=70000;
float []radio=new float[p];
float []dis=new float [p];

float[] x= new float[p];
float[] y= new float[p];
float[] z= new float[p];

float[] speedX= new float[p];
float[] speedY= new float[p];
float[] distX= new float[p];
float[] distY= new float[p];


void setup(){
  size(600,600,P3D);
cam = new PeasyCam(this, 1000);
  cam.setMinimumDistance(width);
  cam.setMaximumDistance(height);  
  cam.lookAt(width/2, height/2, 1000);

  noFill();
  for(int i=0; i<p; i++){
    x[i]=random(width);
    y[i]=random(height);
    z[i]=random(height);

    speedX[i]=random(1.5);
    speedY[i]=random(1.5);


  }

}

void draw(){

  background(#761681);

  for(int i=0; i<p; i++){
    x[i]+=speedX[i];
    y[i]+=speedY[i];
    z[i]+=speedY[i];
    distX[i]=dist(x[i],y[i],mouseX,mouseY);


    if(x[i]<0 || x[i]>width){
      speedX[i]=speedX[i]*-1;
    }

    if(y[i]<0 || y[i]>height){
      speedY[i]=speedY[i]*-1;
    }
       if(z[i]<0 || z[i]>height){
      speedY[i]=speedY[i]*-1;
    }



    if(distX[i]<100){

      speedX[i]=speedX[i]*-1;
      x[i]-= ( radians(2*distX[i]));
         speedY[i]=speedY[i]*-1;
      y[i]-= ( radians(2*distX[i]));
    }

   


  }
  beginShape(POINTS);
  for(int i=0; i<p; i++){

strokeWeight(3);
    stroke(x[i],y[i],z[i],100);
    vertex(x[i],y[i],z[i]);

  }
  endShape();
  


}






