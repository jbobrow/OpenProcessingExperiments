
float xOff=0;
float yOff=0;
float rot=0;
float w=30;


void setup() {
  size(300, 300);
  rectMode(CENTER);
  //frameRate(2);
}

void draw() {
  //background(0,0,255);
  fill(0, 20);
  rect( width/2, height/2, width, height);
  //float x= random(50, width);
  //float y = random(height);

  pushMatrix (); 
  float nX = noise(xOff) * width;
  float nY = noise(yOff) * height;

  xOff += 0.008;
  yOff = yOff + 0.004;

  translate(nX, nY);

  fill(255);

  text("catch me", 40, 20);

  if (mouseX >= nX-w/2 && mouseX <= nX+w/2 && 
    mouseY >= nY-w/2 && mouseY <= nY+w/2) {
    text("yeeah", 40, 40);
    rotate (rot);
    rot+= 0.1;
    rect(0, 0, w, w);
  }
  else {
    rect(0, 0, w, w);
  }
  popMatrix();
}


//fill(255,0,0);
//ellipse(x,y,10,10);


boolean overCircle(float x, float y, int diameter) 
{
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } 
  else {
    return false;
  }
}


