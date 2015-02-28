
float y=100;
void setup(){
  size(200,200);
}
void draw(){

  fill(random(255));
  for(int y=0; y<200; y=y+20){
    for(int x=0; x<200; x=x+20){
      float d=dist(x,y,100,100);
      float c=(cos(radians(d))+0.0001)*200;
      stroke(c);
      point(x,y);
      
        }
      }
      
      

  
}
      
