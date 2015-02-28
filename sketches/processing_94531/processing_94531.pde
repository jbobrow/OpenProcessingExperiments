
float moveX;
float moveY;
float direction;

void setup() {
  size(600,600);
  background(255);
  noFill();
  smooth();
  moveX = 1;
  moveY = 1;
  direction = 1;
}

void draw() {
   //background
   for (int x = 0; x < 1300; x++) {
     float n = norm(x, 0, 1300);
     float val = pow(n, 4) * 255;
     stroke(255 - val);
     ellipse(width/2, height/2, x, x);

   }
      
   //curtain
   if(mousePressed) {
   for(int x = 10; x < 1500; x += 3) {
     float n = map(x, 0, 1000, 0, 5);
     float p = pow(n, 5);
     
     pushMatrix();
     translate(-270,-300);
     
     stroke(189, 43, 166);
     strokeWeight(n/30);
     
     beginShape();
     vertex(width-x+mouseX+random(-5,5), p+mouseY+random(-5,5));
     bezierVertex(n+mouseX+random(-15,5),p+mouseY+random(-5,10),600-x+mouseX+random(-15,5),600-n+mouseY+random(-10,10),x*3+mouseX+random(-5,15),height+mouseY+random(-15,15));
     
     endShape();
     popMatrix();
   }
   }
}
