
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: YUN Sojung
// ID: 201420093
 
void setup(){
    size (1024, 768);
    background(255,230,210);
}
void draw() {;
  for (int x1 = -20; x1 < width; x1 = x1+50) {
    for (int y1 = 60; y1 < height; y1 =y1+100) {
      noStroke(); 
      triangle (x1, y1, (x1 + 60), ( y1-40), (x1 +40), y1);
    }
  }
  fill( #6C8DFF);
 
}

  
  

