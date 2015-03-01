
float a;
float theta =random(0, 6.289);   //rotate by 360 degree

void setup() {
  size(600, 600);
  frameRate(80);
  }

void draw() {
  translate(width/2, height/2);
  background(0);
  stroke(8,68,198,50);
  theta=theta+0.007;
  
  branch(130);
  rotate(PI/2);
  branch(130);
}

void branch(float h) {
  h = h *0.7;
  if (h > 27) { 
    
    pushMatrix();    
    rotate(theta);  
    line(0, 0, 0, -h);  
    translate(0, -h); 
    branch(h);     
    popMatrix();  
    
    pushMatrix();
    rotate(-theta);
    stroke(12,237,247,30);
    fill(255);
    ellipse(0,0,5,5);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    
    pushMatrix();
//  rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
    
    pushMatrix();    
    rotate(theta);   
    line(0, 0, 0, h);  
    translate(0, h); 
    branch(h);     
    popMatrix();  
    
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, h);
    translate(0, h);
    branch(h);
    popMatrix();
    
    pushMatrix();
//  rotate(-theta);
    line(0, 0, 0, h);
    translate(0, h);
    branch(h);
    popMatrix();
  }
}


