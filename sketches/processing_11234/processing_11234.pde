

void setup() {
  size(1000, 600);  
  noStroke();
  smooth();
  noLoop();
}



void draw() { 
  background(230);
  //stroke(200);

//------------------background lines 
  for(int i=0; i<100; i+=2) {
    for(int j=0; j<100; j+=2) {
      line(i*10, j*10,500,300);
      stroke(random(255),random(255),random(255));
      strokeWeight(random(5));
    }
  }

//------------------small background dots
  fill(60);
  for(int i=0; i<100; i+=2) {
    for(int j=0; j<100; j+=2) {
      ellipse(i*10, j*10,3,3);
    }
  }

//------------------large shapes
    for(int i=0; i<100; i+=2) {
    for(int j=0; j<100; j+=2) {
      ellipse(i*10, j*10,random(200),random(200));
      fill(random(255),random(255),random(255));
      noStroke();
      //blend(0, 0, 1000, 600, 0, 0, 1000, 600, ADD);
    }
  }


} 




