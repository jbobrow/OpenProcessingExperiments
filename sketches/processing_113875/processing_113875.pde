
void setup(){
  
  size(500,500);
  background(100,255);
  smooth();
  
  
}

void draw(){
  ///background(255,255);
  
  
  pushMatrix();
  stroke(2);
  for(int a=100 ; a<=300; a=a+2){
  line(a, 500,0,a);
  }
  
  
  popMatrix();
  
   
  pushMatrix();
  stroke(200);
  for(int a=0 ; a<=500; a=a+5){
  line(a, 400,0,a);
  }
  
  
  popMatrix();
  
   
  pushMatrix();
  stroke(100);
  for(int a=0 ; a<=500; a=a+5){
  line(500,a,a,0);
  }
  
  popMatrix();
  
   
  pushMatrix();
  stroke(5);
  for(int a=0 ; a<=500; a=a+8){
  line(500,a,a,0);
  
   }
   
   popMatrix();
   
   
     
  pushMatrix();
  stroke(1);
  for(int a=0 ; a<=5000; a=a+50){
  line(0,0,550,a);
  
   }
   
   popMatrix();
   
  for(int c=100; c<=200; c=c+10){
  fill(c);
  }
 // ellipse(250,225,250,250);
//ellipse(mouseX,mouseY,60,60);
 
  
  
  
  
  
}

