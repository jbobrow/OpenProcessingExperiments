
float theta = 0;
void setup() {
  size(400, 400,P3D);
  smooth();
  
}

void draw() {
  background(0);
  stroke(255);
  fractal(30,30);
  

}
 
void fractal(float x, float y) {
  translate(width/2,height/2);
   //rotateY(theta);
  for (float i=0; i <TWO_PI; i+=0.35) {
    
    pushMatrix();
    
    rotate(theta+i);
    
    noStroke();
    fill(0,255,200,100);
    
    /*beginShape();
    vertex(0,0);
    vertex(0,y);
    vertex(x+x/2,0);
    
    endShape();
    */
    
    for (float j=0; j<PI; j+=0.7) {
      pushMatrix();
      translate(x*2,0);
      rotate(-theta-j);
      stroke(i*100,j*100,(i+j));
      noStroke();
      fill(0,150,200,100);
      beginShape();
      vertex(100,0);
      vertex(0,y);
      vertex(x+x/2,0);
      endShape();
      popMatrix();
    }

    popMatrix();
  }
  endShape();
 theta+=0.01;

} 


