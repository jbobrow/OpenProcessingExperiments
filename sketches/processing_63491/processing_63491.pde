
//頂点の座標(3次元空間上)
PVector p0;
PVector p1;
PVector p2;
PVector p3;
PVector p4;
PVector p5;
   
//投影された頂点の座標(2次元平面上)
PVector pp0;
PVector pp1;
PVector pp2;
PVector pp3;
PVector pp4;
PVector pp5;
 
//法線ベクトル計算用のベクトル
PVector v1;
PVector v2;
 
PVector v3;
PVector v4;
 
//移動ベクトル
PVector tV;
 
//法線ベクトル
PVector nV1;
PVector nV2;

//光線ベクトル(平行光源)
PVector lV;

//正方形のZ座標
int pZ = 1500;
//投影するスクリーンのZ座標
int sZ = 1000;
 
//正方形の辺の長さ
int  l = 400;
 
//回転角度
float t;

void setup() {
  size(600, 600);

  //ベクトルの初期化
  p0 = new PVector(-l/2, -l/2, pZ);
  p1 = new PVector(l/2, -l/2, pZ);
  p2 = new PVector(l/2, l/2, pZ);
  p3 = new PVector(-l/2, l/2, pZ);
  p4 = new PVector(-l/2, -l/2, pZ);
  p5 = new PVector(l/2, l/2, pZ);

  pp0 = new PVector(0, 0, 0);
  pp1 = new PVector(0, 0, 0);
  pp2 = new PVector(0, 0, 0);
  pp3 = new PVector(0, 0, 0);
  pp4 = new PVector(0, 0, 0);
  pp5 = new PVector(0, 0, 0);

  tV = new PVector(0, 0, -l/2);

  v1 = new PVector(0, 0, 0);
  v2 = new PVector(0, 0, 0);

  v3 = new PVector(0, 0, 0);
  v4 = new PVector(0, 0, 0);

  nV1 = new PVector(0, 0, 0);
  nV2 = new PVector(0, 0, 0);

  //左手前から右奥に向かう平行光源を設定
  lV = new PVector(1, 0, 1);
  lV.normalize();
}

void drawPolygon1() {

  //法線ベクトルと光源ベクトルの内積から光の強さを決定
  float l = nV1.dot(lV);

  //面の向きによって色を変える
  //法線と光源が逆向きのためマイナスを掛ける
  if (nV1.z < 0) fill(100 - l * 100);  
  //裏向きの場合法線ベクトルと光源が同じ向きなのでプラスにする
  else fill(50 + l * 50);

  beginShape(QUADS);
  vertex(pp0.x, pp0.y);
  vertex(pp1.x, pp1.y);
  vertex(pp2.x, pp2.y);
  vertex(pp3.x, pp3.y);
  endShape();
}

void drawPolygon2() {

  float l = nV2.dot(lV);

  //面の向きによって色を変える
  //法線と光源が逆向きのためマイナスを掛ける
  if (nV2.z < 0) fill(100 - l * 100);
  //裏向きの場合法線ベクトルと光源が同じ向きなのでプラスにする
  else fill(50 + l * 50);

  beginShape(QUADS);
  vertex(pp1.x, pp1.y);
  vertex(pp2.x, pp2.y);
  vertex(pp5.x, pp5.y);
  vertex(pp4.x, pp4.y);
  endShape();
}
void draw() {
  smooth();
  background(255, 255, 255);
  stroke(60);
 
  //描画基準位置を中心に移動
  translate(width/2,height/2);
    
  //移動ベクトルを計算
  tV.x = -l/2 * sin(t);
  tV.z = l/2 * cos(t);
   
  //面１の座標値を計算
  p0.x = -l/2 * cos(t);
  p1.x = l/2 * cos(t);
  p2.x = l/2 * cos(t);
  p3.x = -l/2 * cos(t);
   
  p0.z = pZ - l/2 * sin(t);
  p1.z = pZ + l/2 * sin(t);
  p2.z = pZ + l/2 * sin(t);
  p3.z = pZ - l/2 * sin(t);
   
  p0.add(tV);
  p1.add(tV);
  p2.add(tV);
  p3.add(tV);
 
  //面２の座標値を計算
  p4.x = l/2 * cos(t);
  p5.x = l/2 * cos(t);
 
  p4.z = pZ + l/2 * sin(t);
  p5.z = pZ + l/2 * sin(t);
 
  p4.sub(tV);
  p5.sub(tV);
   
 
  //スクリーン上に投影した頂点の座標値を計算
  pp0.x = p0.x * (float)sZ / p0.z;
  pp1.x = p1.x * (float)sZ / p1.z;
  pp2.x = p2.x * (float)sZ / p2.z;
  pp3.x = p3.x * (float)sZ / p3.z;
 
  pp4.x = p4.x * (float)sZ / p4.z;
  pp5.x = p5.x * (float)sZ / p5.z;
 
  pp0.y = p0.y * (float)sZ / p0.z;
  pp1.y = p1.y * (float)sZ / p1.z;
  pp2.y = p2.y * (float)sZ / p2.z;
  pp3.y = p3.y * (float)sZ / p3.z;
   
  pp4.y = p4.y * (float)sZ / p4.z;
  pp5.y = p5.y * (float)sZ / p5.z;
   
  //v1にp0からp1のベクトルを設定
  v1.set(p1);
  v1.sub(p0);
  //v2にp0からp3のベクトルを設定
  v2.set(p3);
  v2.sub(p0);
 
  //v3にp1からp4のベクトルを設定
  v3.set(p4);
  v3.sub(p1);
  //v3にp1からp2のベクトルを設定
  v4.set(p2);
  v4.sub(p1);
 
  //v1とv2の外積から法線ベクトルを計算
  nV1 = v1.cross(v2);
  //法線ベクトルを正規化
  nV1.normalize();
 
  //v3とv4の外積から法線ベクトルを計算
  nV2 = v3.cross(v4);
  //法線ベクトルを正規化
  nV2.normalize();
 
  //面のZ座標値の合計を求める
  float zSum1 = p0.z + p1.z + p2.z + p3.z;
  float zSum2 = p1.z + p2.z + p4.z + p5.z;
 
  //面のZ座標値の合計を比べて手前にある面を判断し、描画順序を変更する
  if (zSum1 - zSum2 > 0) {
    drawPolygon1();
    drawPolygon2();
  }
  else {
    drawPolygon2();
    drawPolygon1();
  }
 
  t+= 0.02;
  if (t>=TWO_PI) t = 0.0;
}
