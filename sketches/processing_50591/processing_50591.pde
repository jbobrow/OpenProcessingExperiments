
//Melanie Danver
//copyright 2012 mdanver
//HW 4
float col2, col3, col4, pointx, pointy,dix,minu;

void setup()
{
  background(255);
  smooth();
  size(400, 400);
  col2 = random(255);
  col3 = random(255);
  col4 = random(255);
  pointx = random(width);
  pointy = random(height);
  dix = 20;
  minu = random(0,50);
}

void draw()
{
  noStroke();
  fill(255, 255, 255, 3);
  rect(0, 0, width, height);
}
void keyPressed()
{
  if (key == 'c') {
    fill(random(255),random(255),random(255));

    ellipse(random(width), random(height), 10, 10);
    ellipse(random(width), random(height), 10, 10);
     ellipse(random(width), random(height), 10, 10);
     
    ellipse(mouseX-(random(-100,100)), mouseY-(random(-100,100)),20, 20); 
    dix = 20;
  }
  if (key == 'r')
  {fill(255);
    rect(0, 0,50,dix);
    dix = dix +10;
    rect(50,0,50,-20+dix);
    rect(100,0,50,-40+dix);
    rect(150,0,50,-60+dix);
    rect(200,0,50,-80+dix);
    rect(250,0,50,-100+dix);
    rect(300,0,50,-120+dix);
    rect(350,0,50,-140+dix);
  }
  
}
void mouseDragged()
{
  
  strokeWeight(5);
  stroke(col2, col3, col4);
  line(0, 0, mouseX-minu, mouseY-minu);
  line(0,height, mouseX-minu,mouseY+minu);
  line(width,0,mouseX+minu,mouseY-minu);
  line(width,height,mouseX+minu,mouseY+minu);
  fill(col3,col2,col4);
  stroke(col3,col2,col4);
  ellipse(mouseX,mouseY, minu*3,minu*3);
  dix = 20;
}

void mouseReleased()
{
  col2 = random(255);
  col3 = random(255);
  col4 = random(255);
  pointx = random(width);
  pointy = random(height);
 minu = random(0,50);
}


