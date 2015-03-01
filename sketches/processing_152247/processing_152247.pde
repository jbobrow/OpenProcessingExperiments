
int z = 0 ;
float x = 1 ;
PFont font;
void setup()
{
  size(250,250);
  noStroke();
  font = createFont("Ariel-Black",100);
}

void draw()
{
  background(0,0,z);
  translate(width/2,height/2);
  fill(150);
  ellipse(0,0,100,100);
  fill(x*100+100);
  textFont(font,25);
  text("Change colour",-83,110);
  if (overCircle(100,100,100)){
      fill(x*100+100);
      if (x < 1.5){x = x + 0.05;}
      scale(x);
      ellipse(0,0,100,100);
      fill(30);
  }
  else{x=1;}
}

void mousePressed()
{
  if (overCircle(100,100,100)){
  if(z < 255){z = z + 40;}else{z = 0;}
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
