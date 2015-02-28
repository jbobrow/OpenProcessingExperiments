
void setup() {
  size(200,200);
  background(255);
}
void draw(){
strokeWeight(2);
for (int y=0; y<200; y=y+6){
 line(100-y/2,y,100+y/2,y);
 }
}
                
                                                
