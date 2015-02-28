
//頂点の座標(3次元空間上)
PVector p0;
PVector p1;
PVector p2;
PVector p3;

//頂点のZ座標(奥行き方向)
int pZ = 0;

//辺の長さ
int  l = 400;

void setup(){
  size(600,600);
  
  //頂点の座標値を設定
  p0 = new PVector(-l/2,-l/2,pZ);
  p1 = new PVector(l/2,-l/2,pZ);
  p2 = new PVector(l/2,l/2,pZ);
  p3 = new PVector(-l/2,l/2,pZ);
  
}

void draw(){
  smooth();
  background(255,255,255);
  stroke(60);
  noFill();
  
  //描画基準位置を中心に移動
  translate(width/2,height/2);
  
  //四角形を描く
  beginShape(QUADS);
  vertex(p0.x,p0.y);
  vertex(p1.x,p1.y);
  vertex(p2.x,p2.y);
  vertex(p3.x,p3.y);
  endShape();
}
