
//Adam Lastowka

int longness = 40000;
float drag = 0.01;
float f;
int[] sel = new int[30];
float avgx;
float avgy;
int[] vals = new int[200];
int abf;

follower[] goog = new follower[longness];

//PImage particleImage;
import processing.opengl.*;

void setup() {
  size(1200, 900, P3D);
  background(0, 0, 0);
  stroke(255, 255, 255);
  fill(255, 255, 255);
  //particleImage = loadImage("particle.png"); 
  for(int i = 0; i < longness; i++) {
    goog[i] = new follower();
  }
  colorMode(HSB);
  ortho(-width/2, width/2, -height/2, height/2, 0, 1000);
}
follower uno = new follower();
void draw() {
  background(0);
  for(int i = 0; i < longness; i++) {
    goog[i].render();
  }
  for(int i = 0; i < longness; i++) {
    avgx += goog[i].X;
    avgy += goog[i].Y;
  }
  avgx /= longness;
  avgy /= longness;
  vals[vals.length-1] = int(dist(mouseX, mouseY, avgx, avgy));
  for (int i = 0; i < vals.length - 1; i++) {
    vals[i] = vals[i + 1];
  }
  strokeWeight(1);
  colorMode(RGB);
  stroke(0, 200, 0, 200);
  line(mouseX, 0, mouseX, height);
  line(0, mouseY, width, mouseY);
  pushMatrix();
  translate(mouseX, mouseY, 0);
  rotateY(f/50);
  rotateX(f/50);
  rotateZ(f/50);
  noFill();
  sphere(100);
  rotateY(-f/25);
  rotateX(-f/25);
  rotateZ(-f/25);
  sphere(50);
  popMatrix();
  arc(mouseX, mouseY, 300, 300, f/20, (f+40)/20);
  arc(mouseX, mouseY, 300, 300, (f+PI/2*20+30)/20, (f+40+PI/2*20+30)/20);
  arc(mouseX, mouseY, 400, 400, -f/20+PI/2, (-f+40)/20+PI/2);
  arc(mouseX, mouseY, 400, 400, (-f+PI/2*20+30)/20+PI/2, (-f+40+PI/2*20+30)/20+PI/2);
  fill(0, 200, 0, 200);
  text("P[0]: " + mouseX, mouseX+170, mouseY-130);
  text("P[1]: " + mouseY, mouseX+170, mouseY-110);
  for(int i = 0; i < sel.length; i++) {
  if(random(100) > 97) {
    sel[i] = int(random(goog.length));
  }
  }
  noFill();
  stroke(255, 0, 0, 200);
  for(int i = 0; i < sel.length; i++) {
  noFill();
  ellipse(goog[sel[i]].X, goog[sel[i]].Y, 10, 10);
  fill(0, 200, 0, 200);
  text("EL" + sel[i] + ": [" + goog[sel[i]].X + ", " + goog[sel[i]].Y + "]", 5, i*18+10);
  fill(255, 0, 0, 200);
  text(sel[i], goog[sel[i]].X + 5, goog[sel[i]].Y + 5);
  }
  noFill();
  stroke(0, 200, 0, 200);
  for(int x = width/3; x > 0; x-= width/30) {
    line(x, height, x, height-height/3);
  }
  for(int y = height/3; y > 0; y-= height/30) {
    line(0, height-y, width/3, height-y);
  }
  ellipse(mouseX/3, mouseY/3+height/3*2, 10, 10);
  ellipse(mouseX/3, mouseY/3+height/3*2, 15, 15);
  stroke(255, 0, 0, 200);
  if(avgx > 0 && avgy > 0 && avgx < width && avgy < height) {
  ellipse(avgx/3, avgy/3+height/3*2, 10, 10);
  }
  for(int i = 0; i < sel.length; i++) {
    if(goog[sel[i]].X > 0 && goog[sel[i]].Y > 0 && goog[sel[i]].X < width && goog[sel[i]].Y < height) {
      point(goog[sel[i]].X/3, goog[sel[i]].Y/3+height/3*2);
    }
  }
  stroke(0, 200, 0, 200);
  line(width-vals.length*3, height-vals.length*2, width, height-vals.length*2);
  line(width-vals.length*3, height-vals.length*1.5, width, height-vals.length*1.5);
  line(width-vals.length*3, height-vals.length, width, height-vals.length);
  line(width-vals.length*3, height-vals.length*0.5, width, height-vals.length*0.5);
  
  line(width-vals.length*3, height, width-vals.length*3, height-400);
  line(width-vals.length*2, height, width-vals.length*2, height-400);
  line(width-vals.length*1, height, width-vals.length*1, height-400);
  line(width-vals.length*2.5, height, width-vals.length*2.5, height-400);
  line(width-vals.length*1.5, height, width-vals.length*1.5, height-400);
  line(width-vals.length*0.5, height, width-vals.length*0.5, height-400);
  fill(0, 200, 0, 200);
  text(abf, width-vals.length*3, height-vals.length*2-3);
  noFill();
  
  for(int i = vals.length-2; i > 0; i--) {
    if(vals[i] < 400&&vals[i-1] < 400) {
    line(width-i*3, height-vals[i], width-i*3+3, height-vals[i-1]);
    }
  }
  text("TGP: [" + avgx + ", " + avgy + "]", 5, height/3*1.9);
  strokeWeight(0.5);
  colorMode(HSB);
  noCursor();
  if(mousePressed) {
    f--;
  }else{
    f++;
  }
  abf++;
}
class follower {
float X;
float Y;
float Xv;
float Yv;
float px;
float py;

follower() {
  X = random(screen.width);
  Y = random(screen.height);
}
void render() {
   //stroke(sqrt(Xv*Xv+Yv*Yv)*5, 255, 200);
   stroke(0, 0, 255, 100);
   Xv = Xv + (10000 / dist(mouseX, mouseY, X, Y) * ((0.009 * (mouseX - X))) / 50);
   Yv = Yv + (10000 / dist(mouseX, mouseY, X, Y) * ((0.009 * (mouseY - Y))) / 50);
   X = X + Xv;
   Y = Y + Yv;
 if(mousePressed) {
   Xv = Xv / 1.05;
   Yv = Yv / 1.05;
 }
  //ellipse(X, Y, 5, 5);
  //image(particleImage, X, Y, 2, 2); 
  point(X, Y);
  //line(X, Y, px, py);
  px = X;
  py = Y;
}
}
void keyPressed() {
  saveFrame("output.png");
}

