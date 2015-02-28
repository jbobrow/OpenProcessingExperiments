
//円柱の半径
float r = 150;
//円柱の高さ
float h = 400;
 
//光源の位置(点光源)
PVector lP = new PVector (-500,-400,1200);

//視点の位置
PVector eP = new PVector(0,0,0);

//円柱の中心のZ座標
int pZ = 2000;
//スクリーンのZ座標
int sZ = 1500;
 
void setup(){
  size(600,600);
  //計算に時間がかかるためループしないように設定
  noLoop(); 
}


void draw(){
  //smooth();
  background(255,255,255);
  stroke(60);
  strokeWeight(2);
  
  translate(width/2,height/2);
  
  float t;
  int j;
  for(t=0;t<=PI;t+=0.01){
    for(j=0;j<h;j++){
    float x = r * cos(-t);
    float y = -h/2 + (h - j);
    float z = pZ + r * sin(-t);
    
    float px = x * (float)sZ / z;
    float py = y * (float)sZ / z;
    
    PVector p = new PVector(x,y,z);
    
    //光線のベクトル
    PVector lV = new PVector(0,0,0);
    lV.set(p);
    lV.sub(lP);
    lV.normalize();
    
    PVector n = new PVector(x,0,z - pZ);
    n.normalize();    
    
    //視線ベクトル
    PVector eV = new PVector(0,0,0);
    eV.set(p);
    eV.sub(eP);
    eV.normalize();
    
    //光線、視線の逆向きのベクトルを計算
    PVector eVRev;
    eVRev = new PVector(0,0,0);
    eVRev.sub(eV);
    eVRev.normalize();
    
    PVector lVRev;
    lVRev = new PVector(0,0,0);
    lVRev.sub(lV);
    
    //拡散反射光の強さ
    float d;
    //鏡面反射光の強さ
    float s;
 
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
    point(px,py);
    //鏡面反射光を白色の光として計算
    //強いほど不透明度を高くし、重ねて描画
    stroke(255,pow(s,7)*80);
    point(px,py);
    }
  }
}
