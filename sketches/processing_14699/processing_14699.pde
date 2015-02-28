
 int counter;

void setup() {  //setup function called initially, only once
  size(200, 200);
  background(255);  //set background white
 
}

void draw(){
strokeWeight(0.2);
for (int y = 0; y<200; y=y+3) {
 line(100-y,y*2,100+y,y*2);
  }
}        
