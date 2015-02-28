
void setup() {
  size(400, 400);
}
 
void draw() {
  background(52,109,116); 
  smooth();
 
  float ang1 =  0.5 * (noise(millis()/1000.0 - 0.5));
  float ang2 =  0.7 * (noise(millis()/1111.0) - 0.5);
  float ang3 =  1.2 * (noise(millis()/ 313.0) - 0.5);
  float ang4 =  1.5 * (noise(millis()/ 747.0) - 0.5);
  float ang5 =  1.7 * (noise(millis()/ 1943.0) - 0.5);
  float ang6 =  2.1 * (noise(millis()/ 592.0) - 0.5);
  float ang7 =  2.7 * (noise(millis()/ 1290.0) - 0.3); 
  
  fill(100);
  beginShape();
  vertex(0, 30);
  vertex(50, 50);
  vertex(30, 60);
  vertex(0, 65);
  endShape(CLOSE);
  
  pushMatrix();
  fill(234, 21, 21);
  translate(50,50); 
  rotate( ang2 );
  rect(0,0, 35,105); 
    
  pushMatrix();
  translate(35, 105);
  rotate(PI/4);
  pushMatrix();
  translate(95, -8);
  rotate(PI/4);
  rect(0, 0, 35,35);
  popMatrix();
  rect(0, 0, 95, 33);
  popMatrix();
  
  pushMatrix();
  translate(25, 90);
  rotate(PI/3);
  rect(0, 0, 30, 30);
  popMatrix();

////////////////////////
  pushMatrix();
  translate(90, 205);
  rotate(PI/8);
  rotate( ang4 );
  
  fill(0);
  pushMatrix();
  translate(30, 130);
  rotate( ang5 );
  rect(0, 0, 25, 100);
  popMatrix();
 
  pushMatrix();
  translate(0, 130);
  rotate( ang6 );
  rect(0, 0, 30, 100);
  popMatrix();

  fill(234, 21, 21);
  rect(0, 0, 52, 130);
  popMatrix();
////////////////////////

  translate(130, 160);
  rotate( ang1 );
  placeRubberStamp(0, 0, 255);

  translate(15,55);
  rotate( ang3 );
  pushMatrix();
  translate(27, 0);
  rotate(PI/4);
  rect(0, 0, 105, 35);
  
  pushMatrix();
  translate(100, 0);
  rotate(ang7);
  rect(0, 0, 85, 35);
  translate(0, -10);
  rotate(PI/4);
  rect(0, 0, 30, 30);
  popMatrix();
  
  popMatrix();
  rect(0,0, 40,40);
  popMatrix();
}




void placeRubberStamp(int px, int py, float howEvil) {
  // Please use a value between 0 and 255 for howEvil parameter
  int fillColor = int(howEvil);
  
  smooth();

  // Other Stuff!
  noStroke();
  fill(0, 0, 0);
  ellipse(px, py, 105, 105);

  fill(255, 255, 255);
  ellipse(px, py, 100, 100);

  fill(0, 0, 0);
  ellipse(px+ 1, py + 4, 97, 105);

  // The helmet red!
  fill(fillColor, 0, 0);
  beginShape();
  curveVertex(px, py - 48); 
  curveVertex(px, py - 48); 
  curveVertex(px - 5, py - 48);
  curveVertex(px - 15, py - 46);
  curveVertex(px - 35, py - 33);
  curveVertex(px - 47, py - 3);
  curveVertex(px - 40, py + 15);
  curveVertex(px, py);
  curveVertex(px- 4, py - 8);
  curveVertex(px - 2, py - 16);
  curveVertex(px - 15, py - 25);
  curveVertex(px - 15, py - 40);
  curveVertex(px, py - 48); 
  curveVertex(px, py - 48); 
  endShape();

  // The V shadow!
  fill(0);
  beginShape();
  curveVertex(px, py - 48); 
  curveVertex(px, py - 48); 
  curveVertex(px - 20, py - 20);
  curveVertex(px - 30, py + 8);
  curveVertex(px - 38, py + 8);
  curveVertex(px - 20, py - 35);
  curveVertex(px, py - 48); 
  curveVertex(px, py - 48); 
  endShape(CLOSE);
  
  // That beige strip!
  fill(211, 192, 160);
  stroke(0);
  beginShape();
  vertex(px - 5, py - 8);
  vertex(px - 40, py + 14);
  vertex(px - 50, py + 10);
  vertex(px - 49, py + 15);
  vertex(px - 46, py + 24);
  vertex(px - 38, py + 25);
  vertex(px - 37, py + 25);
  vertex(px + 4, py - 1);
  endShape(CLOSE);

  fill(100);
  beginShape();
  vertex(px - 20, py - 95);
  vertex(px - 30, py + 8);
  vertex(px - 38, py + 8);
  endShape(CLOSE);

  beginShape();
  vertex(px - 80, py - 75);
  vertex(px - 45, py + 8);
  vertex(px - 38, py + 8);
  endShape(CLOSE);

  // The gem!
  fill(211, 150, 51);
  translate(px - 38, py + 8);
  rotate(-PI / 16);
  ellipse(0, 0, 15, 25);
  fill(0);
  ellipse(2, 1, 10, 22);
  rotate(PI / 16);
  translate(-px + 37, -py - 10);

  // The eye!
  fill(255, 190, 0);
  noStroke();
  beginShape();
  curveVertex(px + 3, py + 8); 
  curveVertex(px + 3, py + 8); 
  curveVertex(px, py + 19);
  curveVertex(px - 13, py + 25);
  curveVertex(px - 21, py + 27); 
  curveVertex(px - 21, py + 27); 
  endShape(CLOSE);

  // That white line!
  noFill();
  stroke(255);
  arc(px + 10, py + 7, 30, 50, -PI/4, PI/2);
  line(px + 10, py + 32, px + 24, py + 52);
  line(px + 24, py + 52, px + 34, py + 46);

  // Face!
  stroke(0);
  strokeWeight(2);
  fill(250, 181, 149);
  beginShape();
  vertex(px - 33, py + 40);
  vertex(px - 33, py + 50);
  vertex(px - 25, py + 47);
  vertex(px - 17, py + 65);
  vertex(px + 6, py + 58);
  vertex(px + 1, py + 43);
  vertex(px + 3, py + 35);
  vertex(px + 1, py + 25);
  vertex(px - 9, py + 35);      
  endShape(CLOSE);

  noStroke();
  fill(0);
  beginShape();
  vertex(px - 33, py + 52);
  vertex(px - 20, py + 44);
  vertex(px - 24, py + 52);
  endShape();

  // Mouth
  fill(255);
  strokeWeight(1.5);
  stroke(0);
  beginShape();
  vertex(px - 22, py + 51);
  vertex(px - 20, py + 54);
  vertex(px - 10, py + 54);
  vertex(px - 13, py + 51);
  endShape(CLOSE);

  // beard!
  strokeWeight(1);
  fill(fillColor, 0, 0);
  beginShape();
  vertex(px - 20, py + 58);
  vertex(px - 21, py + 68);
  vertex(px - 3, py + 61);  
  vertex(px - 7, py + 60);
  vertex(px - 7, py + 58);
  vertex(px - 11, py + 61);
  vertex(px - 12, py + 59);
  vertex(px - 15, py + 62);
  vertex(px - 17, py + 59);
  vertex(px - 19, py + 61);
  endShape(CLOSE);
}

                
                
