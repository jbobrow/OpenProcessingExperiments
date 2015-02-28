
//頂点の座標(3次元空間上)
PVector p0;
PVector p1;
PVector p2;
PVector p3;

//投影された頂点の座標(2次元平面上)
PVector pp0;
PVector pp1;
PVector pp2;
PVector pp3;

//正方形のZ座標
int pZ = 2000;
//投影するスクリーンのZ座標
int sZ = 1500;

//正方形の辺の長さ
int  l = 400;

//回転角度
float t;

//法線ベクトルのZ成分
float nZ;

void setup(){
  size(600,600);
  
  //頂点の座標値を初期化
  p0 = new PVector(-l/2,-l/2,pZ);
  p1 = new PVector(l/2,-l/2,pZ);
  p2 = new PVector(l/2,l/2,pZ);
  p3 = new PVector(-l/2,l/2,pZ);

  pp0 = new PVector(0,0,0);
  pp1 = new PVector(0,0,0);
  pp2 = new PVector(0,0,0);
  pp3 = new PVector(0,0,0);
  
}

void draw(){
  smooth();
  background(255,255,255);
  stroke(60);
  
  //描画基準位置を中心に移動
  translate(width/2,height/2);

  //回転によって移動する頂点の座標を計算
  //X座標を計算
  p0.x = -l/2 * cos(t);
  p1.x = l/2 * cos(t);
  p2.x = l/2 * cos(t);
  p3.x = -l/2 * cos(t);
  //Z座標を計算
  p0.z = pZ - l/2 * sin(t);
  p1.z = pZ + l/2 * sin(t);
  p2.z = pZ + l/2 * sin(t);
  p3.z = pZ - l/2 * sin(t);

  //スクリーン上に投影した頂点の座標値を計算
  //X座標を計算
  pp0.x = p0.x * (float)sZ / p0.z;
  pp1.x = p1.x * (float)sZ / p1.z;
  pp2.x = p2.x * (float)sZ / p2.z;
  pp3.x = p3.x * (float)sZ / p3.z;
  //Z座標を計算
  pp0.y = p0.y * (float)sZ / p0.z;
  pp1.y = p1.y * (float)sZ / p1.z;
  pp2.y = p2.y * (float)sZ / p2.z;
  pp3.y = p3.y * (float)sZ / p3.z;
  
  //法線ベクトルのZ成分を計算
  nZ = (p1.x - p0.x) * (p3.y - p0.y) - (p3.x - p0.x) * (p1.y - p0.y);
  //法線ベクトルのZ成分によって面の向きを判断し、どちらの面が表示されているかによって色を変える
  if(nZ > 0) fill(200);
  else fill(50);

  //四角形を描く(投影された座標値を使用)  
  beginShape(QUADS);
  vertex(pp0.x,pp0.y);
  vertex(pp1.x,pp1.y);
  vertex(pp2.x,pp2.y);
  vertex(pp3.x,pp3.y);
  endShape();
  
  //描画する度に回転角度を増やす
  t+= 0.05;
  if(t>=TWO_PI) t = 0.0;
}
