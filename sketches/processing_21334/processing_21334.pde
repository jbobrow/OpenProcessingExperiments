
//Decagon, D10 symmetry
//ethan dale
//CCA SP2011 math, programming & art

void setup(){
  size(500,500);
  smooth();
  strokeWeight(.5);
    colorMode(HSB,360,100,100,100);
}

void draw(){
  background(160);
  translate(width/2, height/2);
  for(int i = 0; i < 10; i++){

      rotate(radians(36));
      rect(0,0,20,40);
      
     pushMatrix();
      rect(0,20,20,40);
      for(int j = 0; j < 100; j += 20) {
      rect(0,j,20,40);
      }
      for(int k = 0; k < 100; k += 20) {
      rect(k,100,20,40);
      }
     popMatrix();

 
  
}
}

