


float theta = 0;
void setup(){
  size(640,360,P3D);
  smooth();
  frameRate(30);
}

void draw() {
  background(0);
  stroke(255);

    //translate to center of window
    translate(width/2,height/2);
  
    //loop from 0 to 360 degrees
    for (float i=0;  i < TWO_PI; i+=0.2) {
    // push rotate and draw a line
    pushMatrix();
    rotateX(theta+i);
    for(float j = 0; j < PI; j+=0.5){
    
    rotateY(-theta-j);
    rotateZ(-theta-j);
    
    stroke(0,250,250,30);
    noFill();
    ellipse(0,0,250,250);
  }
   popMatrix();
   endShape();
  }
  theta+= 0.01;

}  

