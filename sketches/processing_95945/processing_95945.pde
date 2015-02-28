
float am, as, ah;
 float rx, rz;
 void setup() {
   size(1000, 800, P3D);
   noStroke();
   textSize(40);
   textAlign(CENTER);
 }
 void draw() {
   lights();
   background(100);
   if(mousePressed) {
     rx -= radians(mouseY - pmouseY);
     rz-=radians(mouseX-pmouseX);
   }
   as=(TWO_PI/60)*-second();
   am=(TWO_PI/60)*-minute();
    
    
    
    
    
   pushMatrix();
   translate(width/2, height/2);
   rotateX(rx);
   rotateY(rz+-HALF_PI);
   rotateZ(rz);
   fill(255);
   strokeWeight(0);
   segmasphere(250, 50, PI, TWO_PI);
   rotateX(HALF_PI);
   stroke(0);
   strokeWeight(7);
   for(int i = 0; i < 12; i++) {
     if(i != 3) {
     point(sin((TWO_PI/12)*i)*120, cos((TWO_PI/12)*i)*120, -5);
     }
   }
   stroke(255, 0, 0);
   point(120, 0);
   strokeWeight(13);
   stroke(0);
   fill(0);
   arc(0, 0, 200, 200, as, 0, PIE);
   translate(0, 0, -10);
   strokeWeight(10);
   fill(127.5);
   arc(0, 0, 170, 170, am, 0, PIE);
   translate(0, 0, -7);
   strokeWeight(5);
   fill(255);
   arc(0, 0, 145, 145, ah, 0, PIE);
   translate(0, 0, -7);
   fill(100, 0, 0);
   for(int i = 0; i < 100; i++) {
     pushMatrix();
     translate(0, 0, i);
   ellipse(0, 0, 120, 120);
   popMatrix();
   }
   rotate(HALF_PI);
   translate(0, 0, -1);
   fill(0, 255, 100);
         if(hour() < 13) {
   ah=(TWO_PI/12)*-hour();
   text("MA", 0, 0);
   }
    else {
     ah=(TWO_PI/12)*-(hour()-12);
     text("MP", 0, 0);
    }
popMatrix();
 }
   void segmasphere(float size, float renderdetail, float horizontal, float vertical) {
     horizontal/=2;
   float rho = size/2;
   float factor = TWO_PI/renderdetail;
   float x, y, z;
  for(float phi = 0.0; phi < horizontal; phi += factor) {
    beginShape(QUAD_STRIP);
    for(float theta = 0.0; theta < TWO_PI + vertical; theta += factor) {
      x = rho * sin(phi) * cos(theta);
      z = rho * sin(phi) * sin(theta);
      y = -rho * cos(phi);
       
      vertex(x, y, z);
       
      x = rho * sin(phi + factor) * cos(theta);
      z = rho * sin(phi + factor) * sin(theta);
      y = -rho * cos(phi + factor);
       
      vertex(x, y, z);
    }
    endShape(CLOSE);
  }
}
