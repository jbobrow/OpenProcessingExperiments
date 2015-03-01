
float in = 0;
float theta=0;
int h=0;
void setup()
{
size(600,600,P3D);

}
void draw()
{
   
   background(0,255);

  if(mousePressed){
    in++;
  }  
   translate(0,height/2,50);
  for(int i=0;i<=1;i++){
    
     pushMatrix();
     translate(i=width/2,0);

 
  if(i==1)
  {
   rotateY(theta);
  ;
   
  }
 
  drawSphere(-200,0,in+0,mouseY/4,100, color(255,0,0));  //left
  drawSphere(0,height/4,in+0,mouseY/4,100,color(255,255,0)); //down
  drawSphere(0,-height/4,in+0,mouseY/4,100,color(255,0,255)); //up
  drawSphere(0,0,in+height/4,mouseY/4,100,color(0,0,255)); // middle
  drawSphere(200,0,in+-height/4,mouseY/4,100,color(0,255,0)); //right
   popMatrix();
}
theta+=0.05;
h+=100;

}
 
void drawSphere(float x,float y,float z, float f,float d, color c)
{
  f=f+10;
  pushMatrix();
  translate(x,y,z);
  

  stroke(255,60);
  
 
  vertex(0,0,0);
  vertex(0,0,-f,d);
  endShape();
  fill(c);
  noStroke();
  box(f);
  
  fill(100);
  noStroke();
 
  popMatrix();
}

