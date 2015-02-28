
float theta = radians(60);


void setup() {
  size(600,600);
  background(0);
  translate(width/2,height);
  
 branch(150);
  
}


void branch(float len) {
 // float a =(mouseX/(float)width);
  //theta =  radians(a);
  
  stroke(len,200,250);
  strokeWeight(len/10);
  //rotate(180);
  line(0,0,0,-len);
  translate(0,-len);
  rotate(theta*180);
 
  if (len > 2) { // no inf. loop

    pushMatrix();
    rotate(-theta);
    branch(len*.65);
    popMatrix();

    pushMatrix();
    rotate(theta/2);
    branch(len*.75);
    popMatrix();
    
     pushMatrix();
    rotate(20);
    stroke(len,200,200);
    branch(len*.50);
    popMatrix();
  }
}
