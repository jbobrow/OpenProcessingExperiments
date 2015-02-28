
void setup() {
  size(800,600);

  noStroke();
  smooth();
    background(0);
  drawPattern(0 ,0 ,800, 600,5);
    
}
 
 


void drawPattern(float a, float b,float c, float d, int level) {

  rect(a,b,c,d);
   fill(random(255),random(255)); 
  float shrink = .8;
   
  if(level>0){
     
    level--;
    drawPattern(a, b+(d-d*shrink)/2 , c/2 , d*shrink, level );
    drawPattern(a+c/2, b+(d-d*shrink)/2 , c/2 , d*shrink, level );
  }
}


