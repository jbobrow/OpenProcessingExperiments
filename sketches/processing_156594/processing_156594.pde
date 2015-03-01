
void setup() {
  size(600, 600);
  noStroke(); 
  //noSmooth(); 
} 

void draw() {
//  for ( int i = 0; i < 10; i++ ) {
//    for ( int j = 0; j < 10; j++ ) { 
//      // do something in here 10 times
//      rect(i * 10, j * 10, 10, 10);
//    }
//  }
  //background(255);
  
  fill(255, 10); 
  rect(0,0,width,height); 
  for (int i = 0; i < width; i+=5) { 
   float amplitude = map(mouseY, 0, height, 10, 150); 
   float freq = map(mouseX, 0, width, 0.001, 1); 
    float sine = sin((frameCount+i) * freq);
     float c = map(sine, -1, 1, 100, 200); 
     fill(c); 
    ellipse(i, height/2 + (sine * amplitude), 5,5); 
    
  }


  for (int i = 0; i < width; i+=5) { 
   float amplitude = map(mouseY, 0, height, 10, 150); 
   float freq = map(mouseX, 0, width, 0.001, 1); 
    float cosi = cos((frameCount+i) * freq);
     float c = map(cosi, -1, 1, 100, 200); 
     fill(c); 
    ellipse(i, height/2 + (cosi * amplitude), 5,5); 
    
  }



}



