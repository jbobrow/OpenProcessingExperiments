
///////////////////////////////////////////////////////////////////////////////
// Spring Network Model
// スプリングネットワーク（納豆ゲーム）
// by 松野哲也 20070822 
//
///////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////大域変数の宣言
int N  = 200; //最大粒子数
int M  = 10;  //最大接続数（M+1リンク）
int N0 = 15;   //最初の粒子数（3個以上であること）
float mitosisProb   = 0.007;  //粒子分裂確率
float apoptosisProb = 0.002;  //粒子消滅確率
Particle[] p = new Particle[N+1]; //粒子オブジェクト配列の宣言（粒子0は未使用）
float delta_t = 0.02; //時間刻み幅
float damping = 1.5;  //減衰係数
float gravity = 8;    //重力の大きさ
float rs =  7.0;      //粒子サイズ
float r0 = 20.0;      //粒子間相互作用（斥力）距離（バネの自然長でもある）
float rf = r0;        //リンク先を見つけるときの距離基準
float ka =   10.0;    //結合の強さ（引力の強さ：ばね定数）
int flag_freeze = 0;  //運動凍結フラグ
float cX, cY;         //マウスで粒子を操作するための変数
int imin = 0;         //マウスで粒子を操作するための変数
float timer = 0;      //タイマー（スコア？）
float yf;             //「床面」の座標 
/////////////////////////////////////////////////////////////////////////
void setup(){ 
    size(600, 500); //ウィンドウの大きさ
    colorMode(HSB, 1.0);     //色指定はHSBモード
    ellipseMode(CENTER);     //円描画指定方法は中心座標指定方式で
    //細胞たちのインスタンシエーションと初期化
    for(int i = 1; i <= N; i++){
        float x0 = (float)Math.random()*width;          //粒子の初期位置（ｘ座標）
        float y0 = (float)Math.random()*height/2;       //粒子の初期位置（ｙ座標）（真ん中よりも少し上の方に）
        int alive = 0;                                  //活動フラグをゼロ（休止）に
        if(i <= N0){ alive = 1; }                       //N0個の粒子の活動フラグは１（活動）に
        p[i] = new Particle(i, p, x0, y0, 0, 0, alive); //粒子iのインスタンシエーション
    }
    cX = cY = 0;            //マウスで粒子を操作するための変数の初期化
    init_a_circle();        //連結行列の初期化
    /////////
    PFont font; 
    // The font must be located in the sketch's 
    // "data" directory to load successfully 
    font = loadFont("Arial-BoldItalicMT-32.vlw"); 
    textFont(font, 32);
    yf = height * 9/10; 
 
}
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
void draw(){ 
    drawParticles();
    float ymax = 0;
    if(flag_freeze == 0){         
            for(int i = 1; i <= N; i++){   //粒子たちの状態の更新
               if(p[i].alive == 1){
                   p[i].updateState();
                   float y = p[i].y;
                   if(y > ymax){ ymax = y; }
               }
            }
            if(ymax > yf){ flag_freeze = 1; } //ゲームオーバー
            timer += 0.05;
    }
    fill(0.18,1,1);
    rect(0, yf, width, height); //「床」の描画    
    fill(1);
    text("Dancing NATTO", 10, 30); 
    fill(0);
    text("score: ", 50, yf+30);   
    text( (int)timer, 150, yf+30);
    //if(flag_freeze ==1){  fill(0,1,1); text("Game Over", 20, 80); } 
}
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////粒子たちの描画
void drawParticles(){
    background(0.7);  //画面をクリア
    //スプリングの描画
    for(int i = 1; i <= N; i++){
        if(p[i].alive == 1){
            //結合状況の描画 
            for(int j = 0; j < M; j++){
                if(p[i].a[j] != 0){
                    //strokeWeight(2); //スプリングの太さ
                    float rr = sqrt(sq(p[i].x - p[p[i].a[j]].x)+sq(p[i].y - p[p[i].a[j]].y));
                    stroke(atan2(rr,r0)/HALF_PI, 1, 1);                    
                    line(p[i].x, p[i].y, p[p[i].a[j]].x, p[p[i].a[j]].y);
                }
            }
        }
    }
    //粒子の描画
    for(int i = 1; i <= N; i++){
       if(p[i].alive == 1){   
            fill(0);
            noStroke();
            ellipse(p[i].x, p[i].y, rs, rs);
            if(p[i].fixed == 1){ fill(0.5,1,1); }else{ fill(1); }
            ellipse(p[i].x, p[i].y, rs/2, rs/2);
       } 
    }
    if(mousePressed == true && mouseButton == LEFT){  //マウスで摘まんで粒子を動かすためのもの
        p[imin].x = cX;
        p[imin].y = cY;
    }
}

///////////////////////////////////////////////連結行列の初期化（サークル）
void init_a_circle(){
    p[1].a[0] = N0;
    p[1].a[1] = 2;
    for(int i = 2; i < N0; i++){
        p[i].a[0] = i-1;
        p[i].a[1] = i+1;
    }
    p[N0].a[0] = N0-1;
    p[N0].a[1] = 1;
}
///////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
///////////////////////////////ベクトルクラスの定義（ここから）
class Vector{
    float x, y;
    /////コンストラクタ（オブジェクト初期化）
    Vector(float x, float y){
        this.x = x;
        this.y = y;
    }
}
///////////////////////////////ベクトルクラスの定義（ここまで）
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
///////////////////////////////粒子クラスの定義（ここから）
class Particle {
    float x, y, vx, vy;   //位置(x,y)と速度(vx,vy)
    int id;               //自分自身の識別番号
    int alive;            //生存フラグ（生きているなら１．休止中（死）なら０．）
    Particle[] p;
    int[] a = new int[M]; //リンク（接続）情報（どの粒子とつながっているか）
    int fixed;            //「ピン止め粒子」フラグ（そうなら１．そうでないなら０．）
    //////コンストラクタ（オブジェクト初期化）
    Particle(int id, Particle p[], float x, float y, float vx, float vy, int alive){
        this.id = id;
        this.p = p;
        this.x = x; 
        this.y = y;
        this.vx = vx; 
        this.vy = vy;
        this.alive = alive;
        for(int i = 0; i < M; i++){ //リンク情報のクリア
            a[i] = 0;
        }
        fixed = 0;
    }
    /////状態の更新
    void updateState(){
        if(numLinks() == 0){ apoptosis(); } 
        //ある確率で粒子が分裂（増加）する
        if(Math.random() < mitosisProb){
            mitosis();    //粒子分裂（ある粒子（母）が娘粒子を生む）
        }
        //ある条件で粒子が消滅する（死ぬ）
        if(Math.random() < apoptosisProb || numLinks() >= 8){
            apoptosis();  //粒子消滅
        }
        if(fixed == 1){ return; } //自分が「ピン止め粒子」ならばこれ以上なにもしない．             
        //Newtonの運動方程式（オイラー法で大雑把に解く）
        x += vx * delta_t;
        y += vy * delta_t;
        vx += force(id).x * delta_t - damping * vx * delta_t;
        vy += force(id).y * delta_t - damping * vy * delta_t;
        //ウインドーの端で反射
        if(x > width){ x = width; vx = -vx;}    //右側にぶつかったら
        if(x < 0    ){ x = 0; vx = -vx;}        //左側にぶつかったら
        if(y > height){ y = height; vy = -vy;}  //下側にぶつかったら
        if(y < 0    ){ y = 0; vy = -vy;}        //上側にぶつかったら                
    }
    /////粒子に働く力の計算  
    Vector force(int id) {
        Vector f = new Vector(0,0);
        for(int i=0; i < M; i++){
           if(a[i] != 0){                      //自分とリンクしている粒子から受ける力を計算．合計．
              float xe = p[a[i]].x;
              float ye = p[a[i]].y;
              float ra = sqrt(sq(x - xe) + sq(y - ye));    //粒子iとの距離                                                
              float fa = ka * (ra - r0);                   //引力（バネ：フックの法則，自然長 r0）
              f.x +=  - (x - xe)/ra * fa;                  //力のx成分
              f.y +=  - (y - ye)/ra * fa + gravity;        //力のy成分（プラス方向が「下」）
           }
        }
        return f;
    } 
    /////粒子の分裂（増加） 
    void mitosis(){
        int ibrth = 0;
        for(int i = 1; i <= N; i++){
            if(i != id && p[i].alive == 0){ //休止中の（使える）粒子を探す
                ibrth = i; //娘粒子のID
            }
        }
        if(ibrth == 0){ return; } //使える休止中粒子が存在しないので．
        if(numLinks() >=6){ return; } //過密防止    
        float theta = TWO_PI * (float)Math.random();               //娘粒子出現場所算出
        p[ibrth].x = p[id].x + 0.2 * r0 * (float)Math.cos(theta);  //娘粒子出現場所算出
        p[ibrth].y = p[id].y + 0.2 * r0 * (float)Math.sin(theta);  //娘粒子出現場所算出
        p[ibrth].vx = 0;     //娘粒子初速ゼロ
        p[ibrth].vy = 0;     //娘粒子初速ゼロ
        if(maxLLid() != 0){ p[ibrth].makeMutualLink(maxLLid()); } //リンク長最大のリンク先とリンクさせる
        p[ibrth].findAndMakeMutualLinks(3); //娘粒子にリンク先を見つけさせる
        p[ibrth].alive = 1;  //娘粒子活動開始
        return; 
    }
    /////粒子の消滅（減少）
    void apoptosis(){
       for(int i = 0; i < M; i++){
          if(a[i] != 0){
             p[a[i]].deleteLink(id);
             a[i] = 0;
          }
       }
       fixed = 0;
       alive = 0;
    }
    /////リンク先を見つけ相互リンクを張る
    void findAndMakeMutualLinks(int maxlink){
        int count = 0;
        for(int i = 1; i <= N; i++){
           if(i != id && p[i].alive == 1){
              float ra = sqrt(sq(x - p[i].x) + sq(y - p[i].y));
              if(ra < rf){
                 if(count <= maxlink){ makeMutualLink(i); count++; }
              }  
           }
        }
    }
    /////相互リンクを張る
    void makeMutualLink(int i){
       if(chkLinkFull() || p[i].chkLinkFull()){ return; }
       makeLink(i);
       p[i].makeLink(id);
    }
    /////相互リンクを削除する
    void deleteMutualLink(int j){
       if(p[j].deleteLink(id) != 0){
          deleteLink(j);
       }
    }
    /////フルリンクかどうかチェック
    boolean chkLinkFull(){
       for(int i = 0; i < M; i++){
          if(a[i] == 0){ return false; }
       }
       return true;
    }
    /////リンクを作る
    void makeLink(int j){
       for(int i = 0; i < M; i++){
          if(a[i] == 0){ a[i] = j; return; }
       }
    }
    /////リンクを削除する
    int deleteLink(int j){
       for(int i = 0; i < M; i++){
          if(a[i] == j){ a[i] = 0; return j; }
       }
       return 0;
    }
    /////リンクの数
    int numLinks(){
       int count = 0;
       for(int i = 0; i < M; i++){
          if(a[i] != 0){ count++; }
       }
       return count;
    }
    /////最大リンク長
    float maxLL(){
       float maxlen = 0;
       for(int i = 0; i < M; i++){
          if(a[i] != 0){
             float r = sqrt(sq(x - p[a[i]].x) + sq(y - p[a[i]].y));
             if(r > maxlen){ maxlen = r; }
          }
       }
       return maxlen;
    }
    /////最大リンクID
    int maxLLid(){
       float maxlen = 0;
       int   maxid = 0;
       for(int i = 0; i < M; i++){
          if(a[i] != 0){
             float r = sqrt(sq(x - p[a[i]].x) + sq(y - p[a[i]].y));
             if(r > maxlen){ maxlen = r; maxid = a[i]; }
          }
       }
       return maxid;        
    }
}
///////////////////////////////粒子クラスの定義（ここまで）
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//マウスで１つの粒子を摘まんで動かす．
void mousePressed(){
    if(mouseButton == RIGHT){ //右ボタンクリックで粒子たちに擾乱
        for(int i = 1; i <= N; i++){
            p[i].vx += (float)(Math.random()-0.5)*500;
            p[i].vy += (float)(Math.random()-0.5)*500;
        }
        //flag_freeze = 0;
        if(flag_freeze == 0){ timer += 5; }//粒子たちに擾乱を与えたらスペシャルポイント
        return;        
    }
    //右ボタンでなければ，ポインタに一番近い粒子を「ピン止め」
    cX = mouseX;
    cY = mouseY;
    float rmin = width + height;
    //マウスポインタに一番近い粒子を探し出して
    //その粒子の座標を強引にマウスポインタの座標にしてしまう．
    for(int i = 1; i <= N; i++){
        float r = (float)Math.sqrt((float)Math.pow(p[i].x - cX, 2)+
                                   (float)Math.pow(p[i].y - cY, 2));
        if(r < rmin && p[i].alive == 1){
           rmin = r;
           imin = i;
        }
    }
    p[imin].x = cX; //オブジェクト指向っぽくないが，とりあえず
    p[imin].y = cY; //オブジェクト指向っぽくないが，とりあえず
    p[imin].fixed = 1 - p[imin].fixed; //fixedフラグをスイッチ（識別番号 imin の粒子がピン止め状態に）
    if(flag_freeze == 0){ timer -= 5; } //ピン止めするたびに減点！
}
//////////////////////////////////////////////////////////////
void mouseDragged(){
    cX = mouseX;
    cY = mouseY;
    if(cX < 0){ cX = 0; }
    if(cX > width){ cX = width; }
    if(cY < 0){ cY = 0; }
}
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
//「R」で粒子たちに擾乱を与える．
//「F」で粒子たちの運動を凍結する．
void keyPressed(){
    if(key == 'r' || key == 'R'){
        for(int i = 1; i <= N; i++){
            p[i].vx += (float)(Math.random()-0.5)*500;
            p[i].vy += (float)(Math.random()-0.5)*500;
        }
        flag_freeze = 0;
        timer += 5;
    }else if(key == 'f' || key == 'F'){
        if(flag_freeze == 0){
            flag_freeze = 1;
        }else{
            flag_freeze = 0;
        }
    }
}
//////////////////////////////////////////////////////////////

