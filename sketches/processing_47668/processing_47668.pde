
void armDisplay(float shoulderX, float spinDir) {
//arm spin speed  
  if (technoTime) {
    spin = 1.5;
  } else {
    spin = 0.5;
  }
  
//BRIGHTNESS
  strokeWeight(20);
  stroke(0,0,200-light);
  
//ARM------left shoulder = torsoX-35, right shoulder = torsoX+35, clockwise=1, counterclockwise=-1
  pushMatrix();
  transX = shoulderX;
  transY = torsoY-80;
  translate(transX, transY);
  float r = atan2(mouseY-transY, mouseX-transX)*(spin*spinDir);
  rotate(r);  
  line(0, 0, 0, 100);
  if (technoTime) {
    glowSticks();
  }
  popMatrix();

//blinky LED tongue piercing....  
  if (technoTime) {
    noStroke();
    fill(random(0,255), random(0,255), random(0,255));
    if (mouseX<torsoX) {
      ellipse(torsoX+19, torsoY-160, 7,7);
    }else{
      ellipse(torsoX-12, torsoY-160,7,7);
    }
  }  
}


