
int num =500;

float[] X=new float[num];
float[] Y=new float[num];
float[] Spx=new float[num];
float[] Spy=new float[num];
float[] SpeedRate=new float[num];

void setup(){
  size(600,400);
  frameRate(30);

  for(int i=0; i<num; i++){
  X[i]=random(width);
  Y[i]=random(height);
  Spx[i]=Spy[i]=0;
  SpeedRate[i]=random(0.01);
 }
}

void draw(){
  background(0);
  for(int i=0; i<num; i++){
    Spx[i]=(mouseX-X[i])*SpeedRate[i];
    Spy[i]=(mouseY-Y[i])*SpeedRate[i];
    X[i]+=Spx[i];
    Y[i]+=Spy[i];
    drawBug(i);
 }
}  

void drawBug(int i){
  pushMatrix();
  translate(X[i],Y[i]);
  rotate(atan2(mouseY-Y[i],mouseX-X[i]));
  noFill();
  stroke(255,20);
  bezier(0,0,mouseX,mouseY,pmouseX,pmouseY,50,100);
  popMatrix();
}         
                                                                                
