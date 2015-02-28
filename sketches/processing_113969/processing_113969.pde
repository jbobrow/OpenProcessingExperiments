


void setup(){
  size(500,500);
  smooth();
  background(255,160,0);
}
  
  void draw(){
    
  
    pushMatrix();
   rectMode(CENTER);
    translate(width/2, height/2);
    stroke(255,100,0,170);
    strokeWeight(5);
      for(int a=0; a<=7000; a=a+5){rotate(a);   fill(255,0,0,7140);
    rect(0,0,796,12);}
  popMatrix();

     pushMatrix();
     stroke(255,100,0,170);
    strokeWeight(6);
    fill(255,0,0,70);
    for(int c=0; c<250; c=c+40){
    ellipse(width/2,height/2,c,c);
   println(c);}
    popMatrix();
    
    
   
   
  
  }

