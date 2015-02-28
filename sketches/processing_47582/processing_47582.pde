
int numCubos=20;
float rotX=0,rotY=0;
float r=0, phi=0,theta=0;
float[] aristas;
vectorND[] centros;
PFont myFont;
secondApplet s;
thirdApplet t;
PFrame f;
PFrame2 f2;
void setup(){
 size(800,600,P3D);
 centros=new vectorND[numCubos];
 aristas=new float[numCubos];
 for(int i=0;i<numCubos;i++){
  centros[i]=new vectorND((float) random(-width/6,width/6),(float) random(-width/6,width/6),(float) random(-width/6,width/6));
  aristas[i]=(float) random(5,width/6);
 }
 f=new PFrame();
 PFrame2 f2=new PFrame2();
 
}
void keyPressed(){
 if(key=='s'||key=='S'){
  save("cameraView.jpg");
 }
}
void mouseDragged(){
 rotX=(float)mouseX/(float)width;
 rotY=(float)mouseY/(float)height;
}
void draw(){
 background(255);
 camera((width/2)*r*sin(PI*theta)*sin(HALF_PI*phi),(width/2)*r*cos(PI*theta)*sin(HALF_PI*phi),(width/2)*r*cos(HALF_PI*phi),0,0,0,0,-1,0);
 //translate(width/2,height/2,0);
 /*
 rotateY(TWO_PI*t.rotX2);
 rotateX(TWO_PI*t.rotY2);
 rotateY(TWO_PI*rotX);
 rotateX(TWO_PI*rotY);
 */
 for(int i=0;i<numCubos;i++){
  pushMatrix();
  translate(centros[i].getX(),centros[i].getY(),centros[i].getZ());
  fill(255*(((float)(i+1)/(float)(numCubos-1))),150);
  box(aristas[i]);
  popMatrix();
 }
}




