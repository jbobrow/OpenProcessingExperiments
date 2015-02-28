
void setup(){
  size(600,400);
  smooth();
  background(0);
  //noLoop();
}

void draw(){
  
 for(i=0; i<200; i++){
    
  float amplitude =i;
  for (int x=0; x<width;x+=3){
    
    float theta = x*TWO_PI/width;
    float y=amplitude * tan(theta);
    
    stroke(random(20),random(120), random(200));
    point(x,y+height/2);
   }
  }

}

