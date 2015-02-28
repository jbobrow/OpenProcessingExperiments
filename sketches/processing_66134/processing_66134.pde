

//Hexagonal Fractal 


int n = 1; 
void setup(){
    size(600, 600);
    background(0);
    stroke(255);
    //smooth();
    //noLoop();
}

void hexfract(float x, float y, float l, int level){
    line(x - l, y, x + l, y); 
    line(x - l*cos(PI/3), y + l*sin(PI/3), x + l*cos(PI/3), y - l*sin(PI/3)); 
    line(x + l*cos(PI/3), y + l*sin(PI/3), x - l*cos(PI/3), y - l*sin(PI/3)); 
    
    
    if (level>1){
    
    level= level-1;
    l*=.4; 
    hexfract(x - l*cos(PI/3), y - l*sin(PI/3), l, level); 
    hexfract(x + l*cos(PI/3), y - l*sin(PI/3), l, level); 
    hexfract(x + l, y, l, level); 
    hexfract(x + l*cos(PI/3), y + l*sin(PI/3), l, level); 
    hexfract(x - l*cos(PI/3), y + l*sin(PI/3), l, level); 
    hexfract(x - l, y, l, level); 
    

    
     
    }
   
     
     
 
 
    
    }
     
void draw(){
    
    hexfract(width/2, height/2, 250, n);
    
     
     
    }
void mouseClicked(){
  n++; 
}

void keyPressed(){
  n--;  
  background(0); 
}

