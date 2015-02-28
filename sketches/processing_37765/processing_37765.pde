
size(300, 300);
background(255, 0, 0);

for (int countX=0;countX<width/50;countX++) {
  for (int countY=0;countY<width/50;countY++) {
    for (int rectSize=50;rectSize>5;rectSize-=5) {//sets parameter for rectangles
      for (int elSize=60;elSize>10;elSize-=10) {//sets parameter for ellipses
        rectMode(CENTER);
        stroke(255);//sets stroke color for rectangles
        fill(255,0,0);
        rect(25+(countX*50), 25, rectSize, rectSize);//makes horisontal rectangle pattern
        rect(25, 25+(countY*50), rectSize, rectSize);//makes vertical rectangular pattern
        fill(RGB,0, 150, 10);
        noStroke();
        ellipse(width/2+(countX*60), height/2+(countY*60), elSize, elSize);//makes ellipse grid pattern
      }
    }
  }
}


