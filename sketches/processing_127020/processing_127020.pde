
// Name:Eitan
// Date:01-07-14
// Project: Traffic Light

void setup() {  
  size(255, 250);
}

void draw() {                        
    background(0,0,255); 
    
    fill(0,0,0);                    
    rect(90,30,70,180);             
   
    fill(255,0,0);                  
    ellipse(125,60,50,50);          
    
    fill(255,233,0);                
    ellipse(125,120,50,50);         
    
    fill(0,255,0)                   
    ellipse(125,180,50,50);        
    
    fill(255,233,0);                
    ellipse(01,01,50,50);           
    
    ellipse(mouseX,mouseY,50,50)    

}
