
float theta = 0;

void setup() {
  size(400, 400);
  smooth();
}

void draw() {
  background(255, 247, 215);
  stroke(0);
  
  // center
  translate(width/2,height/2);
  
  // Loop from 0 to 360 degrees 
  for(float i = 0; i < TWO_PI; i += 0.1) {
    
    // first ring (pink)
 
    pushMatrix(); 
    translate(100,0);
    rotate(theta + i);
    stroke(249, 23, 126);
    line(0,0,100,0);
    popMatrix();
    
    //second ring (blue)
    
    pushMatrix();
    translate(-50, 50);
    rotate(-theta-i);
    stroke(127, 200, 219);
    line(0,0,50,0);
    popMatrix();
    
    //third ring (green)
    
    pushMatrix();
    translate(-175, -175);
    rotate(theta+i);
    stroke(175, 206, 169);
    line(0,0,200,0);
    popMatrix();
    
    //fourth ring (purple)
    
    pushMatrix();
    translate(-100, 200);
    rotate(-theta-i);
    stroke(148, 73, 232);
    line(0,0,95,0);
    popMatrix();
    
  }
  
  // Increment theta
  theta += 0.01;
  

}

