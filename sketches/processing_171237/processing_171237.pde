
// Processingによる簡易版ライフゲーム（サイズ10x10） 

// 定数
public class Cnst{
  public static final int XSIZE = 160;               // 画面サイズ（縦）
  public static final int YSIZE = 160;               // 画面サイズ（横）
  public static final int PXSIZE = 16;               // セルサイズ
  public static final int XN = YSIZE / PXSIZE;       // セル数（横）
  public static final int YN = XSIZE / PXSIZE;;      // セル数（縦）
  public static final int BGCOLOR = 255;             // 背景色
  public static final int FR = 1;                    // フレームレート（Hz）
  public static final int SW = 0;                    // セルの枠線の太さ
}

// セルオートマトンクラス
public class CA{
  // インスタンス変数
  int[][] s;

  // コンストラクタ
  CA(){
    this.s = new int[Cnst.XN][Cnst.YN];
    this.s = setInitConfig();
  }

  // 拡張剰余
  private int mod(int i,int n){
    if(i >= 0){return i % n; }
    else{return (i + n) % n; }  // 任意の範囲には対応していない
  }

  // 初期条件（この例ではダイハードパターンを指定）
  private int[][] setInitConfig(){
    int[][] a = {
      {0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,1,0,0},
      {0,1,1,0,0,0,0,0,0,0},
      {0,0,1,0,0,0,1,1,1,0},
      {0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0}
    };
    return a;
  }

  // 周期的境界条件で周りのセルと相互作用
  public void generate(){
    int[][] t = new int[Cnst.XN][Cnst.YN];
    for(int i = 0;i < Cnst.XN;i++){
      for(int j = 0;j < Cnst.YN;j++){
        int ip = mod(i - 1,Cnst.XN);
        int in = mod(i + 1,Cnst.XN);
        int jp = mod(j - 1,Cnst.YN);
        int jn = mod(j + 1,Cnst.YN);

        int k = this.s[ip][jp] + this.s[ip][j] + this.s[ip][jn] 
          + this.s[i][jp] + this.s[i][jn] 
          + this.s[in][jp] + this.s[in][j] + this.s[in][jn];
        t[i][j] = rule(k,s[i][j]);
      }
    }
    this.s = t;
  }

  // 選別関数 
  // kの値による分岐は、(1 - Math.signum(abs(cond - k))) * formula で記述可能
  // この例では、
  //   k = 2 状態を維持(sを返す)
  //   k = 3 生成(1を返す)
  //   それ以外 消滅(0を返す)
  // を表しており、1行では
  //   (1 - (int)Math.signum(abs(2 - k))) * s + (1 - (int)Math.signum(abs(3 - k))) * 1
  // と表せる。
  private int rule(int k,int s){
    if(k == 2){return s;}
    else if(k == 3){return 1;}
    else{return 0;}
  }

  // 描画
  public void expr(){
    for(int i = 0;i < Cnst.XN;i++){
      for(int j = 0;j < Cnst.YN;j++){
        fill(((1 - this.s[i][j]) * 255));
        strokeWeight(Cnst.SW);
        rect(Cnst.PXSIZE * i,Cnst.PXSIZE * j,Cnst.PXSIZE,Cnst.PXSIZE);
      }
    }
  }

}

// 変数
CA ca;

// セットアップ
void setup(){
   size(Cnst.YSIZE,Cnst.XSIZE);
   frameRate(Cnst.FR);
   ca = new CA();
}

// 描画
void draw(){
  background(Cnst.BGCOLOR);
  ca.expr();
  ca.generate();                                         // 周期的境界条件のもとでの相互作用
}
