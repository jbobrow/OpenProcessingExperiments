
void setup(){
  size(800, 800, P3D); 
}

void draw(){
  background(0);
  lights();
  
  pushMatrix();
  rotateY(map(mouseX,0,width,0,PI));
  rotateX(map(mouseY,0,height,0,PI));
  
  for(int i = -500; i < width + 5000; i += 200){
    for(int j = 0; j < height; j +=200){
      for(int k = 0; k > -10000; k -=200){
        eachVert(i,j,k);
      }
    }  
  }
  
  popMatrix();
  
}

void eachVert(float x, float y, float z){
  pushMatrix();
  translate(x,y,z);
  
  beginShape();
  vertex(0,0,0);
  vertex(100,0,0);
  vertex(100,100,0);
  vertex(0,100,0);
  endShape();
  
  beginShape();
  vertex(0,0,0);
  vertex(0,0,-100);
  vertex(0,100,-100);
  vertex(0,100,0);
  endShape();
  
  beginShape();
  vertex(0,100,0);
  vertex(0,100,100);
  vertex(100,100,100);
  vertex(100,100,0);
  endShape();
  
  beginShape();
  vertex(0,100,0);
  vertex(0,100,-100);
  vertex(-100,100,-100);
  vertex(-100,100,0);
  endShape();
  
  beginShape();
  vertex(0,100,0);
  vertex(0,200,0);
  vertex(-100,200,0);
  vertex(-100,100,0);
  endShape();
  
  beginShape();
  vertex(0,100,0);
  vertex(0,200,0);
  vertex(0,200,100);
  vertex(0,100,100);
  endShape();
  
  beginShape();
  vertex(100,0,0);
  vertex(100,0,-100);
  vertex(100,100,-100);
  vertex(100,100,0);
  endShape();
  
  beginShape();
  vertex(100,100,0);
  vertex(100,200,0);
  vertex(100,200,100);
  vertex(100,100,100);
  endShape();
  
  beginShape();
  vertex(0,200,0);
  vertex(0,200,100);
  vertex(100,200,100);
  vertex(100,200,0);
  endShape();
  
  beginShape();
  vertex(0,200,0);
  vertex(0,200,-100);
  vertex(-100,200,-100);
  vertex(-100,200,0);
  endShape();
  
  beginShape();
  vertex(0,100,-100);
  vertex(0,200,-100);
  vertex(-100,200,-100);
  vertex(-100,100,-100);
  endShape();
  
  beginShape();
  vertex(0,0,-100);
  vertex(100,0,-100);
  vertex(100,100,-100);
  vertex(0,100,-100);
  endShape();
  
  
  popMatrix();
  
}  
  

