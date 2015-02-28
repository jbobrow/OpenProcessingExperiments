
// **************************************
//
// Delaunay分割用クラス
//
// **************************************

class DelaunayTriangles {
  private List<PVector> pointList;
  // ======================================
  // コンストラクタ
  // 与えられた点のリストを基にDelaunay分割を行う
  // ======================================
  public DelaunayTriangles(List<PVector> pointList) {
    this.pointList = pointList;
  }
  
  
  // ======================================
  // Delaunay三角分割を行う
  // ======================================
  public HashSet<Triangle>
      getDelaunayTriangulationSet() {
    
    // 三角形リストを初期化
    HashSet<Triangle> triangleSet = new HashSet<Triangle>();
    
    // 巨大な外部三角形をリストに追加
    Triangle hugeTriangle = getHugeTriangle();
    triangleSet.add(hugeTriangle);

    try {
      // --------------------------------------
      // 点を逐次添加し、反復的に三角分割を行う
      // --------------------------------------
      for(Iterator pIter = pointList.iterator(); pIter.hasNext();) {
        Object element = pIter.next();
        Point p = element instanceof Point ? 
            (Point)element : new Point((PVector)element);
        
        // --------------------------------------
        // 追加候補の三角形を保持する一時ハッシュ
        // --------------------------------------
        // 追加候補の三角形のうち、「重複のないものだけ」を
        // 三角形リストに新規追加する
        //          → 重複管理のためのデータ構造
        // tmpTriangleSet
        //  - Key   : 三角形
        //  - Value : 重複していないかどうか
        //            - 重複していない : true
        //            - 重複している   : false
        // --------------------------------------
        HashMap<Triangle, Boolean> tmpTriangleSet 
          = new HashMap<Triangle, Boolean>();

        // --------------------------------------
        // 現在の三角形リストから要素を一つずつ取り出して、
        // 与えられた点が各々の三角形の外接円の中に含まれるかどうか判定
        // --------------------------------------
        for(Iterator tIter=triangleSet.iterator(); tIter.hasNext();){
          // 三角形リストから三角形を取り出して…
          Triangle t = (Triangle)tIter.next();
              
          // その外接円を求める。
          Circle c = getCircumscribedCirclesOfTriangle(t);
              
          // --------------------------------------
          // 追加された点が外接円内部に存在する場合、
          // その外接円を持つ三角形をリストから除外し、
          // 新たに分割し直す
          // --------------------------------------
          if (Point.dist(c.center, p) <= c.radius) {
            // 新しい三角形を作り、一時ハッシュに入れる
            addElementToRedundanciesMap(tmpTriangleSet,
              new Triangle(p, t.p1, t.p2));
            addElementToRedundanciesMap(tmpTriangleSet,
              new Triangle(p, t.p2, t.p3));
            addElementToRedundanciesMap(tmpTriangleSet,
              new Triangle(p, t.p3, t.p1));
            
            // 旧い三角形をリストから削除
            tIter.remove();            
          }
        }
        
        // --------------------------------------
        // 一時ハッシュのうち、重複のないものを三角形リストに追加 
        // --------------------------------------
        for(Iterator tmpIter = tmpTriangleSet.entrySet().iterator();
            tmpIter.hasNext();) {

          Map.Entry entry = (Map.Entry)tmpIter.next();
          Triangle t = (Triangle)entry.getKey();
          
          boolean isUnique = 
              ((Boolean)entry.getValue()).booleanValue();

          if(isUnique) {
            triangleSet.add(t);
          }
        }
      }
      
      // 最後に、外部三角形の頂点を削除
      for(Iterator tIter = triangleSet.iterator(); tIter.hasNext();){
        // 三角形リストから三角形を取り出して
        Triangle t = (Triangle)tIter.next();
        // もし外部三角形の頂点を含む三角形があったら、それを削除
        if(hugeTriangle.hasCommonPoints(t)) {
          tIter.remove();
        }
      }
      
      return triangleSet;
    } catch (Exception ex) {
      return null;
    }
  }

  // ======================================
  // 一時ハッシュを使って重複判定
  // hashMap
  //  - Key   : 三角形
  //  - Value : 重複していないかどうか
  //            - 重複していない : true
  //            - 重複している   : false
  // ======================================
  private void addElementToRedundanciesMap
      (HashMap<Triangle, Boolean> hashMap, Triangle t) {
    if (hashMap.containsKey(t)) {
      // 重複あり : Keyに対応する値にFalseをセット
      hashMap.put(t, new Boolean(false));
    } else {
      // 重複なし : 新規追加し、
      hashMap.put(t, new Boolean(true));
    }
  }
  
  // ======================================
  // 最初に必要な巨大三角形を求める
  // ======================================
  // 画面全体を包含する正三角形を求める
  private Triangle getHugeTriangle() {
    return getHugeTriangle(new PVector(0, 0), 
                           new PVector(width, height));    
  }
  // 任意の矩形を包含する正三角形を求める
  // 引数には矩形の左上座標および右下座標を与える
  private Triangle getHugeTriangle(PVector start, PVector end) {
    // start: 矩形の左上座標、
    // end  : 矩形の右下座標…になるように
    if(end.x < start.x) {
      float tmp = start.x;
      start.x = end.x;
      end.x = tmp;
    }
    if(end.y < start.y) {
      float tmp = start.y;
      start.y = end.y;
      end.y = tmp;
    }
    
    // 1) 与えられた矩形を包含する円を求める
    //      円の中心 c = 矩形の中心
    //      円の半径 r = |p - c| + ρ
    //    ただし、pは与えられた矩形の任意の頂点
    //    ρは任意の正数
    Point center = new Point( (end.x - start.x) / 2.0,
                              (end.y - start.y) / 2.0 );
    float radius = Point.dist(center, start) + 1.0;
    
    // 2) その円に外接する正三角形を求める
    //    重心は、円の中心に等しい
    //    一辺の長さは 2√3･r
    float x1 = center.x - sqrt(3) * radius;
    float y1 = center.y - radius;
    Point p1 = new Point(x1, y1);
    
    float x2 = center.x + sqrt(3) * radius;
    float y2 = center.y - radius;
    Point p2 = new Point(x2, y2);
    
    float x3 = center.x;
    float y3 = center.y + 2 * radius;
    Point p3 = new Point(x3, y3);

    return new Triangle(p1, p2, p3);    
  }
  
  // ======================================
  // 三角形を与えてその外接円を求める
  // ======================================
  private Circle getCircumscribedCirclesOfTriangle(Triangle t) {
    // 三角形の各頂点座標を (x1, y1), (x2, y2), (x3, y3) とし、
    // その外接円の中心座標を (x, y) とすると、
    //     (x - x1) * (x - x1) + (y - y1) * (y - y1)
    //   = (x - x2) * (x - x2) + (y - y2) * (y - y2)
    //   = (x - x3) * (x - x3) + (y - y3) * (y - y3)
    // より、以下の式が成り立つ
    //
    // x = { (y3 - y1) * (x2 * x2 - x1 * x1 + y2 * y2 - y1 * y1)
    //     + (y1 - y2) * (x3 * x3 - x1 * x1 + y3 * y3 - y1 * y1)} / c
    //
    // y = { (x1 - x3) * (x2 * x2 - x1 * x1 + y2 * y2 - y1 * y1)
    //     + (x2 - x1) * (x3 * x3 - x1 * x1 + y3 * y3 - y1 * y1)} / c
    //
    // ただし、
    //   c = 2 * {(x2 - x1) * (y3 - y1) - (y2 - y1) * (x3 - x1)}
    
    float x1 = t.p1.x;
    float y1 = t.p1.y;
    float x2 = t.p2.x;
    float y2 = t.p2.y;
    float x3 = t.p3.x;
    float y3 = t.p3.y;
    
    float c = 2.0 * ((x2 - x1) * (y3 - y1) - (y2 - y1) * (x3 - x1));
    float x = ((y3 - y1) * (x2 * x2 - x1 * x1 + y2 * y2 - y1 * y1)
             + (y1 - y2) * (x3 * x3 - x1 * x1 + y3 * y3 - y1 * y1))/c;
    float y = ((x1 - x3) * (x2 * x2 - x1 * x1 + y2 * y2 - y1 * y1)
             + (x2 - x1) * (x3 * x3 - x1 * x1 + y3 * y3 - y1 * y1))/c;
    Point center = new Point(x, y);
    
    // 外接円の半径 r は、半径から三角形の任意の頂点までの距離に等しい
    float r = Point.dist(center, t.p1);
    
    return new Circle(center, r);
  }
}

// **************************************
//
// 三角形クラス
//
// **************************************

class Triangle{
  public Point p1, p2, p3;  // 頂点
  
  // ======================================
  // コンストラクタ
  // 3頂点を与えて三角形をつくるよ
  // 頂点はPointで与えてもOK
  // ======================================
  public Triangle(PVector p1, PVector p2, PVector p3){
    this.p1 = p1 instanceof Point ? (Point)p1 : new Point(p1);
    this.p2 = p2 instanceof Point ? (Point)p2 : new Point(p2);
    this.p3 = p3 instanceof Point ? (Point)p3 : new Point(p3);
  }
  
  // ======================================
  // 同値判定
  // ======================================
  public boolean equals(Object obj) {
    try {
      Triangle t = (Triangle)obj;
      // ※ 同値判定に頂点を用いると、
      // 三角形の頂点の順番を網羅的に考慮する分条件判定が多くなる。
      return(p1.equals(t.p1) && p2.equals(t.p2) && p3.equals(t.p3) ||
             p1.equals(t.p2) && p2.equals(t.p3) && p3.equals(t.p1) ||
             p1.equals(t.p3) && p2.equals(t.p1) && p3.equals(t.p2) ||
              
             p1.equals(t.p3) && p2.equals(t.p2) && p3.equals(t.p1) ||
             p1.equals(t.p2) && p2.equals(t.p1) && p3.equals(t.p3) ||
             p1.equals(t.p1) && p2.equals(t.p3) && p3.equals(t.p2) );
    } catch (Exception ex) {
      return false;
    }
  }
    
  // ======================================
  // ハッシュ表で管理できるよう、hashCodeをオーバーライド
  // ======================================
  public int hashCode() {
    return 0;
  }
  
  // ======================================
  // 他の三角形と共有点を持つか
  // ======================================  
  public boolean hasCommonPoints(Triangle t) {
    return (p1.equals(t.p1) || p1.equals(t.p2) || p1.equals(t.p3) ||
            p2.equals(t.p1) || p2.equals(t.p2) || p2.equals(t.p3) ||
            p3.equals(t.p1) || p3.equals(t.p2) || p3.equals(t.p3) );
  }
}

// **************************************
//
// 円クラス
//
// **************************************

class Circle {
  // 中心座標と半径
  Point center;
  float radius;
  
  // ======================================
  // コンストラクタ
  // 中心座標と半径を与えて円をつくるよ
  // ======================================
  public Circle(PVector c, float r){
    this.center = c instanceof Point ? (Point) c : new Point(c);
    this.radius = r;
  }
}

// **************************************
//
// 点クラス
//
// **************************************

class Point extends PVector {
  // ======================================
  // コンストラクタ
  // ======================================
  public Point() {
    super();
  }
  public Point(float x, float y) {
    super(x, y);
  }
  public Point(float x, float y, float z) {
    super(x, y, z);
  }
  public Point(PVector v) {
    this.x = v.x;
    this.y = v.y;
    this.z = v.z;
  }
  
  // ======================================
  // 同値判定
  // ======================================
  public boolean equals(Object o) {
    boolean retVal;
    try {
      PVector p = (PVector)o;
      return (x == p.x && y == p.y && z == p.z);
    } catch (Exception ex) {
      return false;
    }
  }
}

