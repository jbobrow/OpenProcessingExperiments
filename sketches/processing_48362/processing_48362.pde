
void drawStripes() {
  for (int i = 0; i < 100; i ++)
  {    
    fill(254, 180, 28);
    rect(0, 4*i, mouseY, 2);   
    fill(124, 156, 113);
    rect(mouseY, 4*i+2, width-mouseY, 2);
  }
}

void drawBearNose() {
  for (int i = 0; i<23; i ++)
  {
    fill(124, 156, 113);
    rect(150+i*2, 282+i*4, 100-i*4, 2);
  }
}

void drawMonkeyNose() {
  for (int i = 0; i < 10; i ++)
  {    
    fill(254, 180, 28);
    rect(150, 152+i*4, 8, 2);
    rect(250, 152+i*4, 8, 2);
  }
}

void drawEyes() {
  if (isOpen)
  {
    fill(255);
    ellipse(100, 100, 50, 50);
    ellipse(300, 100, 50, 50);
    fill(65, 97, 85);
    ellipse(100, 100, 30, 30);
    ellipse(300, 100, 30, 30);
    fill(1);
    ellipse(100, 100, 20, 20);
    ellipse(300, 100, 20, 20);
    fill(255);
    ellipse(110, 105, 7, 7);
    ellipse(310, 105, 7, 7);
    if (time==120) {
      isOpen=false;
    }
  }

  else { //blink
    fill(255);
    ellipse(100, 100, 50, 50);
    isOpen=true;
    time=0;
  }
}

void drawFace() {
  stroke(100);
  noFill();
  arc(200, 330, 400, 400, -PI, 0);
}

void sick() {
  for (int i = 0; i<ps.length; i++) {
    Ps p = ps[i];
    if (p!=null)
    {
      p.drawPs();
    }
  }
  if (mousePressed) {
    PS.rewind();
    PS.play();
    Ps newP = new Ps();
    newP.x = mouseX;
    newP.y = mouseY;
    ps[currentArrayIndex] = newP;
    currentArrayIndex++;
    if (currentArrayIndex == ps.length-1)
      currentArrayIndex = 0;
    times++;
  }
}

void dead() {
  if (times >= ps.length-1) {
    dying.play();
    fill(100);
    rect(0, 0, width, height);
    for (int i = 0; i<ps.length; i++) {
      noStroke();
      fill(0, 0, 20);
      rect(i*4, 0, 2, height);
      fill(255, 87, 85);
      ellipse(200, 400, width, 80);
      stroke(100);
      noFill();
      arc(200, 330, 400, 400, -PI, 0);
      stroke(255, 87, 85);
      line(85, 85, 115, 115);
      line(85, 115, 115, 85);
      line(285, 85, 315, 115);
      line(315, 85, 285, 115);
    }
  }
}


