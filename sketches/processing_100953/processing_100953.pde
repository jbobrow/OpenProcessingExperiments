
void drawLeftEye(float x, float y) {
  //いまx=96,y=45です
 fill(255); ellipse(x-3.5,y,35,35);
 fill(0); ellipse(x,y,8,8);
}

void drawRightEye(float x, float y) {
  //いまx=124,y=45です
 fill(255); ellipse(x+3.5,y,35,35);
 fill(0); ellipse(x,y,8,8);
}

//関数化フクロウ,マウス対応
void drawOwl(int mx, int my) {
  pushMatrix();
   translate(mx,my);
   // 過去の中心座標はx=110,y=59だった！
   // 暗算してもいいが、わかりやすさのために残しておきます
    //胴体
    stroke(0); fill(0);
    ellipse(0,45-59,70,70);   ellipse(0,70-59,70,70);
    rect(75-110,45-59,70,30); 
    noStroke(); fill(255);
    arc(0,45-59,70,70,0,PI);//あご
    drawLeftEye(96-110,45-59);
    drawRightEye(124-110,45-59);
    fill(0);
    quad(0,-7, 4,0, 0,7, -4,0);
  popMatrix();
} 
void setup() {
  size(400,400);
  smooth();
}
void draw() {
 background(230);
 //フクロウの幅は70pixels
 drawOwl((int)map(second(),0,59,0,width),height/2);
 println("map()="+(int)map(second(),0,59,0,width));
}
