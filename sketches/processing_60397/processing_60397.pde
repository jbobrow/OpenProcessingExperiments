
//Muster

void setup() {
  size(500,500);
  smooth();
  background(255);
}

void draw(){
  //für die grünen Kreise
  fill(125,160,50);
  for(float c=.5;c<10;c++){
    for (float r=.5;r<10;r++){
      noStroke();
      ellipse(r*50,c*50,50,50);
    }
  }
  
      //function für die Kreise ohne füllung
  for (int c=1;c<25;c++) {
    for (int r=1;r<25;r++) {
      DrawLoops(r, c);
    }
  }
  
  //pinke punkte
  for (float c=.5;c<9;c++) {
    for (float r=.5;r<9;r++) {
      strokeWeight(10);
      stroke(170,50,130);
      point(r*50+23.5,c*50+23.5);
    }
  }
  

}

//Kreise ohne füllung
void DrawLoops(int r, int c){
  strokeWeight(3);
  stroke(255,100);
  noFill();
  ellipse(r*20,c*20, 40, 40);
}
