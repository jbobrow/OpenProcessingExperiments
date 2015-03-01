
int leaves = 0;  
int leafMax = 200; 
void setup(){ 
  size(600,600); 
  smooth();
  noStroke();
  background(#C7F1FC); 
  frameRate (300); 
 
}
 
void draw (){ 
  fill(random(200,250),random(200),random(40)); 
 
  if (leaves < leafMax) { 
 
    float cx = 300 + random(-300,300); 
    float cy = 300 + random(-300,300); 
    
    translate(cx,cy);
    rotate(random(PI/5)); 
    scale(random(0.9,1.8)); 
    drawLeaf(); 
    leaves++; 
  }
 
}
 
 
void drawLeaf(){ 
  float pointShift = random(-20,20); 
  beginShape(); 
  vertex(20, 45); 
 
    bezierVertex(30,30, 60 + pointShift,40 + pointShift/2, 70 + pointShift,50); 
    bezierVertex(60 + pointShift,55, 30,65, 20,45); 
  endShape();
 
}
 
void mousePressed(){ 
  background(#C7F1FC); 
  leaves = 0; 
  leafMax = 1 + mouseY/3; 
 
}
  

