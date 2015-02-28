
size(300, 300);
background(45, 15, 45);

for (int elSize=90;elSize>30;elSize-=10) {//sets parameter for ellipses
  for (int x=0;x<360;x+=5) {//sets for rotation angle
    pushMatrix();//moves the origin
    translate(width/2, height/2);
    fill(250, 0, 0);
    ellipse(0, 0, elSize, elSize);//makes central ellipse
    rotate(x);//transformations: rotates
    strokeWeight(3);
    stroke(255, 255, 0);
    fill(215, 0, 215);
    line(90, 30, 200, 200);//makes lightlines
    strokeWeight(1);
    ellipse(70, 0, elSize, 20);//makes petal
    popMatrix();
  }
}


