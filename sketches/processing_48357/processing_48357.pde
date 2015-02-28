

void setup(){
    size(600, 600); 
    background(0); 
    stroke(255); 
    smooth(); 
    noLoop(); 
}

void trifract(float x, float y, float l, int level){
    line(x, y, x, y+l); 
    line(x, y, x+l*sqrt(3)/2, y-l/2); 
    line(x, y, x-l*sqrt(3)/2, y-l/2);
   
    if (level>1){
    l*=.5; 
    level= level-1; 
    trifract(x, y+l, l, level); 
    trifract(x+l*sqrt(3)/2, y-l/2, l, level); 
    trifract(x-l*sqrt(3)/2, y-l/2, l, level); 
    
    } 
  
    
    


   
    }
    
void draw(){
   
    trifract(width/2, height/2-50, 300, 8); 
    
    
    }

