
float ang;
float vx, vy;
void setup(){
  smooth();
  size(500,500);
  
}

void draw(){
 background(random(200),10,250);
sstone(250,250,ang);

sstone(250,160,-ang);

sstone(250,340,-ang);

sstone(340,250,-ang);

sstone(155,250,-ang);


sstone(250,250,-ang);

sstone(250,160,+ang);

sstone(250,340,+ang);

sstone(340,250,+ang);

sstone(155,250,+ang);



ang=ang+0.05;



}

void stone(float x, float y){
  pushMatrix();
  translate(x,y);
  fill(random(250),0,0);
 
  ellipse(0,0,100,100);
 fill(0,0,0);
 rotate(y+millis()/200.0);
  ellipse(25,0,50,50);
  popMatrix();
  
}

void sstone(float w, float z, float a){
pushMatrix(); 
   
  translate(w,z);
  scale(0.3);
  rotate(a);
stone(100,0);
stone(0,0);
stone(0,-100);
stone(-100,0);
stone(0,100);

//ang=ang+0.02;
popMatrix();


}

