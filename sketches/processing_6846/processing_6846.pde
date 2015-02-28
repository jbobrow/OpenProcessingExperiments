
float rx, rxp, ry, ryp, z = 0;
float v = 0;

void setup(){
  size(600, 600, P3D);
}

void draw(){
  background(0);

  if (mousePressed){
    z+=4;
  }
  else{
    z-=0.5;
  }
  z = constrain(z, 0, 200);
  
  translate(width/2, height/2, z);
  float rxp = ((mouseX-(width/2))*0.005);
  float ryp = ((mouseY-(height/2))*0.005);
  rx = (rx*0.95)+(rxp*0.1);
  ry = (ry*0.95)+(ryp*0.1);
  rotateY(rx);
  rotateX(ry);

  if (keyPressed){
    fill(0);
    noStroke();
    sphere(100);
  }
  stroke(255);
  for (int j = 0; j<2; j++){
    rotateY(60);
    for (int i = 0; i<360; i++){
      pushMatrix();
      rotateY(i);
      stroke(i, 0, 255);
      line(cos(i)*150, sin(i)*150, 0, cos(i)*100, sin(i)*100, 0);
      line(0, sin(i)*150, cos(i)*150, 0, sin(i)*100, cos(i)*100);
      popMatrix();
    }
  }
}





