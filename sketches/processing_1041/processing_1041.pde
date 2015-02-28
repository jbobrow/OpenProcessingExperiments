
float[] x = new float[101];
float[] y = new float[101];
void setup(){
  background(200);


  smooth();
  stroke(0,50);

  for (int j=0;j<101;j++){
    x[j]=width/101*j;
    y[j]=height/2;


  }
}

void draw(){
  move(x,y);
  display();
  fill(255,3);
  rect(0,0,width,height);
  
  if (mousePressed == true){
    follow();
  }
}

  void follow(){
    x[100]=x[100]+(mouseX-x[100])/4;
    y[100]=y[100]+(mouseY-y[100])/4;
  }




void move(float[] X,float[] Y){
  for(int j=0;j<100;j++){
    X[j]+=(X[j+1]-X[j])/2;
    Y[j]+=(Y[j+1]-Y[j])/2;
  }

}

void display(){
  for(int j=0;j<100;j++){
    line(x[j],y[j],x[j+1],y[j+1]);
  }
}





