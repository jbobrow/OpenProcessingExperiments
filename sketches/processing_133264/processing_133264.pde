
color start=color(#55C8FF);
color finish;
float amt = 0.0;
float a=0.0;
float b=0;

void setup() {
  size (800, 400); 
  background (#012F7C);
  frameRate(40);
}

void draw() {

translate(width/1.2, height/6); 
  for (float j=0; j<40; j=j+1) {
      pushMatrix();
      for(float i=0; i<90; i=i+1) {
      float myAngle= random(-20, 20);
      rotate(radians(myAngle)); 
      float ellipseSize = map(i, 10, 5, 20, 10); 
      fill(random(85,20),random(120,200),random(255,220));
      stroke(#015C89);
      ellipse(0,0, ellipseSize, ellipseSize);
      translate(0,10); 
      }
      popMatrix();   
      } 
      
      float zoom = map(mouseX, 0, width, 0.1, 4.5);
      scale(zoom);
      
      translate(-680, -120);
      stroke (255, 250,255, 60);
      for  (int x=0; x<800; x++) {
      line (x+15, 0, x, random(height/2));
      
    
}

}


 


