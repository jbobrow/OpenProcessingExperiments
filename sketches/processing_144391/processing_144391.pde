
//plz sotisficate camera position!
import processing.opengl.*;
int yoko = 35;
int tate = 80;
int haji;
// yoko is col points, tate is row points
// haji is the right end point of col
int meshNum = yoko*tate;
PVector[] Pos;
float x, y;
float seed;
int spaceX, spaceY;

void setup() {
  size(500, 400, OPENGL);
  smooth();
  spaceX = 30;
  spaceY = 10;
  Pos = new PVector[meshNum];
  for (int i=0; i<meshNum; i++) {
    int row = floor(i/yoko);
    int col = i%yoko;
    x=col*spaceX;      //max (yoko-1)*spaceX
    y=row*spaceY;
    PVector p = new PVector();
    p.x=x;
    p.y=y;
    Pos[i] = p;
    if (row==0)println(Pos[i]);
  }
  haji=(yoko-1)*spaceX;
}
void draw() {
  background(0);
  rotateX(HALF_PI+radians(mouseX*.3));      //mouseXは要らない人もいるだろうし取っていいよこんなの
  translate(-width/2, mouseY*-3, -500);  //第二引数（高さ）いじると変わるよー
  beginShape(TRIANGLE_STRIP);        //べつにquad_stripでもいいけどこっちのが軽そうだから
  fill(230, 0, 0, 10);
  for (int i=0; i<meshNum; i++) {
    PVector p = Pos[i];
    float z = p.z + noise( (p.x + seed) * 0.005, (p.y + seed) * .003, (p.z+seed) * .001)* 600;
    /* --- 力業で強引に折り返しの線を消す
    （noStroke()にするとそのあとでsrokeとstrokeWeight直しても
    なぜかすべて消える--- */
    if (p.x==haji || p.x==0){
    stroke(0, 0);
    strokeWeight(.0001);
//    noStroke();
    }else{
      strokeWeight(.5);
      stroke(255);
    }
    vertex(p.x, p.y, z);
    vertex(p.x+.1, p.y, z);
  }
  endShape();
  seed++;
}

void mousePressed(){
  saveFrame("test.png");
}

