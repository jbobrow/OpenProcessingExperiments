
int[] iValues = new int[21];
int ballSize;
boolean tannaz;
int bootcamp;

void setup(){
  
  bootcamp = 0;
  tannaz = false;
  noStroke();
  
  size (500, 500);
  for (int i=0; i < 21; i= i + 1){
    
  iValues[i] = i*25;
  
  }
  
}



void draw() {

  background (255);
  smooth();
  
for (int j = 0; j < 21; j = j+1){ 
  
    ballSize = iValues[j];  
  
    fill (0, bootcamp , 0, 100);
    ellipse(250, ballSize, ballSize/5, ballSize/5);
    
    fill (0, 0, bootcamp, 100);
    ellipse(ballSize, 250, (500-ballSize)/5, (500-ballSize)/5); 
}
}

void mouseClicked () {

if (tannaz == false) {
tannaz = true;
bootcamp = 255;

} else {
  
  tannaz=false;
  bootcamp = 0;

}
}



