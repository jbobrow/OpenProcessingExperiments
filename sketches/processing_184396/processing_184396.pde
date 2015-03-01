


void setup() {
size(500,500);
frameRate(25);
smooth();
}

void draw(){
 background(25); 
  for (int i=0; i < 500; i=i+1) {
   
    float x= random(0,250);
    float y= random(250,500);
    strokeWeight(random(1,4));
     stroke(random(255),random(255),random(255));
    line (x, i, y, i);
    
  }
 

}
