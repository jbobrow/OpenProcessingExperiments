


int b=30;

void setup(){
  size(700,700);
  background(255);
}
  void draw (){
   frameRate(30);
 for(int i=0;i<width;i+=30){
 for(int a=0;a<width;a+=30){ 
 smooth(); 
 stroke(5,4,90);
 fill (91,227,89,30);
 ellipse(a,i,50,50);  
 
 }
 }

  }
 
    void mousePressed (){  
  smooth(); 
  fill(252,3,32);
  rectMode(CENTER);
  rect(mouseX,mouseY,b,b);
  endRecord();
  }
   
   

