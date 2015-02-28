
float x, y;

void setup() {  //setup function called initially, only once
  size(900, 250);
  background(255);  //set background white
  counter = 0;
   smooth();
   frameRate(0.5);
}

void draw() {
  
  noStroke();
  //float v5 = map(mouseX, 40, width, 0, 70);

  for (int i=-100; i<width; i+= 100) {

    float v1 = random(40, 70);
    float v2 = random(45, 50);
    float v3 = random(77, 80);
    float v4 = random(55, 60);
    float v5 = random(20, 110);
    
    //vaseF
    float v6 = random(60, 80);
    float v7 = random(30, 50);
    float v8 = random(50, 70);
    float v9 = random(20, 130);
    vase( v1, v2, v3, v4, v5, v6, v7, v8, v9);
  }


  println(mouseX + ", " + mouseY);
}

void vase(float v1, float v2, float v3, float v4, float v5, float v6, float v7, float v8, float v9) {
  //for (int x = -120; x < width; x += 30) {
  translate(130, y);
  //Half vase
  pushMatrix();
  translate(x, y);
  fill(180);
  beginShape();
  vertex(33, 53);
  bezierVertex(39, 50, 32, 56, 33, 52);
  bezierVertex(v1,v2, 53, 45, 65, 45);
  bezierVertex(v3, 45, 99, v5, 110.0, 60);
  bezierVertex(121, 65.5, 128, 61.5, 132, 64.5);//bottom
  bezierVertex(136, 67.5, 128, 80, 104, 84);
  bezierVertex(80, 88, 46, 80, 42, v3);
  bezierVertex(38, 70, 28, 64, 32, 53);
  endShape();

  // Full vase
  fill(50);
  beginShape();
  vertex(37, 55);
  bezierVertex(37, 55, 33, 55, 37, 55);
  bezierVertex(41, 55, 49, 53, 54, 55);
  bezierVertex(v6, 57, v7, 67, 70, v8);
  bezierVertex(76, v5, 82, 62, 89, 59);
  bezierVertex(96, 56, 111, 55, 116, 57);
  bezierVertex(121, 59, 132, v1, 134, 66);
  bezierVertex(136, 69, 132, 73, 127, 76);//corner
  bezierVertex(v9, 79, 115, 84, 103, 92);//rightS.
  bezierVertex(91, 100, 92, 102, 93, 103);
  bezierVertex(94, 104, 99, 106, 101, 108);
  bezierVertex(103, 110, 60, 109, 54, 109);
  bezierVertex(48, 109, 54, 105, 60, 103);
  bezierVertex(66, 101, 51, 89, 47, 84);
  bezierVertex(v1, v3, 30, 70, 31, 61);
  bezierVertex(32, 52, 38, 55, 42, 55);
  endShape();
  popMatrix();
  //}
}
