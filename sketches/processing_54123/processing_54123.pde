
// ============================================================
// 四元数クラス
// ============================================================
class Quaternion {
  public double w, x, y, z;
  
  // ----------------------------------------------------------
  // コンストラクタ
  // ----------------------------------------------------------
  public Quaternion() {
    set(1, 0, 0, 0);  // 虚数部ゼロの単位クォータニオン
  }
  public Quaternion(double x, double y, double z) {
    set(0, x, y, z);
  }
  public Quaternion(double w, double x, double y, double z) {
    set(w, x, y, z);
  }  
  public Quaternion(final PVector p) {
    set(p);
  }
  public Quaternion(final PMatrix3D mat) {
    set(mat);
  }
  public Quaternion(final Quaternion q) {
    set(q);
  }
  
  // ----------------------------------------------------------
  // セッタ
  // ----------------------------------------------------------
  public Quaternion set(double w, double x, double y, double z) {
    this.w = w;
    this.x = x;
    this.y = y;
    this.z = z;
    
    return this;
  }
  public Quaternion set(final PVector p) {
    this.w = 0;
    this.x = p.x;
    this.y = p.y;
    this.z = p.z;
    
    return this;
  }  
  public Quaternion set(final PMatrix3D mat) {
    double fourWSquaredMinus1 = mat.m00 + mat.m11 + mat.m22;
    double fourXSquaredMinus1 = mat.m00 - mat.m11 - mat.m22;
    double fourYSquaredMinus1 = mat.m11 - mat.m00 - mat.m22;
    double fourZSquaredMinus1 = mat.m22 - mat.m00 - mat.m11;
    
    int    biggestIndex = 0;
    double fourBiggestSquaredMinus1 = fourWSquaredMinus1;
    if(fourXSquaredMinus1 > fourBiggestSquaredMinus1) {
      fourBiggestSquaredMinus1 = fourXSquaredMinus1;
      biggestIndex = 1;
    }
    if(fourYSquaredMinus1 > fourBiggestSquaredMinus1) {
      fourBiggestSquaredMinus1 = fourYSquaredMinus1;
      biggestIndex = 2;
    }
    if(fourZSquaredMinus1 > fourBiggestSquaredMinus1) {
      fourBiggestSquaredMinus1 = fourZSquaredMinus1;
      biggestIndex = 3;
    }
    
    // 平方根と除算を計算する
    double biggestVal = Math.sqrt(fourBiggestSquaredMinus1 + 1.0) * 0.5;
    double mult = 0.25 / biggestVal;
    
    // 四元数の値を計算する
    switch (biggestIndex) {
      case 0:
        w = biggestVal;
        x = -(mat.m12 - mat.m21) * mult;
        y = -(mat.m20 - mat.m02) * mult;
        z = -(mat.m01 - mat.m10) * mult;
        break;
      case 1:
        x = biggestVal;
        w = -(mat.m12 - mat.m21) * mult;
        y = (mat.m01 + mat.m10) * mult;
        z = (mat.m20 + mat.m02) * mult;
        break;
      case 2:
        y = biggestVal;
        w = -(mat.m20 - mat.m02) * mult;
        x = (mat.m01 + mat.m10) * mult;
        z = (mat.m12 + mat.m21) * mult;
        break;
      case 3:
        z = biggestVal;
        w = -(mat.m01 - mat.m10) * mult;
        x = (mat.m20 + mat.m02) * mult;
        y = (mat.m12 + mat.m21) * mult;
        break;
    }
    return this;
  }
  public Quaternion set(Quaternion q) {
    return set(q.w, q.x, q.y, q.z);
  }
  
  
  // ----------------------------------------------------------
  // 与えられた四元数を左から掛け、さらにその結果を返す
  //
  //   ※ つまり、q0.preApply(q1) = q1 * q0 となる
  //   　 直感的じゃないけど、PMatrix の仕様に合わせたんだよ
  // ----------------------------------------------------------
  //
  // 引数
  // ----------------------------------------------------------
  //   left : 外積の左因子
  //
  // 戻値
  // ----------------------------------------------------------
  //   外積
  public Quaternion preApply(final Quaternion left) {
    double newW = left.w * w - left.x * x - left.y * y - left.z * z;
    double newX = left.w * x + left.x * w + left.z * y - left.y * z;
    double newY = left.w * y + left.y * w + left.x * z - left.z * x;
    double newZ = left.w * z + left.z * w + left.y * x - left.x * y;
    
    return set(newW, newX, newY, newZ);
  }
  
  
  // ----------------------------------------------------------
  // 与えられたスカラで四元数を割り、さらにその結果を返す
  // ----------------------------------------------------------
  // 
  // 引数
  // ----------------------------------------------------------
  //   scalar : 四元数を割る数
  //
  // 戻値
  // ----------------------------------------------------------
  //   与えられたスカラで四元数を割った結果  
  public Quaternion div(double scalar) {
    w /= scalar;
    x /= scalar;
    y /= scalar;
    z /= scalar;
    
    return this;
  }
  
  
  // ----------------------------------------------------------
  // 与えられたベクトルに四元数を適用し、回転をほどこす
  //
  // 引数
  // ----------------------------------------------------------
  //   src : 初期ベクトル
  //   dst : 結果の格納用
  //
  // 戻値
  // ----------------------------------------------------------
  //   なし
  public void mult(final PVector src, PVector dst) {
    Quaternion q = new Quaternion(this);
    Quaternion p = new Quaternion(src);
    Quaternion r = new Quaternion(this);
    r.invert().preApply(p.preApply(q));
    dst.set((float)r.x, (float)r.y, (float)r.z);
  }
  
  
  // ----------------------------------------------------------
  // 四元数 q の共軛 q* を計算し、その結果を返す
  // ----------------------------------------------------------
  // 
  // 引数
  // ----------------------------------------------------------
  //   なし
  //
  // 戻値
  // ----------------------------------------------------------
  //   共軛四元数
  public Quaternion conjugate() {
    return set(w, -x, -y, -z);
  }
  

  // ----------------------------------------------------------
  // 四元数の絶対値を求める
  //
  // 戻値 
  // ----------------------------------------------------------
  //   |q| = √(w^2 + x^2 + y^2 + z^2)
  // ----------------------------------------------------------
  public double mag() {
    return Math.sqrt(w * w + x * x + y * y + z * z);
  }
  

  // ----------------------------------------------------------
  // 四元数を正規化する
  // 
  // 戻値
  // ----------------------------------------------------------
  //   q / |q|
  public Quaternion normalize() {
    double mag = mag();
    div(mag);
    return this;
  }
  
  
  // ----------------------------------------------------------
  // 四元数の逆数を求める
  //
  // 戻値
  // ---------------------------------------------------------- 
  //   q^-1 = q* / |q|
  // ----------------------------------------------------------
  public Quaternion invert() {
    double mag = mag();
    conjugate();
    div(mag);
    return this;
  }
  
  
  // ----------------------------------------------------------
  // 四元数に対応する回転行列を得る
  // ----------------------------------------------------------
  public PMatrix3D getMatrix() {
    PMatrix3D mat = new PMatrix3D();
    mat.m00 = (float)(1 - 2 * y * y - 2 * z * z);
    mat.m10 = (float)(2 * x * y - 2 * w * z);
    mat.m20 = (float)(2 * x * z + 2 * w * y);
    
    mat.m01 = (float)(2 * x * y + 2 * w * z);
    mat.m11 = (float)(1 - 2 * x * x - 2 * z * z);
    mat.m21 = (float)(2 * y * z - 2 * w * x);
    
    mat.m02 = (float)(2 * x * z - 2 * w * y);
    mat.m12 = (float)(2 * y * z + 2 * w * x);    
    mat.m22 = (float)(1 - 2 * x * x - 2 * y * y);
    
    return mat;
  }
}


// ============================================================
// 球面線型補間
// ============================================================

// Quaternion q0 ～ q1 の間を滑らかに補間する
//
// 引数
// ------------------------------------------------------------
//   q0 : 初期状態
//   q1 : 目標状態
//   t  : フラクション （[0～1]の範囲）
//
// 戻値
// ------------------------------------------------------------
//   補間する方向の四元数
Quaternion slerp(Quaternion q0, final Quaternion q1, double t) {
  Quaternion dst = new Quaternion();
  slerp(q0, q1, t, dst);
  return dst;
}

// Quaternion q0 ～ q1 の間を滑らかに補間する
//
// 引数
// ------------------------------------------------------------
//   q0  : 初期状態
//   q1  : 目標状態
//   t   : フラクション （[0～1]の範囲）
//   dst : 結果の格納用
//
// 戻値
// ------------------------------------------------------------
//   なし
void slerp(Quaternion q0, final Quaternion q1, double t, Quaternion dst) {
  
  double cosOmega = q0.w * q1.w + q0.x * q1.x + q0.y * q1.y + q0.z * q1.z;
  
  // 内積が負なら、片方の入力四元数の符号を反転して、最短の弧を取る
  if(cosOmega < 0.0) {
    q0.w = -q0.w;
    q0.x = -q0.x;
    q0.y = -q0.y;
    q0.z = -q0.z;
  }
  
  // 0による除算を防ぐために、互いに密接していないかをチェックする
  double k0, k1;
  if(cosOmega > 0.9999) {
    // 密接していたら、単純に線型補間を行う
    k0 = 1.0 - t;
    k1 = t;
  } else {
    // 三角項等式 sin^2(omega) + cos^2(omega) = 1
    // を使って、角度のサインを計算する
    double sinOmega = Math.sqrt(1.0 - cosOmega * cosOmega);
    
    // sin と cos から角度を計算する
    double omega = Math.atan2(sinOmega, cosOmega);
    
    // 除算を1回だけすれば済むように、分母の逆数を計算する
    double oneOverSinOmega = 1.0 / sinOmega;
    
    // 補間パラメータを計算
    k0 = Math.sin((1.0 - t) * omega) * oneOverSinOmega;
    k1 = Math.sin(t * omega) * oneOverSinOmega;
  }
  
  dst.w = q0.w * k0 + q1.w * k1;
  dst.x = q0.x * k0 + q1.x * k1;
  dst.y = q0.y * k0 + q1.y * k1;
  dst.z = q0.z * k0 + q1.z * k1;
  dst.normalize();
}


