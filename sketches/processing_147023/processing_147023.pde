
void setup(){
  size(600,400);
  noStroke();
}

void draw(){
   for(float i = 5; i < width; i = i * 1.2){
    for(float j = 9; j < height; j = j + 50.2){
      for(float k = 4; k < 22; k = k * 1.2){
        for (int l = 2; l < 40 ; l = l + 1){
          rect(i,j,k,l);
          fill(255,158,54);
        }
      }
    }
   }
 
}
