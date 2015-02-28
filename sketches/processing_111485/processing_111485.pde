
//HW5
//Yingri Guan
 
float wd, ht;
 
void setup(){
  size(400,400);
  smooth();
  wd = width/2;
  ht = height/2;
  background(255,0,0);   
}
    
void draw(){
  
    drawFace(mouseX, mouseY);
if (keyPressed) {
  if(key == ' '){
background(random(0,255),random(0,255),random(0,255));
}
}
}
   
  void drawFace(float x, float y){
  beginShape();
  //face
  fill(255,231,180);
  noStroke();
  ellipse( x, y, wd*0.9, ht);
  endShape();
  
  // glasses
  beginShape();
  stroke(0);
  strokeWeight(8);
  noFill();
  curveVertex ( x - wd * 0.14, y - ht * 0.08 );
  curveVertex ( x - wd * 0.10, y - ht * 0.05 );
  curveVertex ( x            , y);
  curveVertex ( x + wd * 0.10, y - ht * 0.05 );
  curveVertex ( x + wd * 0.14, y - ht * 0.08 );
  endShape();
    
  beginShape();
  stroke(0);
  strokeWeight(8);
  noFill();
  curveVertex ( x - wd * 0.10, y + ht * 0.10 );
  curveVertex ( x + wd * 0.10, y - ht * 0.05 );
    
  curveVertex ( x + wd * 0.20, y - ht * 0.09 );
  curveVertex ( x + wd * 0.40, y - ht * 0.09 );
  curveVertex ( x + wd * 0.50, y - ht * 0.05 );
  curveVertex ( x + wd * 0.52, y  );
  curveVertex ( x + wd * 0.50, y + ht * 0.08 );
  curveVertex ( x + wd * 0.48, y + ht * 0.13 );
  curveVertex ( x + wd * 0.46, y + ht * 0.14 );
  curveVertex ( x + wd * 0.44, y + ht * 0.15 );
  curveVertex ( x + wd * 0.35, y + ht * 0.15 );
  curveVertex ( x + wd * 0.30, y + ht * 0.14 );
  curveVertex ( x + wd * 0.18, y + ht * 0.10 );
    
  curveVertex ( x + wd * 0.10, y - ht * 0.05 );
  curveVertex ( x            , y - ht * 0.10 );
  endShape();
    
    
  beginShape();
  stroke(0);
  strokeWeight(8);
  noFill();
  curveVertex ( x + wd * 0.10, y + ht * 0.10 );
  curveVertex ( x - wd * 0.10, y - ht * 0.05 );
    
  curveVertex ( x - wd * 0.20, y - ht * 0.09 );
  curveVertex ( x - wd * 0.40, y - ht * 0.09 );
  curveVertex ( x - wd * 0.50, y - ht * 0.05 );
  curveVertex ( x - wd * 0.52, y  );
  curveVertex ( x - wd * 0.50, y + ht * 0.08 );
  curveVertex ( x - wd * 0.48, y + ht * 0.13 );
  curveVertex ( x - wd * 0.46, y + ht * 0.14 );
  curveVertex ( x - wd * 0.44, y + ht * 0.15 );
  curveVertex ( x - wd * 0.35, y + ht * 0.15 );
  curveVertex ( x - wd * 0.30, y + ht * 0.14 );
  curveVertex ( x - wd * 0.18, y + ht * 0.10 );
    
  curveVertex ( x - wd * 0.10, y - ht * 0.05 );
  curveVertex ( x            , y - ht * 0.10 );
  endShape();
  
  //beard
    
  beginShape();
  noStroke();
  fill(193, 187, 187);
  vertex(x-wd*0.40, y + ht*0.5);
  bezierVertex(x-wd*0.35, y+ht*0.10, x+wd*0.35, y+ht*0.10, x+wd*0.40, y+ht*0.50);
  bezierVertex(x+wd*0.35, y+ht*0.40, x-wd*0.35, y+ht*0.40, x-wd*0.40, y+ht*0.50);
  endShape();
}



