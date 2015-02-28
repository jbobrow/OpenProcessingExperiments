


void Blume (int x,int y){

  translate(x,y);
  fill(100*value,200,200);
  ellipse(0, 0, 16, 16);
  
  angle_rot = 0;
  fill(51);

  for(int i=0; i<10; i++) {
    pushMatrix();
    rotate(angle_rot + -45);
    fill(random(255),255,255,50);
    ellipse(-20, 0, diameter, diameter);
    popMatrix();
    angle_rot += PI*2/10;
  }

  diameter =34 * sin(angle)/2 +20;
  
  angle += 0.02;
  if (angle > TWO_PI) { angle = 0; }
}

