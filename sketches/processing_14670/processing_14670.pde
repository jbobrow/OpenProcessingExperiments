
void setup() {
  size(300, 300);
  background(255);
}
void draw(){
strokeWeight(0.3);
for (int y = 4; y<300; y+=6){
 line(150-y/2,y,150+y/2,y);
 
  }
}
