
float culr;
float moveZ;

void setup() {
  size(500,500);
  background(0);
  colorMode(HSB);
}

void draw(){
  for(int x = 0; x < width; x = x + 25){
    for(int y = 0; y < height; y = y + 25){
      
      culr = noise(x/100,y/100,moveZ)*360;
      fill(culr,360,360);
      rect(x+2.5,y+2.5,20,20);
     // println(culr);
    }
  }
  
  moveZ+=0.01;
}

