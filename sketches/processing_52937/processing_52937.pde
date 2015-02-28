
int dis = 0;
int mv = 0;
int f = 30;
int mx = 0;
int my = 0;
int disx = 0;
int mxc = 0;
int myc = 0;
float r, g, b;
void setup() {
  size(1000, 700);
  frameRate(30);
}
void draw() {
  background(70);
  fill(r, g, b);
  rect(disx + mx - 25, dis + my - 25, 50, 50);
  if (mousePressed){
    dis = 0;
    disx = 0;
    mv = 0;
    mxc = mouseX - mx;
    myc = mouseY - my;
    f = myc / 5;
    line(mx, my, mouseX, mouseY);
  }
  else{
    disx = disx - (mxc / 5);
  mv = mv + 2;
  dis = dis + mv - f;
}
}
void mousePressed(){
  dis = 0;
  mv = 0;
  mx = mouseX;
  my = mouseY; 
  r = random(0, 255);
  g = random(0, 255);
  b = random(0, 255); 
 }

