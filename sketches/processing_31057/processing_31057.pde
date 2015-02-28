
void setup(){
size(600,600);
smooth();

}
void draw(){

background(255);

//設定原點
 pushMatrix();
 translate(width/2,height/2);
// branch(100);
 branch(map(mouseX,0,width,10,100));
 popMatrix();
//回調原點

}

void branch(float len){
  line(0,0,0,-len);
  translate(0,-len);
  
  len *=0.8;
  float theta= map(mouseX,0,mouseY,0,PI);
  
  if(len>10){
  pushMatrix();
  rotate(theta);
  branch(len);
  popMatrix();
   
   }
   
    float thetb= map(mouseX,0,sin(30),0,-PI);
    
  
  if(len>10){
  pushMatrix();
 
  rotate(thetb);
  branch(len);
  popMatrix();
   
   }
  }

