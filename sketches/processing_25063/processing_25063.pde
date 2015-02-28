
float x = 0;
float y = 0;
float xspeed = 2.2;
float yspeed = 1.5;
float bellyW = 120;
float bellyH = 150;
int eyeSize = 10;


void setup () {
  size(300,300);
  smooth();
}

void draw () {
  
  x = mouseX;
  y = mouseY;
  
  eyeSize = int(random(5,20));
  int r = int(random(0,255));
  int g = int(random(0,255));
  int b = int(random(0,255));
  background(200);
  triangle(x-18,y-70,x-20,y-100,x-10,y-70);
  triangle(x+18,y-70,x+20,y-100,x+10,y-70); //ears;
  fill(215,215,215);
  beginShape();
  vertex(x-30,y);
  vertex(x-75,y-30);
  vertex(x-100,y+10);
  vertex(x-80,y);
  vertex(x-100,y+50);
  endShape(CLOSE);
  fill(215,215,215);
  beginShape();
  vertex(x+30,y);
  vertex(x+75,y-30);
  vertex(x+100,y+10);
  vertex(x+80,y);
  vertex(x+100,y+50);
  endShape(CLOSE);
  fill(110,77,57);
  ellipse(x,y+50,bellyW,bellyH); //belly;
  ellipse(x,y-50,80,70); //head1;
  fill(110,77,57,50);
  ellipse(x,y-50,65,50); //head2;
  fill(17,17,17);
  ellipse(x-18,y-58,eyeSize,eyeSize);
  ellipse(x+18,y-58,eyeSize,eyeSize); //eyes;
  fill(83,71,55);
  ellipse(x,y-50,10,30); //nose;
  fill(r,g,b);
  ellipse(x,y+50,90,120); //belly2;
}







