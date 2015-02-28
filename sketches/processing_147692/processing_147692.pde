
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM Mirae
// ID: 201420064
 
void setup() {
  size (1024, 768);
  background(#013555);
  noLoop();
  smooth();
  
}
 
void draw() {
  
  //background pattern
  for (int i = 10; i < width; i += 25) {
  for (int j = 10; j < height; j += 25) {
  rectMode(CENTER);
    stroke(#ffffff);
    rect(i, j, 0, 0);
    rect(j, i, 0, 0);
  }
  }
 
 //pattern
  for (int i = 0; i < 1024; i = i +350) {
  for (int j = 0; j < 768; j = j +350) {
 
 
      rectMode(CENTER);
      fill(#255275);
      noStroke();
      rect(i+165,j+215,200,200);
  
      rectMode(CENTER);
      fill(#227d9f);
      noStroke();
      rect(i+150,j+185,170,140);
     
      rectMode(CENTER);
      fill(#1bb1ba);
      noStroke();
      rect(i+130,j+165,130,100);
      
      rectMode(CENTER);
      fill(#2addd2);
      noStroke();
      rect(i+115,j+155,100,80);
      
      rectMode(CENTER);
      fill(#b0edef);
      noStroke();
      rect(i+100,j+140,70,50);
      
      
      
    }
  }
}
