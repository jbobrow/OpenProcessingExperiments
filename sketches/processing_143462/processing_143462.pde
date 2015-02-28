
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: YUN Sojung
// ID:201420093
 
void setup(){
  size(600,600);
 noLoop();
  background(600,0,0);
}
 
void draw(){
  stroke(255);
  // grid with random strokeWeight applied on points
  for (int i = 50; i < width-50; i = i + 50) {
      for (int j = 10; j < height; j = j + 10){
        strokeWeight(random(5));
        point(i,j);
      }
  }
}
 
void keyPressed(){
  background(0,0,600); 
  redraw();
}

