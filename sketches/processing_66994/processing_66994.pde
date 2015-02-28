
int boxSize = 25;
int windowSize = 400;

int startCounting=0;

float tick = 1;
float w = width;

boolean altCol = true;
boolean start = true;
float randomColorScale1 = 1;
float randomColorScale2 = 1;
float randomColorScale3 = 1;


void setup(){
  size(800,400);
  noStroke();
  //smooth();
}

void draw(){
  tick = frameCount/600.0 * PI;
   for(int boxRadius_i = height*2;  boxRadius_i > 5; boxRadius_i -=boxSize-boxSize/2){
     for(int windowRadius_i = 0;  windowRadius_i <= width; windowRadius_i +=windowSize){
        
      if(keyPressed && (key == 'c' || key == 'C')) {
        randomColorScale1 = random(0.15,0.55);
        randomColorScale2 = random(1.25,1.55);
        randomColorScale3 = random(1.25,2.55);
       }  
        
      if (key == 'c' || key == 'C') {
          fill(
            100*randomColorScale2 + randomColorScale2 * 100 * sin(tick*boxRadius_i/boxSize*randomColorScale1 ),
            100*randomColorScale3 + randomColorScale2 * 100 * sin(tick*boxRadius_i/boxSize*randomColorScale1 ),
            100*randomColorScale3 + randomColorScale3 * 100 * cos(tick*boxRadius_i/boxSize*randomColorScale1 )
          );
       start = false;   
          
      } else if(key == 'b' || key == 'B' | start) {
        altCol = !altCol;
        int col = altCol ? 0 : 1;
        fill(
        255 * col,
        255 * col,
        255 * col
        );
      }
      
      pushMatrix();
      translate(windowRadius_i, height/2);
      rotate(tick*boxRadius_i/40);
      quad( -boxRadius_i/2, 0, 
             0, boxRadius_i/2, 
             boxRadius_i/2, 0, 
             0, -boxRadius_i/2
          );        
       popMatrix();
   }
 }  
}
