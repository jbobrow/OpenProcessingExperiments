

//Pentagonal Snowflake


int n = 1; 
void setup(){
    size(600, 600);
    background(0);
    stroke(255);
    //smooth();
    //noLoop();
}

void penfract(float x, float y, float l, int level){
    line(x, y, x, y - l); 
    line(x, y, x + l * cos(PI/10), y - l * sin(PI/10)); 
    line(x, y, x + l * cos(3*PI/10), y + l * sin(3*PI/10)); 
    line(x, y, x - l * cos(3*PI/10), y + l * sin(3*PI/10)); 
    line(x, y, x - l * cos(PI/10), y - l * sin(PI/10)); 
    
    if (level>1){
    
    level= level-1;
    l*=-.5; 
    penfract(x, y - l, l,  level); 
    penfract(x + l * cos(PI/10), y - l * sin(PI/10), l, level); 
    penfract(x + l * cos(3*PI/10), y + l *sin(3*PI/10), l, level); 
    penfract( x - l * cos(3*PI/10), y + l*sin(3*PI/10), l, level); 
    penfract(x - l * cos(PI/10), y - l * sin(PI/10), l, level); 
    
     
    }
   
     
     
 
 
    
    }
     
void draw(){
    
    penfract(width/2, height/2, 250, n);
    
     
     
    }
void mouseClicked(){
  n++; 
}

void keyPressed(){
  n--; 
  background(0); 
}

