
class Bone {
  private PMatrix3D mBindPoseInv;  // バインドポーズ
  private PMatrix3D mCurrPose;     // 
  private PMatrix3D mRotation;     // 回転行列

  Bone child;              // 子ボーン
  
  // List<Float> motionData;  // モーションデータ（ここでは回転角）
  
  Bone() {
    mBindPoseInv = new PMatrix3D();
    mCurrPose    = new PMatrix3D();
    mRotation    = new PMatrix3D();
    
    // motionData   = new ArrayList<Float>();
  }
  
  // コンストラクタ（初期位置・初期回転角）
  Bone(PVector t, float a) {
    this();
    mBindPoseInv.translate(t.x, t.y, t.z);
    mBindPoseInv.rotateZ(a);
  }
  
  
  void update(float angle) {
    update(new PMatrix3D(), angle);
  }
  
  void update(PMatrix3D mPrevPose, float newAngle) {
    PMatrix3D m = new PMatrix3D(mBindPoseInv);
    m.invert();
    
    mRotation.reset();
    mRotation.rotateZ(newAngle);
    
    m.preApply(mRotation);
    m.preApply(mBindPoseInv);
    m.preApply(mPrevPose);
    
    mCurrPose.set(m);

    if(child != null) {
      child.update(mCurrPose, newAngle);
    }    
  }
  
  void transform(PVector src, PVector dst) {
    mCurrPose.mult(src, dst);
  }  
}


