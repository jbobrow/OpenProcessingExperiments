
//円柱の半径
float r = 150;
//円柱の高さ
float h = 400;

//光線のベクトル
PVector lV = new PVector(1,0,1);

//円柱の中心のZ座標
int pZ = 2000;
//スクリーンのZ座標
int sZ = 1500;

//視線ベクトル
PVector eV = new PVector(0,0,1);

void setup(){
  size(600,600);
}


void draw(){
  background(255,255,255);
  stroke(60);
  strokeWeight(2);
  
  translate(width/2,height/2);
  
  lV.normalize();

  //光線ベクトルの逆向きのベクトル
  PVector lVRev = new PVector(0,0,0);
  lVRev.sub(lV);
  
  //視線ベクトルの逆向きのベクトル
  PVector eVRev = new PVector(0,0,0);
  eVRev.sub(eV);
  eVRev.normalize();
  
  //tがπラジアン(180°)まで繰り返し
  //Y軸と平行な線を繰り返し描くことで円柱を描画
  float t;
  for(t=0;t<=PI;t+=0.01){
    //X座標を計算
    float x = r * cos(-t);
    
    //Y座標を計算(線の始点、終点)
    float yt = -h/2;
    float yb = h/2;
    
    //Z座標を計算
    float z = pZ + r * sin(-t); 
    
    //投影後の座標を計算
    float px = x * (float)sZ / z;
    
    float pyt = yt * (float)sZ / z;
    float pyb = yb * (float)sZ / z;
    
    
    //拡散反射光の強さ
    float d;
    //鏡面反射光の強さ
    float s;
    
    //法線ベクトルを計算
    //Y軸に平行な円柱なので、中心から円柱表面へ向かうXZ平面に平行なベクトルが法線の方向と一致する
    PVector n = new PVector(x,0,z - pZ);
    n.normalize();    
    
    //拡散反射光を計算
    d = n.dot(lVRev);
    
    //光線の鏡面反射ベクトルを計算
    PVector refVec = new PVector(0,0,0);
    refVec.set(lV);
    n.mult(d*2);
    refVec.add(n);
    
    //鏡面反射光を計算
    s = refVec.dot(eVRev);
    if(s < 0) s = 0;
       
    //環境光を設定
    int a = 100;

    //物体の色を計算して円柱を描画(環境光＋拡散反射光)
    float dColor;
    dColor = a + d * 80;
    stroke(0,dColor/2,dColor);
    line(px,pyt,px,pyb);
    //鏡面反射光を白色の光として計算
    //強いほど不透明度を高くし、重ねて描画
    stroke(255,pow(s,7)*80);
    line(px,pyt,px,pyb);
  }  
}
