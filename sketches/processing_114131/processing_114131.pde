


void setup(){
  
  size (500,500);
  background(255);
  smooth();
  
}

void draw(){
  
  
  for(int a=225; a<=275; a= a+6){
    
  line(a,100,a,400);
 
  }
  
  for(int b=225; b<=275; b= b+6){
     line(100,b,400,b);
     
   }
   
   pushMatrix();
   translate(114,25);
    rotate(175); 
    for(int c=200; c<=280; c= c+6){
    line(50,c,-250,c);
  
     
    }
    popMatrix();
   
   
    pushMatrix();
   translate(450,80);
    rotate(-100); 
    for(int d=200; d<=275; d= d+6){
    line(100,d,-250,d);
  
     
    }
    popMatrix();
    
    fill(0,0,0,200);
  ellipse(250,250,150,150);  
   
   
   
   
   

  
//println(mouseX);  
}

