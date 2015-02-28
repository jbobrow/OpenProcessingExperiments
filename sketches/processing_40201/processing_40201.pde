
float [] x = new float[30];
float [] y = new float[30];
float [] s = new float[30];
float a;
void setup(){
  size(900,300);
  a=5;
smooth();
  for (int i=0; i< x.length; i++){
    x[i]=random(0,900);
    y[i]=random(0,300);
    s[i]=random(0.2,0.8);   
  }
}
  void draw(){
   fill(distance(0,0,mouseX,mouseY),distance(900,300,mouseX,mouseY),distance(0,300,mouseX,mouseY)); //color will change depend on distance of the mouse and setting point
    rect(0,0,900,300);
    for(int i=0;i<x.length;i++){
      panda(x[i],y[i],s[i]);
      x[i]+=a;
      y[i]+=random(-5,5);
      if(x[i]>900||x[i]<0){
        a=-a;
       }
    }}
    
  
void panda(float x,float y,float s){
pushMatrix();
  translate(x,y);
  scale(s);//scale the panda
//ears of panda
fill(0);
ellipse(-70,-50,70,70);
ellipse(70,-50,70,70);
//head of panda
fill(255);
strokeWeight(4);
ellipse(0,0,200,180);
//eyes of panda
fill(0);
ellipse(-50,10,60,70);
ellipse(50,10,60,70);
fill(255);
ellipse(-50,0,12,12);
ellipse(50,0,12,12);
//nose of panda
fill(0);
ellipse(0,50,15,10);
//mouse of panda
noFill();
stroke(0);
strokeWeight(4);
bezier(-5,70,-5,75,5,75,5,70);
popMatrix();
}
float distance(float x1, float y1,float x2, float y2){ //return value of the distance of mouse position and setting point)
  float dx=x1-x2;
  float dy=y1-y2;
  float d=sqrt(dx*dx-dy*dy);
  return d;}
