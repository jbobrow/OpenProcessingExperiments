
int leaf = 0;  
int leafnum = 400; 

void setup(){
  size(600,600); 
   background(#FFE8F5);
  smooth();
  noStroke(); 
  frameRate (40); 
}
 
void draw (){
  fill(random(340,360),random(300),random(30),100); 
 
  if (leaf < leafnum) { 
 
    float cx = 300 + random(-180,180); 
    float cy = 300 + random(-60,60); 
 
    translate(cy,cx); 
    rotate(random(TWO_PI)); 
    drawLeaf(); 
    leaf++; 
  }
 
}
 
 
void drawLeaf(){ 
 
  float p = random(-20,20);
  beginShape(); 
  vertex(20, 25); 
  
    bezierVertex(30,30, 60 + p,50 + p/2, 70 + p,50); 
    bezierVertex(80 + p,55, 30,65, 20,45); 
  endShape();
 
}
