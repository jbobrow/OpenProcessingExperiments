
float B = 0;
float C = 0;

void setup() {
  size(500,500);
    
}


void draw() {
  background(0);
  smooth();

float sizeB = 50;
float sizeC = 50;

if(random(10) > 9.9) {
  sizeB = 100;
}
  ellipse(B,50,sizeB,sizeB);
  
  B = B+1;
  
  if(B>500) {
 B=0;
  
  }
  
  ellipse(C,50,sizeC,sizeC);
  
  C = C+2;
  
  if(C>510) {
    C = 0;
  }
}

