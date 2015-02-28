
float offset = 50.0;
float scaleVal = 50.0;
float angleInc = PI/2;
float angle = 0.0;
 
void setup(){
    size(450 ,800);
    background(109,34,40);
    noFill();
    stroke(250);
    smooth();
    noLoop();
}
 
void draw(){
    for(int x = 0; x <= width; x +=10) {
  
    
      float y = offset + (sin(angle) * scaleVal);
 
      arc(width/2,height/2, x, y*9, PI/2,TWO_PI*2);
   
    }
      
    }





