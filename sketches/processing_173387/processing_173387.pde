
void setup(){

 size(640, 360);
 background(0);
 frameRate(20);

}

void draw(){
  
  background(110, 200, 220);
 for(int i = 10; i < width; i += 10) {
    stroke(153);
    strokeWeight(40);
    line(i, 20, i, 180+random(10)); 
  }
}


