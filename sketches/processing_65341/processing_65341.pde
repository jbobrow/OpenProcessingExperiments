

int a;
float b;

float depth = 500;
color boxFill;

float angleInc;

void setup() {
  size(400, 400, P3D);

  angleInc = PI/100.0;
 
 
}

void draw() {
  background(0);
  noStroke();
 
 
  translate(width/2, height/2, -depth);
  rotateY(frameCount * angleInc);
  rotateX(frameCount * angleInc);
  rotateZ(frameCount * angleInc);



 
for (b = random(10, 20); b <= random(30, 100); b++){


  
  for (float i = -100-b*2; i <= 100+b*2; i += 50) {
    pushMatrix();
    for (float j =-100-b*2; j <=100+b*2; j += 50) {
      pushMatrix();
      for (float k =-100-b*2; k <=100+b*2; k += 50) {
       
        
        boxFill = color(20, 0, abs(k), 80);
        pushMatrix();
        translate(k, j, i);
        fill(boxFill);
        box(b, b, b);
  

        popMatrix();
      }
      popMatrix();
    }
    popMatrix();
  }
}
  
  


}


