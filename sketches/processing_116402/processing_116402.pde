
int counter;

void setup() {  //setup function called initially, only once
  size(900, 200);
  background(255);  //set background white
  
  counter = 0;
}

void draw() {
  
  noStroke();

  float vaseFullcolor = map(mouseX, 10, width, 0, 0  );
  float vaseHalfcolor = map(mouseX, 10, width, 0, 366  );
  // vase 1
  fill(vaseHalfcolor, 66, 76);
  vaseHalf1( 0, 30);
  fill(vaseFullcolor, 0, 20);
  vaseFull1( 0, 30);

  // vase 2
  fill(vaseHalfcolor, 106, 98);
  vaseHalf2(150, 30);
  fill(vaseFullcolor, 0, 20);
  vaseFull2(150, 30);

  // vase 3
  fill(vaseHalfcolor, 200, 250);
  vaseHalf3(300, 30);
  fill(vaseFullcolor, 0, 20);
  vaseFull3(300, 30);

  // vase 4
  fill(vaseHalfcolor, 250*4, 252);
  vaseHalf4(450, 30);
  fill(vaseFullcolor, 0, 20);
  vaseFull4(450, 30);  

  // vase 5, system cashed
  fill(vaseHalfcolor, 75, 76);
  vaseHalf5(600, 50);
  fill(vaseFullcolor, 0, 20);
  vaseFull5(600, 50);

  // vase 6, system cashed
  fill(vaseHalfcolor, 83, 84);
  vaseHalf6(750, 50);
  fill(vaseFullcolor, 0, 20);
  vaseFull6(750, 50);

  // vase 7, system cashed
  fill(vaseHalfcolor, 83, 84);
  vaseHalf7(900, 50);
  fill(vaseFullcolor, 0, 20);
  vaseFull7(900, 50);

  // vase 8, system cashed
  fill(vaseHalfcolor, 83, 84);
  vaseHalf8(1050, 50);
  fill(vaseFullcolor, 0, 20);
  vaseFull8(1050, 50);
}


void vaseHalf1(float x, float y ) {
      text( "2013 Copyright at Njoy Design Studio", 680, 190 );

  //Half vase
  pushMatrix();
  translate(x, y);
  beginShape();
  vertex(33, 53);
  bezierVertex(39, 50, 32, 56, 33, 52);
  bezierVertex(34, 49, 53, 45, 65, 45);
  bezierVertex(77, 45, 99, 54, 110.0, 60);
  bezierVertex(121, 65.5, 128, 61.5, 132, 64.5);
  bezierVertex(136, 67.5, 128, 80, 104, 84);
  bezierVertex(80, 88, 46, 80, 42, 75);
  bezierVertex(38, 70, 28, 64, 32, 53);
  endShape();
  popMatrix();
}

void vaseFull1(float x, float y ) {
  //Full vase
  pushMatrix();
  translate(x, y);
  beginShape();
  vertex(37, 55);
  bezierVertex(37, 55, 33, 55, 37, 55);
  bezierVertex(41, 55, 49, 53, 54, 55);
  bezierVertex(59, 57, 64, 67, 70, 67);
  bezierVertex(76, 67, 82, 62, 89, 59);
  bezierVertex(96, 56, 111, 55, 116, 57);
  bezierVertex(121, 59, 132, 63, 134, 66);
  bezierVertex(136, 69, 132, 73, 127, 76);
  bezierVertex(122, 79, 115, 84, 103, 92);
  bezierVertex(91, 100, 92, 102, 93, 103);
  bezierVertex(94, 104, 99, 106, 101, 108);
  bezierVertex(103, 110, 60, 109, 54, 109);
  bezierVertex(48, 109, 54, 105, 60, 103);
  bezierVertex(66, 101, 51, 89, 47, 84);
  bezierVertex(43, 79, 30, 70, 31, 61);
  bezierVertex(32, 52, 38, 55, 42, 55);
  endShape();
  popMatrix();
}

void vaseHalf2(float x, float y ) {
  //Half vase 2
  pushMatrix();
  translate(x, y);
  beginShape();
  vertex(34.0, 71.0);
  bezierVertex(30.0, 77.0, 35.0, 74.0, 34.0, 71.0);
  bezierVertex(33.0, 68.0, 26.0, 46.0, 50.0, 50.0);
  bezierVertex(74.0, 54.0, 85.0, 61.5, 96.0, 68);
  bezierVertex(107, 74, 114.0, 70, 118.0, 73);
  bezierVertex(122.0, 76, 114.0, 90, 90.0, 94);
  bezierVertex(66.0, 98, 30.0, 88.0, 29.0, 80.0);
  bezierVertex(28.0, 72.0, 34.0, 77.0, 34.0, 69.0);
  endShape();
  popMatrix();
}

void vaseFull2(float x, float y ) {
  //Half vase 2
  pushMatrix();
  translate(x, y);
  beginShape();
  vertex(66.0, 72.0);
  bezierVertex(72.0, 61.0, 67.0, 72.0, 66.0, 72.0);
  bezierVertex(65.0, 72.0, 73.0, 67.0, 79.0, 68.0);
  bezierVertex(85.0, 69.0, 89.0, 66.0, 92.0, 63.0);
  bezierVertex(95.0, 60.0, 95.0, 58.0, 106.0, 56.0);
  bezierVertex(117.0, 54.0, 117.0, 58.0, 122.0, 60.0);
  bezierVertex(127.0, 62.0, 132.0, 63.0, 134.0, 66.0);
  bezierVertex(136.0, 69.0, 132.0, 73.0, 127.0, 76.0);
  bezierVertex(122.0, 79.0, 115.0, 84.0, 103.0, 92.0);
  bezierVertex(91.0, 100.0, 92.0, 102.0, 93.0, 103.0);
  bezierVertex(94.0, 104.0, 99.0, 106.0, 101.0, 108.0);
  bezierVertex(103.0, 110.0, 60.0, 109.0, 54.0, 109.0);
  bezierVertex(48.0, 109.0, 54.0, 105.0, 60.0, 103.0);
  bezierVertex(66.0, 101.0, 50.0, 95.0, 38.0, 88.0);
  bezierVertex(26.0, 81.0, 46.0, 85.0, 52.0, 81.0);
  bezierVertex(58.0, 72.0, 63.0, 72.0, 66.0, 72.0);
  endShape();
  popMatrix();
}

void vaseHalf3(float x, float y ) {
  //Half vase
  pushMatrix();
  translate(x, y);
  beginShape();
  vertex(33.0, 67.0);
  bezierVertex(46.0, 87.0, 38.0, 75.0, 33.0, 67.0);
  bezierVertex(28.0, 66.0, 22.0, 42.0, 41.0, 48.0);
  bezierVertex(65.0, 57.0, 74.0, 62.0, 81.0, 62.0);
  bezierVertex(88.0, 62.0, 92.0, 52.0, 108.0, 52.0);
  bezierVertex(124.0, 52.0, 140.0, 69.0, 134.0, 71.0);
  bezierVertex(128.0, 73.0, 87.0, 86.0, 77.0, 85.0);
  bezierVertex(67.0, 84.0, 42.0, 78.0, 34.0, 69.0);
  endShape();
  popMatrix();
}

void vaseFull3(float x, float y ) {
  //Half vase
  pushMatrix();
  translate(x, y);
  beginShape();
  vertex(47.0, 61.0);
  bezierVertex(72.0, 61.0, 47.0, 60.0, 47.0, 61.0);
  bezierVertex(47.0, 62.0, 58.0, 56.0, 69.0, 70.0);
  bezierVertex(80.0, 84.0, 83.0, 83.0, 88.0, 81.0);
  bezierVertex(93.0, 79.0, 94.0, 76.0, 105.0, 78.0);
  bezierVertex(116.0, 80.0, 115.0, 75.0, 119.0, 72.0);
  bezierVertex(123.0, 69.0, 134.0, 66.0, 136.0, 67.0);
  bezierVertex(138.0, 68.0, 132.0, 73.0, 127.0, 76.0);
  bezierVertex(122.0, 79.0, 115.0, 84.0, 103.0, 92.0);
  bezierVertex(91.0, 100.0, 92.0, 102.0, 93.0, 103.0);
  bezierVertex(94.0, 104.0, 99.0, 106.0, 101.0, 108.0);
  bezierVertex(103.0, 110.0, 60.0, 109.0, 54.0, 109.0);
  bezierVertex(48.0, 109.0, 54.0, 105.0, 60.0, 103.0);
  bezierVertex(66.0, 101.0, 44.0, 85.0, 38.0, 78.0);
  bezierVertex(32.0, 71.0, 28.0, 68.0, 28.0, 59.0);
  bezierVertex(28.0, 50.0, 38.0, 54.0, 48.0, 61.0);
  endShape();
  popMatrix();
}

void vaseHalf4(float x, float y ) {
  //Half vase
  pushMatrix();
  translate(x, y);
  beginShape();
  vertex(31.0, 71.0);
  bezierVertex(44, 91.0, 33.0, 75.0, 31.0, 71.0);
  bezierVertex(29.0, 67.0, 16.0, 55.0, 41.0, 52.0);
  bezierVertex(66.0, 49.0, 70.0, 55.0, 77.0, 53.0);
  bezierVertex(84.0, 51.0, 96.0, 49.0, 115.0, 56);
  bezierVertex(134.0, 63.0, 138.0, 65.0, 132, 71);
  bezierVertex(126.0, 77.0, 85.0, 90.0, 75, 89);
  bezierVertex(65.0, 88.0, 40.0, 80.0, 32.0, 71);
  endShape();
  popMatrix();
}

void vaseFull4(float x, float y ) {
  //Half vase
  pushMatrix();
  translate(x, y);
  beginShape();
  vertex(49.0, 66.0);
  bezierVertex(70.0, 60.0, 49.0, 66.0, 49.0, 66.0);
  bezierVertex(49.0, 66.0, 56.0, 73.0, 71.0, 68.0);
  bezierVertex(86.0, 63.0, 85.0, 59.0, 94.0, 57.0);
  bezierVertex(103.0, 55.0, 108.0, 67.0, 112.0, 70.0);
  bezierVertex(116.0, 73.0, 117.0, 72.0, 120.0, 70.0);
  bezierVertex(123.0, 68.0, 132.0, 65.0, 134.0, 66.0);
  bezierVertex(136.0, 67.0, 130.0, 72.0, 125.0, 75.0);
  bezierVertex(120.0, 78.0, 113, 83.0, 101.0, 91.0);
  bezierVertex(89.0, 99.0, 90.0, 101.0, 91.0, 102.0);
  bezierVertex(92.0, 103.0, 97.0, 105.0, 99.0, 107.0);
  bezierVertex(101.0, 109.0, 58.0, 108.0, 52.0, 108.0);
  bezierVertex(46.0, 108.0, 52.0, 104, 58.0, 102.0);
  bezierVertex(64.0, 100.0, 54.0, 94.0, 48.0, 87.0);
  bezierVertex(42.0, 80.0, 33.0, 77.0, 28.0, 66.0);
  bezierVertex(23.0, 55.0, 48.0, 65.0, 50.0, 66.0);
  endShape();
  popMatrix();
}

void vaseHalf5(float x, float y ) {
  //Half vase
  pushMatrix();
  translate(x, y);
  beginShape();
  vertex(52.0, 48.0);
  bezierVertex(65.0, 52.0, 60.0, 50.0, 52.0, 48.0);
  bezierVertex(44.0, 46.0, 39.0, 46.0, 30.0, 44.0);
  bezierVertex(21.0, 42.0, 7.0, 45.0, 26.0, 56.0);
  bezierVertex(45.0, 67.0, 61.0, 67.0, 65.0, 66.0);
  bezierVertex(69.0, 65.0, 98.0, 74.0, 113.0, 71.0);
  bezierVertex(128.0, 68.0, 153.0, 66.0, 146.0, 54.0);
  bezierVertex(139.0, 42.0, 122.0, 34.0, 106.0, 38.0);
  bezierVertex(90.0, 42.0, 82.0, 46.0, 75.0, 46.0);
  bezierVertex(68.0, 46.0, 61.0, 50.0, 53.0, 48.0);
  endShape();
  popMatrix();
}

void vaseFull5(float x, float y ) {
  //Half vase
  pushMatrix();
  translate(x, y);
  beginShape();
  vertex(44.0, 65.0);
  bezierVertex(44.0, 65.0, 37.0, 64.0, 44.0, 65.0);
  bezierVertex(51.0, 66.0, 56.0, 70.0, 59.0, 72.0);
  bezierVertex(62.0, 74.0, 62.0, 80.0, 58.0, 82.0);
  bezierVertex(54.0, 84.0, 49.0, 87.0, 59.0, 87.0);
  bezierVertex(69.0, 87.0, 96.0, 86.0, 101.0, 86.0);
  bezierVertex(106.0, 86.0, 95.0, 85.0, 94.0, 78.0);
  bezierVertex(93.0, 71.0, 111.0, 70.0, 120.0, 70.0);
  bezierVertex(129.0, 70.0, 138.0, 66.0, 139.0, 66.0);
  bezierVertex(140.0, 66.0, 134.0, 61.0, 124.0, 60.0);
  bezierVertex(114.0, 59.0, 106.0, 61.0, 98.0, 59.0);
  bezierVertex(90.0, 57.0, 83.0, 53.0, 80.0, 49.0);
  bezierVertex(77.0, 45.0, 70.0, 46.0, 65.0, 49.0);
  bezierVertex(60.0, 52.0, 63.0, 57.0, 56.0, 59.0);
  bezierVertex(49.0, 61.0, 38.0, 59.0, 36.0, 60.0);
  bezierVertex(34.0, 61.0, 39.0, 63.0, 42.0, 64.0);
  endShape();
  popMatrix();
}

void vaseHalf6(float x, float y ) {
  //Half vase
  pushMatrix();
  translate(x, y);
  beginShape();
  vertex(53.0, 49.0);
  bezierVertex(69.0, 55.0, 61.0, 51.0, 53.0, 49.0);
  bezierVertex(48.0, 49.0, 39.0, 46.0, 30.0, 44.0);
  bezierVertex(21.0, 42.0, 11.0, 48.0, 30.0, 59.0);
  bezierVertex(49.0, 70.0, 65.0, 70.0, 69.0, 69.0);
  bezierVertex(73.0, 68.0, 92.0, 70.0, 107.0, 67.0);
  bezierVertex(122.0, 64.0, 118.0, 64.0, 133.0, 51.0);
  bezierVertex(148.0, 38.0, 116.0, 39.0, 103.0, 44.0);
  bezierVertex(90.0, 49.0, 93.0, 24.0, 72.0, 23.0);
  bezierVertex(51.0, 22.0, 71.0, 48.0, 55.0, 48.0);
  endShape();
  popMatrix();
}

void vaseFull6(float x, float y ) {
  //Half vase
  pushMatrix();
  translate(x, y);
  beginShape();
  vertex(44.0, 65.0);
  bezierVertex(44.0, 65.0, 37.0, 64.0, 44.0, 65.0);
  bezierVertex(51.0, 66.0, 57.0, 74.0, 60.0, 76.0);
  bezierVertex(63.0, 78.0, 62.0, 80.0, 58.0, 82.0);
  bezierVertex(54.0, 84.0, 49.0, 87.0, 59.0, 87.0);
  bezierVertex(69.0, 87.0, 100.0, 88.0, 101.0, 86.0);
  bezierVertex(102.0, 84.0, 104.0, 86.0, 98.0, 82.0);
  bezierVertex(92.0, 78.0, 91.0, 82.0, 100.0, 76.0);
  bezierVertex(109.0, 70.0, 138.0, 52.0, 131.0, 53.0);
  bezierVertex(124.0, 54.0, 124.0, 56.0, 117.0, 58.0);
  bezierVertex(110.0, 60.0, 108.0, 61.0, 100.0, 59.0);
  bezierVertex(92.0, 57.0, 83.0, 53.0, 80.0, 49.0);
  bezierVertex(77.0, 45.0, 71.0, 44.0, 66.0, 47.0);
  bezierVertex(61.0, 50.0, 58.0, 55.0, 51.0, 57.0);
  bezierVertex(44.0, 59.0, 42.0, 59.0, 40.0, 60.0);
  bezierVertex(38.0, 61.0, 39.0, 63.0, 42.0, 64.0);
  endShape();
  popMatrix();
}

void vaseHalf7(float x, float y ) {
  //Half vase
  pushMatrix();
  translate(x, y);
  beginShape();
  vertex(55.0, 41.0);
  bezierVertex(71.0, 47.0, 63.0, 43.0, 55.0, 41.0);
  bezierVertex(50.0, 41.0, 30.0, 34.0, 21.0, 32.0);
  bezierVertex(23.0, 34.0, 13.0, 40.0, 32.0, 51.0);
  bezierVertex(51.0, 62.0, 67.0, 62.0, 71.0, 61.0);
  bezierVertex(75.0, 60.0, 87.0, 70.0, 102.0, 67.0);
  bezierVertex(117.0, 64.0, 140.0, 55.0, 127.0, 50.0);
  bezierVertex(114.0, 45.0, 115.0, 49.0, 102.0, 47.0);
  bezierVertex(89.0, 45.0, 92.0, 47.0, 82.0, 45.0);
  bezierVertex(72.0, 43.0, 57.0, 43.0, 55.0, 42.0);
  endShape();
  popMatrix();
}

void vaseFull7(float x, float y ) {
  //Half vase
  pushMatrix();
  translate(x, y);
  beginShape();
  vertex(44.0, 65.0);
  bezierVertex(44.0, 65.0, 44.0, 65.0, 44.0, 65.0);
  bezierVertex(44.0, 65.0, 57.0, 74.0, 60.0, 76.0);
  bezierVertex(63.0, 78.0, 62.0, 80.0, 58.0, 82.0);
  bezierVertex(54.0, 84.0, 49.0, 87.0, 59.0, 87.0);
  bezierVertex(69.0, 87.0, 100.0, 88.0, 101.0, 86.0);
  bezierVertex(102.0, 84.0, 104.0, 86.0, 98.0, 82.0);
  bezierVertex(92.0, 78.0, 91.0, 82.0, 100.0, 76.0);
  bezierVertex(109.0, 70.0, 138.0, 52.0, 131.0, 53.0);
  bezierVertex(124.0, 54.0, 124.0, 56.0, 117.0, 58.0);
  bezierVertex(110.0, 60.0, 107.0, 65.0, 93.0, 63.0);
  bezierVertex(79.0, 61.0, 88.0, 50.0, 80.0, 49.0);
  bezierVertex(72.0, 48.0, 63.0, 53.0, 55.0, 53.0);
  bezierVertex(47.0, 53.0, 28.0, 31.0, 21.0, 33.0);
  bezierVertex(14.0, 35.0, 27.0, 47.0, 31.0, 52.0);
  bezierVertex(35.0, 57.0, 43.0, 67.0, 43.0, 64.0);
  endShape();
  popMatrix();
}


void vaseHalf8(float x, float y ) {
  //Half vase
  pushMatrix();
  translate(x, y);
  beginShape();
  vertex(44.0, 42.0);
  bezierVertex(72.0, 43.0, 57.0, 36.0, 44.0, 42.0);
  bezierVertex(31.0, 48.0, 12.0, 76.0, 18.0, 78.0);
  bezierVertex(24.0, 80.0, 37.0, 61.0, 56.0, 72.0);
  bezierVertex(75.0, 83.0, 68.0, 58.0, 72.0, 57.0);
  bezierVertex(76.0, 56.0, 92.0, 55.0, 103.0, 63.0);
  bezierVertex(114.0, 71.0, 148.0, 82.0, 135.0, 77.0);
  bezierVertex(122.0, 72.0, 123.0, 32.0, 103.0, 28.0);
  bezierVertex(83.0, 24.0, 77.0, 30.0, 69.0, 36.0);
  bezierVertex(61.0, 42.0, 45.0, 40.0, 45.0, 41.0);
  endShape();
  popMatrix();
}

void vaseFull8(float x, float y ) {
  //Half vase
  pushMatrix();
  translate(x, y);
  beginShape();
  vertex(42.0, 71.0);
  bezierVertex(25.0, 68.0, 41.0, 72.0, 42.0, 71.0);
  bezierVertex(43.0, 70.0, 57.0, 74.0, 60.0, 76.0);
  bezierVertex(63.0, 78.0, 62.0, 80.0, 58.0, 82.0);
  bezierVertex(54.0, 84.0, 49.0, 87.0, 59.0, 87.0);
  bezierVertex(69.0, 87.0, 100.0, 88.0, 101.0, 86.0);
  bezierVertex(102.0, 84.0, 104.0, 86.0, 98.0, 82.0);
  bezierVertex(92.0, 78.0, 95.0, 77.0, 98.0, 75.0);
  bezierVertex(101.0, 73.0, 111.0, 72.0, 118.0, 75.0);
  bezierVertex(125.0, 78.0, 141.0, 81.0, 137.0, 79.0);
  bezierVertex(133.0, 77.0, 123.0, 68.0, 114.0, 64.0);
  bezierVertex(105.0, 60.0, 98.0, 50.0, 88.0, 47.0);
  bezierVertex(78.0, 44.0, 65.0, 43.0, 55.0, 53.0);
  bezierVertex(45.0, 63.0, 38.0, 64.0, 29.0, 67.0);
  bezierVertex(20.0, 70.0, 16.0, 79.0, 23.0, 76.0);
  bezierVertex(30.0, 73.0, 37.0, 72.0, 42.0, 71.0);
  endShape();
  popMatrix();
}
