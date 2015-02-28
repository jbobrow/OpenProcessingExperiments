
//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies


Maxim maxim;
AudioPlayer player;
AudioPlayer player2;
PFont myFont;
int brushNumber = 0;
boolean spacePressed = false;
float filler = 0;
int i = 0;




void setup()
{
  size(1024, 590);
  maxim = new Maxim(this);
  player = maxim.loadFile("atmos1.wav");
  player.setLooping(true);
  player2 = maxim.loadFile("bells.wav");
  player2.setLooping(true);
  player.volume(0.20);
  background(0);
  rectMode(CENTER);
  myFont = createFont("Arial", 16);
  textFont(myFont);
  textAlign(CENTER, CENTER);

}

void draw()
{
    noStroke();
    fill(0);
    rect(10,10,25,25);
  fill(map(mouseX, 0, width, 0, 255),map(mouseY, 0, height, 0, 255),dist(mouseX,mouseY,width/2,height/2));
  text(brushNumber+1, 10, 10+3*sin(i));
  i += 0.05;
  if (keyPressed && key == ' ' && !spacePressed) {
    brushNumber += 1;
    brushNumber = brushNumber % 20;
    spacePressed = true;

  }
  if (!keyPressed && spacePressed) {
    spacePressed = false;
  }
}

void mouseDragged()
{
  player.play();
  player2.play();
  float red = map(mouseX, 0, width, 0, 255);
  float green = map(mouseY, 0, height, 0, 255);
  float blue = dist(mouseX,mouseY,width/2,height/2);
  
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = map(speed, 0, 20, 0, 3);
  //println(alpha);
  float lineWidth = map(speed, 0, 10, 10, 1);
  lineWidth = constrain(lineWidth, 0, 10);
  //filler = 255 - 3.5*speed;
  //filler = constrain(filler, 0, 100);
  
  noStroke();
  fill(filler, alpha);
  rect(width/2, height/2, width, height);
  
  stroke(red, green, blue, 255);
  strokeWeight(lineWidth);
  
  if (brushNumber == 0) {
    rect(mouseX, mouseY, speed, speed);
  }
  if (brushNumber == 1) {
    line(pmouseX, pmouseY,mouseX, mouseY);
  }
  if (brushNumber == 2) {
    brush1(mouseX, mouseY,speed, speed,lineWidth);
  }
  if (brushNumber == 3) {
    brush2(mouseX, mouseY,speed, speed,lineWidth);
  }
  if (brushNumber == 4) {
    brush3(mouseX, mouseY,speed, speed,lineWidth);
  }
  if (brushNumber == 5) {
    brush4(pmouseX, pmouseY,mouseX, mouseY,lineWidth);
  }
  if (brushNumber == 6) {
    brush5(pmouseX, pmouseY,mouseX, mouseY,lineWidth);
  }
  if (brushNumber == 7) {
    brush6(mouseX, mouseY,speed, speed,lineWidth);
  }
  if (brushNumber == 8) {
    brush7(pmouseX, pmouseY,mouseX, mouseY,lineWidth);
  }
  if (brushNumber == 9) {
    brush8(pmouseX, pmouseY, mouseX, mouseY, lineWidth);
  }
  if (brushNumber == 10) {
    brush9(pmouseX, pmouseY, mouseX, mouseY, lineWidth);
  }
  if (brushNumber == 11) {
    brush10(pmouseX, pmouseY, mouseX, mouseY, lineWidth);
  }
  if (brushNumber == 12) {
    brush11(mouseX, mouseY, 0, 0, lineWidth);
  }
  if (brushNumber == 13) {
    brush12(mouseX, mouseY, speed, speed, lineWidth);
  }
  if (brushNumber == 14) {
    brush13(pmouseX, pmouseY, mouseX, mouseY, lineWidth);
  }
  if (brushNumber == 15) {
    brush14(pmouseX, pmouseY, mouseX, mouseY, lineWidth);
  }
  if (brushNumber == 16) {
    brush15(pmouseX, pmouseY, mouseX, mouseY, lineWidth);
  }
  if (brushNumber == 17) {
    brush16(pmouseX, pmouseY, mouseX, mouseY, lineWidth);
  }
  if (brushNumber == 18) {
    brush17(mouseX, mouseY, speed, speed, lineWidth);
  }
  if (brushNumber == 19) {
    brush18(mouseX, mouseY, speed, speed, lineWidth);
  }

  player.setFilter(map(mouseY,0,height,50,5000),10);
  player2.ramp(2.,1000);
  player2.speed((float) mouseX/width/2);
  player.ramp(1.,1000);
}

void mouseReleased()
{
  player.ramp(0.5,1000);
  player2.ramp(0.5,1000);
  delay(1000);
  player2.stop();
  player.stop();
}
//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies


void brush1(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  ellipse(x,y,px,py); 
  
  return;
}


void brush2(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  pushMatrix();
  translate(x,y);
  rotate(random(px));
  rect(0+random(50),0+random(50),10,10); 
  popMatrix();
  return;
}

void brush3(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  pushMatrix();
  translate(x,y);
  rotate(random(px));
  line(0+random(50),0+random(50),0,0);
  rotate(random(px));
  line(0+random(50),0+random(50),0,0);
  rotate(random(px));
  line(0+random(50),0+random(50),0,0);
  popMatrix();

  return;
}

void brush4(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  line(px,py,x,y);
  line(px,py,x,y);
  line(width/2+((width/2)-px),py,width/2+((width/2)-x),y);
  line(px,height/2+((height/2)-py),x,height/2+((height/2)-y));
  line(width/2+((width/2)-px),height/2+((height/2)-py),width/2+((width/2)-x),height/2+((height/2)-y));
  return;
}

void brush5(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  line(px,py,x,y);
  line(width/2+((width/2)-px),py,width/2+((width/2)-x),y);
  line(px,height/2+((height/2)-py),x,height/2+((height/2)-y));
  line(width/2+((width/2)-px),height/2+((height/2)-py),width/2+((width/2)-x),height/2+((height/2)-y));
  line(width/2+((width/2)-py),width/2-((width/2)-px),width/2+((width/2)-y),width/2-((width/2)-x));
  line(height/2-((height/2)-py),width/2-((width/2)-px),height/2-((height/2)-y),width/2-((width/2)-x));
  line(width/2+((width/2)-py),height/2+((height/2)-px),width/2+((width/2)-y),height/2+((height/2)-x));
  line(width/2-((width/2)-py),height/2+((height/2)-px),width/2-((width/2)-y),height/2+((height/2)-x));
  return;
}

void brush6(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  px=px+random(50);
  py=py+random(50);
  ellipse(x,y,px,py);
  ellipse(width/2+((width/2)-x),y,px,py);
  ellipse(x,height/2+((height/2)-y),px,py);
  ellipse(width/2+((width/2)-x),height/2+((height/2)-y),px,py);
  ellipse(width/2+((width/2)-y),width/2-((width/2)-x),px,py);
  ellipse(height/2-((height/2)-y),width/2-((width/2)-x),px,py);
  ellipse(width/2+((width/2)-y),height/2+((height/2)-x),px,py);
  ellipse(width/2-((width/2)-y),height/2+((height/2)-x),px,py);  
  return;
}

void brush7(int x,int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  line(px,py,x,y);
  line(width/2+((width/2)-px),py,width/2+((width/2)-x),y);
  return;
}

void brush8(int x, int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  line(px,py,x,y);
  line(width-px,height-py,width-x,height-y);
}

void brush9(int x, int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  line(px,py,x,y);
  line(width-px,height-py,width-x,height-y);
  line(width-py,height-px,width-y,height-x);
  line(py,px,y,x);
}

void brush10(int x, int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  line(px,py,x,y);
  line(width-px,height-py,width-x,height-y);
  line(width/2-py+height/2,px-width/2+height/2,width/2-y+height/2,x-width/2+height/2);
  line(py-height/2+width/2,height/2+width/2-px,y-height/2+width/2,height/2+width/2-x);
}

void brush11(int x, int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  line(px,py,x,y);
  line(width-px,height-py,width-x,height-y);
  line(width/2-py+height/2,px-width/2+height/2,width/2-y+height/2,x-width/2+height/2);
  line(py-height/2+width/2,height/2+width/2-px,y-height/2+width/2,height/2+width/2-x);
}

void brush12(int x, int y, int px, int py, int lineWidth) {
  strokeWeight(lineWidth);
  px=px+random(50);
  py=py+random(50);
  ellipse(x,y,px,py);
  ellipse(width-x,height-y,px,py);
  ellipse(width/2-y+height/2,x-width/2+height/2,px,py);
  ellipse(y-height/2+width/2,height/2+width/2-x,px,py);
}

void brush13(int px, int py, int x, int y, int lineWidth) {
  strokeWeight(lineWidth);
  y += py;
  line(px,py,px,y);
}

void brush14(int px, int py, int x, int y, int lineWidth) {
  strokeWeight(lineWidth);
  x += px;
  y += py;
  line(px,py,x,y);
}

void brush15(int px, int py, int x, int y, int lineWidth) {
  strokeWeight(lineWidth);
  px=x;
  py=y;
  line(px,py,x,y);
  line(width-px,height-py,width-x,height-y);
  line(width/2-py+height/2,px-width/2+height/2,width/2-y+height/2,x-width/2+height/2);
  line(py-height/2+width/2,height/2+width/2-px,y-height/2+width/2,height/2+width/2-x);
  line(cos(QUARTER_PI)*(px-width/2)-sin(QUARTER_PI)*(py-height/2)+width/2,sin(QUARTER_PI)*(px-width/2)+cos(QUARTER_PI)*(py-height/2)+height/2,cos(QUARTER_PI)*(x-width/2)-sin(QUARTER_PI)*(y-height/2)+width/2,sin(QUARTER_PI)*(x-width/2)+cos(QUARTER_PI)*(y-height/2)+height/2);
  line(cos(3*QUARTER_PI)*(px-width/2)-sin(3*QUARTER_PI)*(py-height/2)+width/2,sin(3*QUARTER_PI)*(px-width/2)+cos(3*QUARTER_PI)*(py-height/2)+height/2,cos(3*QUARTER_PI)*(x-width/2)-sin(3*QUARTER_PI)*(y-height/2)+width/2,sin(3*QUARTER_PI)*(x-width/2)+cos(3*QUARTER_PI)*(y-height/2)+height/2);
  line(cos(5*QUARTER_PI)*(px-width/2)-sin(5*QUARTER_PI)*(py-height/2)+width/2,sin(5*QUARTER_PI)*(px-width/2)+cos(5*QUARTER_PI)*(py-height/2)+height/2,cos(5*QUARTER_PI)*(x-width/2)-sin(5*QUARTER_PI)*(y-height/2)+width/2,sin(5*QUARTER_PI)*(x-width/2)+cos(5*QUARTER_PI)*(y-height/2)+height/2);
  line(cos(7*QUARTER_PI)*(px-width/2)-sin(7*QUARTER_PI)*(py-height/2)+width/2,sin(7*QUARTER_PI)*(px-width/2)+cos(7*QUARTER_PI)*(py-height/2)+height/2,cos(7*QUARTER_PI)*(x-width/2)-sin(7*QUARTER_PI)*(y-height/2)+width/2,sin(7*QUARTER_PI)*(x-width/2)+cos(7*QUARTER_PI)*(y-height/2)+height/2);
}

void brush16(int px, int py, int x, int y, int lineWidth) {
  strokeWeight(lineWidth);
  line(px,py,x,y);
  line(width-px,height-py,width-x,height-y);
  line(width/2-py+height/2,px-width/2+height/2,width/2-y+height/2,x-width/2+height/2);
  line(py-height/2+width/2,height/2+width/2-px,y-height/2+width/2,height/2+width/2-x);
  line(cos(QUARTER_PI)*(px-width/2)-sin(QUARTER_PI)*(py-height/2)+width/2,sin(QUARTER_PI)*(px-width/2)+cos(QUARTER_PI)*(py-height/2)+height/2,cos(QUARTER_PI)*(x-width/2)-sin(QUARTER_PI)*(y-height/2)+width/2,sin(QUARTER_PI)*(x-width/2)+cos(QUARTER_PI)*(y-height/2)+height/2);
  line(cos(3*QUARTER_PI)*(px-width/2)-sin(3*QUARTER_PI)*(py-height/2)+width/2,sin(3*QUARTER_PI)*(px-width/2)+cos(3*QUARTER_PI)*(py-height/2)+height/2,cos(3*QUARTER_PI)*(x-width/2)-sin(3*QUARTER_PI)*(y-height/2)+width/2,sin(3*QUARTER_PI)*(x-width/2)+cos(3*QUARTER_PI)*(y-height/2)+height/2);
  line(cos(5*QUARTER_PI)*(px-width/2)-sin(5*QUARTER_PI)*(py-height/2)+width/2,sin(5*QUARTER_PI)*(px-width/2)+cos(5*QUARTER_PI)*(py-height/2)+height/2,cos(5*QUARTER_PI)*(x-width/2)-sin(5*QUARTER_PI)*(y-height/2)+width/2,sin(5*QUARTER_PI)*(x-width/2)+cos(5*QUARTER_PI)*(y-height/2)+height/2);
  line(cos(7*QUARTER_PI)*(px-width/2)-sin(7*QUARTER_PI)*(py-height/2)+width/2,sin(7*QUARTER_PI)*(px-width/2)+cos(7*QUARTER_PI)*(py-height/2)+height/2,cos(7*QUARTER_PI)*(x-width/2)-sin(7*QUARTER_PI)*(y-height/2)+width/2,sin(7*QUARTER_PI)*(x-width/2)+cos(7*QUARTER_PI)*(y-height/2)+height/2);
}

void brush17(int px, int py, int x, int y, int lineWidth) {
  strokeWeight(lineWidth);
  x=x+random(50);
  y=x;
  ellipse(px,py,x,y);
  ellipse(width-px,height-py,x,y);
  ellipse(width/2-py+height/2,px-width/2+height/2,x,y);
  ellipse(py-height/2+width/2,height/2+width/2-px,x,y);
  ellipse(cos(QUARTER_PI)*(px-width/2)-sin(QUARTER_PI)*(py-height/2)+width/2,sin(QUARTER_PI)*(px-width/2)+cos(QUARTER_PI)*(py-height/2)+height/2,x,y);
  ellipse(cos(3*QUARTER_PI)*(px-width/2)-sin(3*QUARTER_PI)*(py-height/2)+width/2,sin(3*QUARTER_PI)*(px-width/2)+cos(3*QUARTER_PI)*(py-height/2)+height/2,x,y);
  ellipse(cos(5*QUARTER_PI)*(px-width/2)-sin(5*QUARTER_PI)*(py-height/2)+width/2,sin(5*QUARTER_PI)*(px-width/2)+cos(5*QUARTER_PI)*(py-height/2)+height/2,x,y);
  ellipse(cos(7*QUARTER_PI)*(px-width/2)-sin(7*QUARTER_PI)*(py-height/2)+width/2,sin(7*QUARTER_PI)*(px-width/2)+cos(7*QUARTER_PI)*(py-height/2)+height/2,x,y);
}

void brush18(int px, int py, int x, int y, int lineWidth) {
  strokeWeight(lineWidth);
  x=px+random(50);
  y=py+random(50);
  ellipse(px,py,x,y);
  ellipse(width-px,height-py,x,y);
  ellipse(width/2-py+height/2,px-width/2+height/2,x,y);
  ellipse(py-height/2+width/2,height/2+width/2-px,x,y);
  ellipse(cos(QUARTER_PI)*(px-width/2)-sin(QUARTER_PI)*(py-height/2)+width/2,sin(QUARTER_PI)*(px-width/2)+cos(QUARTER_PI)*(py-height/2)+height/2,x,y);
  ellipse(cos(3*QUARTER_PI)*(px-width/2)-sin(3*QUARTER_PI)*(py-height/2)+width/2,sin(3*QUARTER_PI)*(px-width/2)+cos(3*QUARTER_PI)*(py-height/2)+height/2,x,y);
  ellipse(cos(5*QUARTER_PI)*(px-width/2)-sin(5*QUARTER_PI)*(py-height/2)+width/2,sin(5*QUARTER_PI)*(px-width/2)+cos(5*QUARTER_PI)*(py-height/2)+height/2,x,y);
  ellipse(cos(7*QUARTER_PI)*(px-width/2)-sin(7*QUARTER_PI)*(py-height/2)+width/2,sin(7*QUARTER_PI)*(px-width/2)+cos(7*QUARTER_PI)*(py-height/2)+height/2,x,y);
}


