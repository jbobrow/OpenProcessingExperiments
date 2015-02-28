
float branchAngle; 
 
void setup(){  
  size(500,500, P3D);  
  branchAngle = 20; 
}  
 
void draw(){  
    translate(250,300);  
    rotateY(radians(map(mouseX, 0, width, 0, 360))); 
    rotateX(radians(map(mouseY, 0, height, 0, 90))); 
    drawTree();  
    if (mousePressed=true) { 
      branchAngle--; 
    } 
}  
 
void drawTree(){  
  background(#009ACD);  
  int depth = 10;  
  strokeWeight(depth/2.0);  
  stroke(#6B4226);  
  line(0,100,0,0);  
  branch(depth);  
}  
 
 
void branch(int depth){  
  pushMatrix();                    // store the old state  
  rotateX(radians(branchAngle)); 
  rotateZ(radians(branchAngle)); 
  subBranch(depth);                // and draw one branch  
  popMatrix();                     // go back to old state  
  rotateX(radians(-branchAngle)); 
  rotateZ(radians(-branchAngle)); 
  subBranch(depth);                // and draw another branch  
}  
     
void subBranch(int depth) {  
  scale(0.8);  
  int len = 50;  
  translate(0,-len);  
  strokeWeight(depth/2.0);  
  line(0,len,0,0);  
  fill (#458B00)
;  
  if(depth == 0) { 
    ellipse(0,0,70,80); 
  }  
  if(depth > 0) branch(depth-1);  
}  
 
 


