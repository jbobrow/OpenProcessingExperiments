
int right = 10;
int down  =10;
 

void setup () {
size(600, 600);

smooth();
noStroke(); 
frameRate(150);


}


void draw () {
  if(mouseX> width/2) 
  
  {
  
  for (int i=0; i<width; i+=right) {
  for (int j=0; j<height; j+=down) {
    for (int k=0; k<255; k+=10) {
      float a = (255);
      float b = random(255);
      float c = random(255);
 
      fill(a, b, c);
 
 
 
      rect(i, j, 100, 50);

      

    }
    
  }
}

  }
  
}
