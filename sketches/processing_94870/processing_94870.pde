
int x = 0;
int dir = 1;
int r = 255;
int b = 0;
int temp;
int z = 0;

void setup(){
  size(600,600);
  background(0);
  noStroke();
  frameRate(10);
}

void draw(){
  z = (z + 2)%10;
  x = x+dir;
  background(0);
  eye_creepy(0+x,0);
  other_eye(0+x,0);
  other_eye2(0+x,0);
  eye3(0+x,0);
  eye4(0+x, 0);
  smile(0,0);
  eye5(0,0);
  eye6(0,0);
  eye7(0,0);
  eye8(0,0);
  eye9(0+x,0+x);
  eye10(0+x,0+x);
}

void mousePressed(){
  dir = 0 - dir;
  temp = r;
  r = b;
  b = temp;
}

void eye_creepy(int x, int y){
 fill(255);
 ellipse(0+x, 20+z, 100, 20);
 fill(0+r, b, 0);
 ellipse((0+x)+z, 20+z, 20, 20);
}

void other_eye2(int x, int y){
  fill(255);
  ellipse(400-x, (100+x)+z, 50, 40);
  fill(random(255), random(255), random(255));
  ellipse(400-x, 100+x, 20, 50);
}

void other_eye(int x, int y){
  fill(255);
  ellipse(200+x, (100+x)+z, 50, 40);
  fill(random(255), random(255), random(255));
  ellipse(200+x, 100+x, 20, 50);
}

void eye3(int x, int y){
  fill(255);
  ellipse(610-x, (125-x)+z, 30, 70);
  fill(0);
  ellipse(610-x, (130-x), 50, 20);
  fill(random(255), random(255), random(255));
  ellipse(610-x, (130-x), 10, 10);
}

void smile(int x, int y){
  fill(0+r, 0, b);
  quad(180, 281+z, 336, 360+z, 469, 263+z, 330, 476+z);
  triangle(180, 281+z, 220, 305+z, 200, 330+z);
  triangle(469, 263+z, 429, 300+z, 449, 320+z);
}

void eye4(int x, int y){
  fill(255);
  ellipse(102, (439-x)+z, 70, 30);
  fill(0);
  ellipse(102, (434-x)+z, 30, 30);
  fill(random(140,255), 0, 0);
  ellipse(102, (434-x)+z, 20, 20);
}

void eye5(int x, int y){
  fill(255);
  ellipse(440, 200+z, 100, 30);
  fill(0);
  ellipse(440, 200+z, 50, 30);
  fill(0, random(120,255), 0);
  ellipse(440, 200+z, 20, 30);
}

void eye6(int x, int y){
  fill(0, 0, random(120,255));
  ellipse(100, 200+z, 20, 30);
  fill(0);
  ellipse(100, 205+z, 10, 20);
}

void eye7(int x, int y){
  fill(random(120,255), 0, random(120,255));
  ellipse(440, 60+z, 10, 30);
}

void eye8(int x, int y){
  fill(0, random(0,255), random(120,255));
  ellipse(500, 500+z, 40, 20);
  fill(0);
  ellipse(500, 500+z, 20, 30);
}

void eye9(int x, int y){
  fill(random(0,255), random(0,255), 0);
  ellipse(300-x, (620+z)-x, 60, 30);
  fill(0);
  ellipse(300-x, (620-z)-x, 30, 30);
}

void eye10(int x, int y){
  fill(random(0,255), random(0,255), random(0,255));
  ellipse(10+x, (-20-z)+x, 20, 10);
  fill(0);
  ellipse(10+x, (-20+z)+x, 10, 10);
}



void info(){
  fill(random(50, 255));
  ellipse(random(0,600), random(0,600), random(0, 255), random(0, 255));

}

