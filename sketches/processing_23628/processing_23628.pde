
int leftEyeW = 220;
int rightEyeW = 420;
int leftEyeH = 188;
int rightEyeH = 175;
color bg = color(255, 255, 255);
color temp = color(1, 9, 9);
double dl;
double dr;
PImage front;

void setup() {
  size(640, 480);
  smooth();
  front = loadImage("lol.png");
}

void draw() {
  background(bg);
  image(front, 0, 0);
  if (mousePressed == true) {
    noStroke();
    background(temp);
  }
  

    noStroke();
    dl = dist (mouseX, mouseY, leftEyeW, leftEyeH)/random(5);
    float d = dist (mouseX, mouseY, leftEyeW, leftEyeH)/random(5);
    d= constrain(d,0,20);
    float a=atan2(mouseY-leftEyeH,mouseX-leftEyeW);
    float Lx=leftEyeW + cos(a)*d;
    float Ly= leftEyeH + sin(a)*d;
    fill(0);
    ellipse(Lx,Ly,34,34);
    strokeWeight(2);
    stroke(0,75);
    ellipse(Lx,Ly,22,22);

    noStroke();
    float dr= dist(mouseX,mouseY,rightEyeW,rightEyeH)/random(5);
    dr= constrain(d,0,20);
    float ar=atan2(mouseX-rightEyeH,mouseY-rightEyeW)/random(5);
    float Rx=rightEyeW + cos(ar)*d;
    float Ry= rightEyeH + sin(ar)*d;
    fill(0);
    ellipse(Rx,Ry,38,38);
    strokeWeight(2);
    stroke(0,75);
    ellipse(Rx,Ry,22,22);

}
    
  


