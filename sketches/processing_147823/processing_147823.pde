
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: JEONG Eunyeah
// ID: 201420106

void setup(){
size (1024, 768);
smooth();
noLoop();
}

void draw(){
  background(#572c37);
    for (int x = 0; x < width; x += 82) {
    for (int y = 0; y < height; y+= 82) {
      stroke (#dade91);
      strokeWeight(4);
      fill(#d46e6c);
      rect(x, y, 50, 50);
      
      noStroke();
      fill(#8c4041);
      ellipse(x,y,40,40);
      
      stroke(#dade91);
      strokeWeight(2);
      noFill();
      ellipse(x,y,29,29);
}
 }
  }
void keyPressed() {
  background(0);
  redraw();
} 
