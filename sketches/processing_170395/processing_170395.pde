
int angle;

void setup(){
  size(500,500,P3D);
  angle=0;
}

void draw(){
  background(0);
  
  angle += 1;
  if(angle > 360){
    angle = 0;
  }
  
  noStroke();
  
  //ambientLight(20, 20, 20);
  //lightSpecular(255, 255, 255);
  //directionalLight(102, 102, 102, 0, 1, -1);
  //specular(255, 255, 255); 
  //shininess(5.0);

  fill(0, 25+mouseX, 50+mouseY);
  
  translate(width/2,height/2);
  rotateY(radians(angle));
  rotateY(radians(mouseX));
  rotateX(radians(mouseY));
  
  scale(0.5);
  
  beginShape();
  vertex(-50, 300, -200);
  vertex(50,  300, -200);
  vertex(150, 300, -150);
  vertex(200, 300, -50);
  vertex(200, 300, 50);  
  vertex(150, 300, 150);
  vertex(50, 300, 200);
  vertex(-50, 300, 200);
  vertex(-150, 300, 150);
  vertex(-200, 300, 50);
  vertex(-200, 300, -50);
  vertex(-150, 300, -150);
  endShape();
  
  beginShape(TRIANGLES);
  vertex(-50, 300, -200);
  vertex(50, 300, -200);
  vertex(0, -400, 0);
  
  vertex(50, 300, -200);
  vertex(150, 300, -150);
  vertex(0, -400, 0);
  
  vertex(150, 300, -150);
  vertex(200, 300, -50);
  vertex(0, -400, 0);
  
  vertex(200, 300, -50);
  vertex(200, 300, 50);
  vertex(0, -400, 0);
  
  vertex(200, 300, 50);
  vertex(150, 300, 150);
  vertex(0, -400, 0);
  
  vertex(150, 300, 150);
  vertex(50, 300, 200);
  vertex(0, -400, 0);
  
  vertex(50, 300, 200);
  vertex(-50, 300, 200);
  vertex(0, -400, 0);
  
  vertex(-50, 300, 200);
  vertex(-150, 300, 150);
  vertex(0, -400, 0);
  
  vertex(-150, 300, 150);
  vertex(-200, 300, 50);
  vertex(0, -400, 0);
  
  vertex(-200, 300, 50);
  vertex(-200, 300, -50);
  vertex(0, -400, 0);
  
  vertex(-200, 300, -50);
  vertex(-150, 300, -150);
  vertex(0, -400, 0);
  
  vertex(-150, 300, -150);
  vertex(-50, 300, -200);
  vertex(0, -400, 0);
  
  endShape();
}


