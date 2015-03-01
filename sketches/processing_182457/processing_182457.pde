
void setup(){
    size(600, 600);
    background(0);
    stroke(255);
    smooth();
    noLoop();
}
  
void snowflake(float x, float y, float l, int level){
    //line(x, y, x, y+l);
    //line(x, y, x+l*sqrt(3)/2, y-l/2);
    //line(x, y, x-l*sqrt(3)/2, y-l/2);
    noFill();
    triangle(x, y+l,x+l*sqrt(3)/2, y-l/2,x-l*sqrt(3)/2, y-l/2);

     
    if (level>1){
    l*=-.5;
    level= level-1;
    snowflake(x, y+l, l, level);
    snowflake(x+l*sqrt(3)/2, y-l/2, l, level);
    snowflake(x-l*sqrt(3)/2, y-l/2, l, level);
      
    }
    
      
      
  
  
     
    }
      
void draw(){
     
    snowflake(width/2, height/2, 160, 4);
      
      
    }

