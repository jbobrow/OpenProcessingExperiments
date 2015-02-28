

int sphererad = 100;
boolean strok = false;
float deltaxpos, deltaypos, xpos, ypos;
void setup(){
  size(800,800);
  noStroke();
  frameRate(20);
  background(0, 0, 255);
  colorMode(HSB, 100);
  xpos = width/2;
  ypos = height/2;
}
void draw(){
  //background(0, 0, 255);
  fill((mouseX*100)/width, 100 - (mouseY*50)/height, 100);
  deltaxpos = random(-2, 2);
  deltaypos = random(-2, 2);
  xpos += deltaxpos;
  ypos += deltaypos;
  xpos += random(-50, 50);
  ypos += random(-50, 50);
  if(xpos > width + sphererad)
    xpos = -sphererad;
  else if(xpos < -sphererad)
    xpos = width + sphererad;
  if(ypos > height + sphererad)
    ypos = -sphererad;
  else if(ypos < -sphererad)
    ypos = height + sphererad;
  translate(xpos, ypos);
  
  for(int i = 0; i < (int)random(50, 200); i++){
    rotate((HALF_PI/random(-120, 120)));
    translate(deltaxpos, deltaypos);
    ellipse(0, 0, sphererad, sphererad);
  }
}
void mousePressed(){
    if(strok)
      noStroke();
    else stroke(0);
    strok = !strok;
  }

