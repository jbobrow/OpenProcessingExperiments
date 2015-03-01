
//starting angle
float theta= 0.0;

void setup(){
  background(255);
  size(400,400);
  smooth();
}

void draw(){

// increasing theta 
theta +=0.02;

 noStroke();
 fill(0);
 
 float x = theta;
 for (int i = 0; i <=30 ; i++ ){
   // calculate sin of Y
   float y= (sin(x)*width/2);
   fill(255,0,0);
   ellipse(i*30,y+height/2,16,16);
   //move along X- axis
   x+=0.2;
 }
 

 for(int j=0 ; j < 50; j++){
   float y=(sin(x)*width/2);
   fill(0,0,255);
   ellipse(j*20,y+ height/2,16,16);
   
   x+=0.3;
 }
   
 }
 



