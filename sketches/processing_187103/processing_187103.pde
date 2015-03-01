
//For Loop
//Rafael Gaia

void setup(){
  size(600,600);
  background(255);
  frameRate(60);
}


void draw(){

  
  for(int i=0; i<600; i = i+30){
        for(int j=0; j<600; j = j+30){
          fill(i*j%255, i%255, j%255);
          rect(i,j, 30,30);
        }
  }
}
