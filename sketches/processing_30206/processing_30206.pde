
void setup(){
  size(600,600);
  smooth();
  
  for (int i=1; i<6; i++){
    for(int j=1; j<6; j++){
    myShape(i*100, j*100, random(.5,2), random(.5,2), random(1,5));
    }
  }
  
}

void myShape(float xpos, float ypos, float scalex, float scaley, float sWeight){
  pushMatrix();
  translate(xpos, ypos);
  scale(scalex, scaley);
  strokeWeight(sWeight);
  for(int i=0; i<5; i++){
    fill(255, 20);
    ellipse(0,0, i*20,i*20);
  }
  popMatrix();
}

