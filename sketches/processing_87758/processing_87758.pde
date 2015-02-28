
float xpos;
float angle = 0.0;

void setup() {
  size(500, 500);
  smooth();
  xpos=10;
}

void draw() {
  background(200);
  
  /*pushMatrix();
  noStroke();
  fill(255);
  float tri1 = map(mouseX, 0, width, 214, 284);
  float tri2 = map(mouseX, 0, width, 284, 411);
  triangle(149, 168, 214, 284, 88, 284);
  triangle(346, 168, 411, 284, 285, 283);
  popMatrix();
  */
  
  float mx=map(mouseX, 1200, 80, 50, 250);
  
  //RIGHT EYE
  strokeWeight(1);
  stroke(0);
 
  fill(255);
 
  triangle(149, mx-80, 214, mx+30, 88, mx+30);
  
  //LEFT EYE
  strokeWeight(1);
  stroke(0);
 
  fill(255);
 
  triangle(346, mx-80, 411, mx+30, 285, mx+30);
  
  
  //eyes
  noStroke();
  fill(0);
  
  float yposeye = map (mouseX, 0, width, 250, 190);
  float eye1 = map(mouseX, 0, width, 20, 60);
  float eye2 = map(mouseX, 0, width, 20, 60);
  ellipse(150, yposeye, eye1, eye2);
  ellipse(350, yposeye, eye1, eye2);

  /* ellipse(257, 429, 80, 30); */

  //mouth
  noStroke();
  float m1 = map(mouseX, 0, width, 100, 300);
  float m2 = map(mouseX, 0, width, 30, 80);
  ellipse(257, 429, m1, m2); 

  noStroke();
  float hair1 = map(mouseX, 0, width, 340, 340);
  float hair2 = map(mouseX, 0, width, 80, 60); 
  rect(80, 0, hair1, hair2);



  /*
  //mustache line1
  stroke(0, 0, 0);
  float l1 = map(mouseX, 0, width, 205, 209);
  float l2 = map(mouseX, 0, width, 397, 298);
  float stroke1 = map(mouseX, 0, width, 1, 4);
  strokeWeight(stroke1);
  line(l1, l2, 205, 355);

  //line2
  float l3 = map(mouseX, 0, width, 215, 219);
  float l4 = map(mouseX, 0, width, 396, 306);
  float stroke2 = map(mouseX, 0, width, 1, 4);
  strokeWeight(stroke2);
  line(l3, l4, 215, 355);
  
  //line3
  float l5 = map(mouseX, 0, width, 228, 232);
  float l6 = map(mouseX, 0, width, 397, 306);
  float stroke3 = map(mouseX, 0, width, 1, 4);
  strokeWeight(stroke3);
  line(l5, l6, 228, 355);
  
  //line4
  float l7 = map(mouseX, 0, width, 241, 241);
  float l8 = map(mouseX, 0, width, 397, 305);
  float stroke4 = map(mouseX, 0, width, 1, 4);
  strokeWeight(stroke4);
  line(l7, l8, 241, 355);
  
   //line5
  float l9 = map(mouseX, 0, width, 250, 255);
  float l10 = map(mouseX, 0, width, 397, 310);
  float stroke5 = map(mouseX, 0, width, 1, 4);
  strokeWeight(stroke5);
  line(l9, l10, 250, 355);
  
   //line6
  float l11 = map(mouseX, 0, width, 261, 265);
  float l12 = map(mouseX, 0, width, 397, 309);
  float stroke6 = map(mouseX, 0, width, 1, 4);
  strokeWeight(stroke6);
  line(l11, l12, 261, 355);
  
   //line7
  float l13 = map(mouseX, 0, width, 274, 277);
  float l14 = map(mouseX, 0, width, 397, 307);
  float stroke7 = map(mouseX, 0, width, 1, 4);
  strokeWeight(stroke7);
  line(l13, l14, 274, 355);
  
   //line8
  float l15 = map(mouseX, 0, width, 287, 290);
  float l16 = map(mouseX, 0, width, 397, 307);
  float stroke8 = map(mouseX, 0, width, 1, 4);
  strokeWeight(stroke8);
  line(l15, l16, 287, 355);
  
   //line9
  float l17 = map(mouseX, 0, width, 301, 294);
  float l18 = map(mouseX, 0, width, 397, 300);
  float stroke9 = map(mouseX, 0, width, 1, 4);
  strokeWeight(stroke9);
  line(l17, l18, 301, 355);
 */
 float r = random(0, mouseX);
 stroke(2);
 for (int g = 20; g < 500; g +=20) {
    float a = mouseX/150;
    float offsetA = random (-a, a);
    float offsetB = random (-a, a); 
    line(g - offsetA, 340, g - offsetB, 380);
    
  }
 
}



