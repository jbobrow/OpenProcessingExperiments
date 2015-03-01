
///////////////////////////////////////////////////////
//
// Turing Membrane Project
// 膜プロジェクト
// 六角形の膜
//             by Tetsuya Matsuno
//             by 松野哲也
///////////////////////////////////////////////////////
//import processing.opengl.*;

// 粒子たちのリスト：粒子オブジェクトへの参照を格納
ArrayList _particlesList = new ArrayList();

// 三角形たちのリスト：三角形オブジェクトへの参照を格納
ArrayList _trianglesList = new ArrayList();

int _N = 7;         /// the size should be odd !!! /// 奇数にすべし!!!
float _l0  = 10;     /// natural length of spring /// ばねの自然長
float _k0  = 5.0;    /// spring constant /// ばね定数
float _c0  = 0.2;    /// resistance coefficient /// 抵抗係数
float _mg0 = 4.0;    /// gravitational force /// （反）重力
float _random_amplitude = 5; /// random force /// ランダム力の強度
float _dt  = 0.02;   /// temporal descretization /// 時間離散化
float _r0 = 9;       /// 基本格子ベクトル：初期間隔
float _th = PI / 3;  /// 基本格子ベクトル：角度
float _particle_cube_size = _r0 / 3;

float _zoom_scale = 1.0;
float _angle = 0; 



//// セットアップ
void setup() {
  size(500, 500, P3D);
  //size(500, 500, OPENGL);
  //colorMode(RGB, 1);// java scriptにうまく変換できない？
  initializeSystem(_particlesList, _trianglesList);
  mouseX = (int)(0.7 * width);
  mouseY = (int)(0.7 * height);
}
////////////////////////////////////////////////////////
// メインループ
////////////////////////////////////////////////////////
void draw() {
  cameraAndLights();
  rotateObjects();
  
  background(0.3*256);

  drawTriangles(_trianglesList);   /// 三角形たちの描画
  drawVertices(_particlesList);    /// 粒子たちの描画
  drawGround(6);                   /// 「地面」の描画
  drawAxes();                      /// 軸たちの描画
  drawTexts();
  updateParticles(_particlesList); /// 粒子たちの状態更新
}
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
//// 粒子たちの状態更新
void updateParticles(ArrayList p_list){
  for(int i = 0; i < p_list.size(); i++){
    ((Particle)p_list.get(i)).update_state();
  }
}
//// 初期化
void initializeSystem(ArrayList p_list, ArrayList t_list){
  float r0 = _r0;
  float th = _th;
  Point3D ua = new Point3D(r0, 0, 0);
  Point3D ub = new Point3D(r0*cos(th), r0*sin(th), 0);
  
  // 粒子生成
  int N = _N; /// the size should be odd !!!
  int N1 = (N-1) / 2;
  int N2 = (N-1) / 2 * 3;
  Particle[][] p0 = new Particle[N][N];
  for(int i = 0; i < N; i++){
    for(int j = 0; j < N; j++){
      if(N1 <= (i+j) && (i+j) <= N2){
        p0[i][j] = new Particle(ua.a(i-N1).add(ub.a(j-N1)), 0);
        p_list.add(p0[i][j]);
      }else{
        p0[i][j] = null;
      }    
    }
  }
  // 粒子接続
  for(int j = 0; j <= N-1; j++){
    int is = 0;
    int ie = N-1;
    if(j < N1){ is = N1-j; }
    if(j > N1){ ie = N2-j; }
    for(int i = is; i <= ie; i++){
      if(i < ie){ p0[i][j].addLink(p0[i+1][j]); }              /// right
      if(i < N2-j && j < N-1){ p0[i][j].addLink(p0[i][j+1]); } /// up-right
      if(i > 0 && j < N-1){ p0[i][j].addLink(p0[i-1][j+1]); }  /// up-left
      if(i > is){ p0[i][j].addLink(p0[i-1][j]); }              /// left
      if(i > N1-j && j > 0){ p0[i][j].addLink(p0[i][j-1]); }   /// down-left
      if(i < N-1 && j > 0){ p0[i][j].addLink(p0[i+1][j-1]); }  /// down-right
    }
  }
  // 三角形の設定
  for(int j = 0; j < N-1; j++){
    for(int i = 0; i < N-1; i++){
      Triangle t1 = new Triangle();
      Triangle t2 = new Triangle();
      if(p0[i][j] != null && p0[i+1][j] != null && p0[i][j+1] != null){
        t1.addVertex(p0[i][j]); t1.addVertex(p0[i+1][j]); t1.addVertex(p0[i][j+1]);
      }
      if(p0[i+1][j] != null && p0[i+1][j+1] != null && p0[i][j+1] != null){
        t2.addVertex(p0[i+1][j]); t2.addVertex(p0[i+1][j+1]); t2.addVertex(p0[i][j+1]);
      }
      t_list.add(t1);
      t_list.add(t2);
    }
  }
  // 固定粒子設定
  p0[N1][0].setFlag(1);
  p0[N-1][0].setFlag(1);
  p0[0][N1].setFlag(1);
  p0[N-1][N1].setFlag(1);
  p0[0][N-1].setFlag(1);
  p0[N1][N-1].setFlag(1);
}
//// まわして眺める
void rotateObjects(){
  rotateZ(_angle);
  _angle += 0.01;
}
//// カメラと光の状況
void cameraAndLights(){
  //float eyeX = 0.4 * (mouseX-width/2)  * _N / _r0;
  //float eyeY = 0.4 * (mouseY-height/2) * _N / _r0;
  //float eyeZ = 0.4 * height/2 * _N / _r0;
  
  float R = width * _N / _r0 / 5 * _zoom_scale;
  float phi = - PI * mouseX / width;
  float th  = - PI * mouseY / height;
  float eyeX = R * sin(th) * cos(phi);
  float eyeZ = R * sin(th) * sin(phi);
  float eyeY = - R * cos(th);
  
  camera(eyeX, eyeY, eyeZ, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0,    // centerX, centerY, centerZ
         0.0, 1.0, 0.0);   // upX, upY, upZ
  //lights();
  pointLight(255, 255, 255, 500, 500, 500);
}
//// 軸の描画
void drawAxes(){
  stroke(255,0,0);
  drawJIKU(200,0,0); // x-jiku (red)
  stroke(0,255,0);
  drawJIKU(0,200,0); // y-jiku (green)
  stroke(0,0,255);
  drawJIKU(0,0,200); // z-jiku (blue) 
}
////
void drawJIKU(float x, float y, float z){
  beginShape(LINES);
    vertex(0,0,0);
    vertex(x,y,z);
  endShape();    
}
//// 粒子たちの描画
void drawVertices(ArrayList pList){
  for(int i = 0; i < pList.size(); i++){
    draw_A_Vertex((Particle)pList.get(i));
  }
}
//// 1つの粒子の描画
void draw_A_Vertex(Particle p){
  pushMatrix();
    Point3D r = p.getPos();
    translate(r.x, r.y, r.z);
    noStroke();
    fill(255,255,255,255);
    //sphere(5); // 遅くなる：多数の三角形の集まりとして表現しているので
    box(_particle_cube_size); // 速い！
  popMatrix();
}
//// 三角形たちの描画
void drawTriangles(ArrayList triList){
  for(int i = 0; i < triList.size(); i++){
    draw_A_Triangle((Triangle)triList.get(i));
  }
}
//// １つの三角形の描画
void draw_A_Triangle(Triangle tri){
  if(tri.isTriangle() == false){ return; } // 三角形じゃないなら何もしない
  stroke(255);           // 淵は白く
  fill(0, 255, 255, 127);  // 半分透過
  beginShape(TRIANGLES);
    for(int i = 0; i < 3; i++){
      Point3D r = ((Particle)tri.getVertices().get(i)).getPos();
      vertex(r.x, r.y, r.z);
    }
  endShape();  
}
//// 地面
void drawGround(int M){
  float R0 = _r0 * ( _N - 1 ) / 2;
  float th = TWO_PI / M;
  stroke(255);
  fill(0.4*256, 255, 0, 0.5*256);
  beginShape();
    for(int i = 0; i < M; i++){
      vertex(R0 * cos(i * th), R0 * sin(i * th), 0); 
    }
  endShape(CLOSE);
}
////
void drawTexts(){
  textSize(32);
  fill(0,255,0);
  for(int i = 0; i < 50; i++){
    text("random = "+ (int)_random_amplitude, 0, (i-25)*40, -200);
    text("random = "+ (int)_random_amplitude, -250, (i-25)*40, -200);
  }
}
//// ユーザーインターフェース
// 変更：ズーム操作ではなくランダム力の強さ
void keyPressed(){
    if(keyCode == UP || key == 'a' || key == 'A'){
      //_zoom_scale *= 0.9;
      _random_amplitude += 30;
    }
    if(keyCode == DOWN || key == 'z' || key == 'Z'){
      //_zoom_scale *= 1.1;
      if(_random_amplitude > 30){
        _random_amplitude -= 30;
      }
    }
}
void mousePressed(){
    if(mouseButton == LEFT){
      //_zoom_scale *= 0.9;
      _random_amplitude += 30;
    }
    if(mouseButton == RIGHT){
      //_zoom_scale *= 1.1;
      if(_random_amplitude > 30){
        _random_amplitude -= 30;
      }
    }
}
//////////////////////////////////////////////////////////
//// 三角形クラス
class Triangle{
  ArrayList vertices = new ArrayList();
  // constructor
  Triangle(){
  }
  // 要素（頂点）のセット
  void addVertex(Particle p){
    if(vertices.size() < 3){
      vertices.add(p);
    }
  }
  // 頂点リストの取得
  ArrayList getVertices(){
    return vertices;
  }
  // 三角形（頂点が３つ）かどうかのチェック
  boolean isTriangle(){
    if(vertices.size() == 3){ return true; }
    else{ return false; }
  }
}
//////////////////////////////////////////////////////////
//// 「粒子」クラス
class Particle{
  ArrayList links = new ArrayList();  /// define connections 接続関係を規定
  Point3D r;        /// position of this particle /// 位置
  Point3D v;        /// velocity of this particle /// 速度
  int fix_flag;     /// 0: move,   !=0: fixed /// ゼロだったら状態更新
  // mechanics parameters
  float l0  = _l0;   /// natural length of spring /// ばねの自然長
  float k0  = _k0;   /// spring constant /// ばね定数
  float c0  = _c0;   /// resistance coefficient /// 抵抗係数
  float mg0 = _mg0;  /// gravitational force /// 重力
  float dt  = _dt;   /// temporal descretization /// 時間離散化
  // constructor
  Particle(Point3D r0, int flag0){
    r = r0;
    v = new Point3D(0,0,0);
    fix_flag = flag0;
  }
  //// methods
  // 状態更新
  void update_state(){
    if(fix_flag != 0){ return; } // fix_flagがゼロ以外なら更新せず
    // ニュートンの運動方程式をオイラー法で簡便に解く
    r = r.add( v.a(dt) );
    v = v.add( force_total().a(dt) );
    
    if( r.z < 0) { v.z = -1.0 * v.z; r.z = 0.1; }  // 反射（反射面： xy平面）
  }
  // 力の計算（トータル）
  Point3D force_total(){
    Point3D f_total = new Point3D(0,0,0);
    for(int i = 0; i < links.size(); i++){
      Particle p = (Particle)links.get(i); /// Particleにキャストすればうまくいった 
      f_total = f_total.add(force_spring(p.getPos().sub(r)));
    }
    f_total = f_total.sub( v.a(c0) ); /// 抵抗力
    // 反重力 z軸の正の方向
    Point3D fg = new Point3D(0,0, mg0);
    f_total = f_total.add( fg );
    //ランダム力
    f_total = f_total.add( force_random(_random_amplitude) );
    return f_total;
  }
  // ばねによる力の計算
  Point3D force_spring(Point3D r1){
    return r1.unit().a( k0 * (r1.len() - l0) );
  }
  // ランダム力（確率分布は「立方体分布」）
  Point3D force_random(float a){
    float xr = random(-a,a);
    float yr = random(-a,a);
    float zr = random(-a,a);
    Point3D fr = new Point3D(xr ,yr ,zr);
    return fr;
  }
  // 位置の取得
  Point3D getPos(){
    return r;
  }
  // 接続のセット
  void addLink(Particle p){
    links.add(p);
  }
  //フラグのセット
  void setFlag(int i){
    fix_flag = i;
  }
}
//////////////////////////////////////////////////////////
//// ベクトル（3次元）クラス
class Point3D{
  float x, y, z;
  // constructors
  Point3D(){
  }
  Point3D(float x, float y, float z){
    this.x = x;
    this.y = y;
    this.z = z;
  }
  // 長さ
  float len(){
    return sqrt(x*x + y*y + z*z);
  }
  // 単位ベクトルにする
  Point3D unit(){
    Point3D r1 = new Point3D(x, y, z);
    if(r1.len() > 0){
      r1.x = x / r1.len();
      r1.y = y / r1.len();
      r1.z = z / r1.len();
      return r1;
    }else{ // 長さがゼロならば，とりあえずゼロベクトルを返す
      r1.x = r1.y = r1.z = 0;
      return r1;
    }
  }
  // 加算
  Point3D add(Point3D r1){
    Point3D r2 = new Point3D(x, y, z);
    r2.x = x + r1.x;
    r2.y = y + r1.y;
    r2.z = z + r1.z;
    return r2;
  }
  // スカラ倍
  Point3D a(float c){
    Point3D r1 = new Point3D(x, y, z);
      r1.x = c * x;
      r1.y = c * y;
      r1.z = c * z;
      return r1;
  }
  // 引き算
  Point3D sub(Point3D r1){
    Point3D r2 = new Point3D(x, y, z);
    return r2.add(r1.a(-1.0));
  }
  // 距離
  float distance(Point3D r1){
    Point3D r2 = new Point3D(x, y, z);
    return r2.sub(r1).len();  
  }
}

