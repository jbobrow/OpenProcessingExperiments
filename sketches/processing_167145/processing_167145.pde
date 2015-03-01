
float angle= 0.0;
int a= 150;

void setup(){
  size (600, 600);
  background (0);
stroke(255);
strokeWeight(4);
  line(a, 400, a*2, 450);
  line(a*2, 450, 450, 400);
}

void draw(){
  pushMatrix();
  translate(200, 200);
  rotate(angle);
  stroke(0);
  triangle(0, 0, 50, 50, -50, 50);
  angle +=0.1;
  popMatrix();
  
  pushMatrix();
  translate(400, 200);
  rotate(angle);
   triangle(0, 0, 50, 50, -50, 50);
  angle +=0.1;
  popMatrix();

ellipse(300, 300, 30, 30); 
}




