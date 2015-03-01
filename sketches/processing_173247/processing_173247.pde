
void setup(){  
    size(600,600);  
}  
  
void draw(){  
    background(0);  
    smooth();  
    fill(255,100);  
    stroke(255);  
    translate(width/2, height);  
   scale(2.0,-1.5);  
    line(0,0,0,-1);  
      
    
    tree( radians(mouseX/10), 50, 1);   
}  
  
void tree( float angle, float length, int branch){  
      
    if(branch < 10 ){  
        pushMatrix();  
        rotate(angle);  
        line(0,0, 0, length);  
        translate(0, length);  
        
        tree( angle * 1.1, length * .9, branch+1);  
        popMatrix();  
          
        pushMatrix();  
        rotate(-angle);  
        line(0,0, 0, length);  
        translate(0, length);  
     
        tree( angle * 1.1, length * .9, branch+1);  
        popMatrix();  
    }  
}  
