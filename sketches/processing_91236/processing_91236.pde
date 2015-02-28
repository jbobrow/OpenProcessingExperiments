
//setup
void setup() {
  size(900, 900);
}

void draw() {
  
 //repititon  
  for (int i =0;i<900;i+=8) {
    for (int j =0;j<900;j+=8) {
      //color 
      float mappedColor = map(i, 100, 900, 0, 225);
      float mappedX=map(j, 100, 400, 0, 255);
      fill(mappedColor, 0, 150);
      //ellipse
      ellipse(i, j, 8, 8);
    }
  }
}



