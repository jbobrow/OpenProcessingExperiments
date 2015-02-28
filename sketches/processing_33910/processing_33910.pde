


void setup() {
  size(800, 800);
  smooth();


}

void draw() {
  
    
    for (int i=0; i<width; i+=50) {
      for (int j=0; j<height; j+=50) {
        float m = millis();
        stroke(random(m%255), random(m%255), random(m%255));
        strokeWeight(50);
        //line(pmouseX,pmouseY, i,j);
        line(pmouseX,pmouseY,i,j);
      }
    }
  }


  



