
float num;

void setup(){
  size(640, 640);
  stroke(0, 150, 255, 30); 
}

void draw(){
  background(0);
  translate(width/2, height/2);
  branch(180); 
}

void branch(int len){
  float t = map(len, 0, 180, 1, 10);
  float angle = sin(len+num) * t*10;
  strokeWeight(t);
  
  noFill();
  bezier(0, 0, len+angle, len+angle, len+angle, len+angle, 0, len);  
  bezier(0, 0, -len-angle, -len-angle, -len-angle, -len-angle, 0, -len);
  bezier(0, 0, len+angle, len+angle, len+angle, len+angle, len, 0);
  bezier(0, 0, -len-angle, -len-angle, -len-angle, -len-angle, -len, 0);
  
  fill(125);
  ellipse(0, len, t, t);
  ellipse(0, -len, t, t);
  ellipse(len, 0, t, t);
  ellipse(-len, 0, t, t);
  
  len *= 0.5;
  if(len > 15){
    pushMatrix();
    rotate(radians(45));
    branch(len);
    popMatrix();
    
    pushMatrix();
    rotate(radians(-45));
    branch(len);
    popMatrix();
    
    pushMatrix();
    rotate(radians(90));
    branch(len);
    popMatrix();
    
    pushMatrix();
    rotate(radians(-90));
    branch(len);
    popMatrix();
  }
  num += 0.001;
}


