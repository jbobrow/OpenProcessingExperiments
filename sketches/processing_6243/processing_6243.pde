

int p=4000;
float []radio=new float[p];
float []dis=new float [p];

float[] x= new float[p];
float[] y= new float[p];

float[] speedX= new float[p];
float[] speedY= new float[p];
float[] distX= new float[p];
float[] distY= new float[p];


void setup(){
  size(400,400,P3D);

  noFill();
  for(int i=0; i<p; i++){
    x[i]=random(width);
    y[i]=random(height);

    speedX[i]=random(1.5);
    speedY[i]=random(1.5);


  }

}

void draw(){

  background(0);

  for(int i=0; i<p; i++){
    x[i]+=speedX[i];
    y[i]+=speedY[i];
    distX[i]=dist(x[i],-y[i],mouseX,mouseX);
    distY[i]=dist(y[i],-x[i],mouseY,mouseY);

    if(x[i]<0 || x[i]>width){
      speedX[i]=speedX[i]*-1;
    }

    if(y[i]<0 || y[i]>height){
      speedY[i]=speedY[i]*-1;
    }



    if(distX[i]<x[i]){

      speedX[i]=speedX[i]-0.1;
      x[i]-= ( radians(100));
    }

    if(distY[i]<y[i]){

      speedY[i]=speedY[i]-0.1;
      y[i]-= ( radians(100));


    }


  }
  beginShape();
  for(int i=0; i<p; i++){

    stroke(i,x[i],y[i],10);
    vertex(x[i],y[i]);

  }
  endShape();

}






