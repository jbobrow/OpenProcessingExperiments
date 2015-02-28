
/* 

   Drawing Tool
   Liz Rutledge
   August 11,2010
   
   */
   
   
 float h=0;
 float s=100;
 float b=100;
 float dh=1;
 
 
 void setup(){
    size(600,400); 
    ellipseMode(CENTER);
    strokeWeight(5);
    
    
 }
 
 void draw(){
    colorMode(HSB,100); 
    
    if(mousePressed){
        //ellipse(mouseX,mouseY,10,10);
        stroke(h,s,b);   
         
        line(mouseX,mouseY,pmouseX,pmouseY);
        h+=.5; //make rainbow colors change
        if(h>=100){h=0;}
    }
 
  
   
 } //draw function

