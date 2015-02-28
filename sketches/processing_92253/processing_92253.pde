
//
// author: thomas diewald
//         http://thomasdiewald.com/blog/
//
// date: 07.03.2013
//
// KdTree: structure and nearest neighbor search
//
// mousPressed ..... number of points
// key SPACE ....... display points (toggle)
//

import java.util.Arrays;
import java.util.Comparator;
import java.util.Locale;






  KdTree kd_tree;
  Point[] points;

  public void setup() {
    size(900, 700, P2D);
    frameRate(100);
    initPoints(2000, true);
  }
  
  void initPoints(int num_points, boolean debug){
    num_points = Math.max(1, num_points);
    
    // init random points
    float o = 40;
    randomSeed(10);
    points = new Point[num_points];
    for(int i = 0; i < points.length; i++){
      points[i] = new Point(random(o,width-o),random(o,height-o));
    }
    
    // build Kd-Tree
    long timer = System.currentTimeMillis();
    kd_tree = new KdTree(points);
    timer = System.currentTimeMillis()-timer;
    if( debug ){
      System.out.println("KdTree "+timer+" ms, points "+num_points);
    }
  }
  
  

  public void draw() {
    
    if( mousePressed || kd_tree == null){
      int num_points = (int)map(mouseX, 0, width, 0, 20000);
      num_points = Math.min(num_points, 20000);
//      num_points = 2048;
      initPoints(num_points, false);
    }
    background(255);

    
    kd_tree.draw(this.g, !keyPressed, true,  0, 0, width, height);

    // draw nearest neighbor connection
    {
      Point p = kd_tree.getNN( new Point(mouseX, mouseY)).pnt_nn;
      strokeWeight(2);
      stroke(255,125,0);
      line( mouseX, mouseY, p.x, p.y);
      
      float dis = dist( mouseX, mouseY, p.x, p.y);
      noFill();
      strokeWeight(1);
      fill(255,125,0,30);
      stroke(255,125,0);
      ellipse(mouseX, mouseY, dis*2, dis*2);
    }
    

    updateWindowTitle();
    drawInfoText();
 
  }
  
  
  
  void drawInfoText(){
    if( frameCount < 10){
      textFont( createFont("Calibri", 12) );
      textMode(SCREEN);
    }
    noStroke();
    fill(255,200);
    rect(0,0, 80, 40);
    fill(0);
    int y = 15;
    text("fps: "+String.format(Locale.ENGLISH, "%5.2f", frameRate), 5, y);
    text("points: "+points.length, 5, y+=15);
  }

  void updateWindowTitle(){
    if( online ) 
      return;
    String txt_title      = "nearest neighbor";
    String txt_framerate  = String.format(Locale.ENGLISH, "fps %6.2f", frameRate);
    String txt_num_points = String.format(Locale.ENGLISH, "points %d", points.length);
    txt_title += " | " + txt_framerate;
    txt_title += " | " + txt_num_points;
    frame.setTitle(txt_title);
  }
  
  

  public void keyPressed(){
    if( key == ESC && online) key = 0;
  }
  
  
  public void keyReleased(){
    if (key == 's' && !online ){
      String filename = "data/screenshot/diewald_KdTree2D.png";
      save(filename);
      System.out.println("saved image: "+filename);
    }
  }
  
  

  public static class Point{
    public float x, y;

    public Point(float x, float y){
      this.x = x;
      this.y = y;
    }
  }
  


  /**
   * simple KdTree (2D) implementation.<br>
   * current features: <br>
   *  - building <br>
   *  - drawing <br>
   *  - nearest-neighbor-search (NNS)<br>
   *  
   *  TODO: make it more flexible, because currently it depends on class "Point"<br>
   * 
   * @author thomas diewald
   *
   */
  public static class KdTree{

    int max_depth = 0;
    KdTree.Node root;
    
    
    public KdTree(Point[] points){
      max_depth = (int) Math.ceil( Math.log(points.length) / Math.log(2) );

      build( root = new KdTree.Node(0) , points);
      
//      if( numLeafs(root, 0) != points.length){
//        System.err.println("number of leafes doesnt match number of points");
//      }
    }

    
    
    //--------------------------------------------------------------------------
    // BUILD
    //--------------------------------------------------------------------------
    
    private final static Quicksort quick_sort = new Quicksort();
    //private final static Comparator<Point> SORT_X = new SortX();
    //private final static Comparator<Point> SORT_Y = new SortY();
    
    private void build(final KdTree.Node node, final Point[] points){
      
      final int e = points.length;
      final int m = e>>1;

      if( e > 1 ){
        int depth = node.depth;
        //Arrays.sort(points, ((depth&1)==0)?SORT_X:SORT_Y);
        quick_sort.sort(points, depth&1); // faster than Arrays.sort() !
 
        build( (node.L = new Node(++depth)), copy(points, 0, m));
        build( (node.R = new Node(  depth)), copy(points, m, e));
      }
      node.pnt = points[m];
    }
    
    private final static Point[] copy(final Point[] src, final int a, final int b){
      final Point[] dst = new Point[b-a]; 
      System.arraycopy(src, a, dst, 0, dst.length);
      return dst;
//      return Arrays.copyOfRange(src, a, b); // a bit slower, but less verbose
    }

    
    
    
    //--------------------------------------------------------------------------
    // ANALYSIS
    //--------------------------------------------------------------------------
    
    public int numLeafs(KdTree.Node n, int num_leafs){
      if( n.isLeaf() ){
        return num_leafs+1;
      } else {
        num_leafs = numLeafs(n.L, num_leafs);
        num_leafs = numLeafs(n.R, num_leafs);
        return num_leafs;
      }
    }
    

    

    //--------------------------------------------------------------------------
    // DISPLAY
    //--------------------------------------------------------------------------
    
    public void draw(PGraphics g, boolean points, boolean planes, float x_min, float y_min, float x_max, float y_max){
      if( planes ) drawPlanes(g, root, x_min, y_min, x_max, y_max);
      if( points ) drawPoints(g, root);
    }
    
    public void drawPlanes(PGraphics g, KdTree.Node node, float x_min, float y_min, float x_max, float y_max ){
      if( node != null ){
        Point pnt = node.pnt;
        if( (node.depth&1) == 0 ){
          drawPlanes(g, node.L, x_min, y_min, pnt.x, y_max);
          drawPlanes(g, node.R, pnt.x, y_min, x_max, y_max);
          drawLine  (g, node,   pnt.x, y_min, pnt.x, y_max);
        } else {
          drawPlanes(g, node.L, x_min, y_min, x_max, pnt.y);
          drawPlanes(g, node.R, x_min, pnt.y, x_max, y_max); 
          drawLine  (g, node,   x_min, pnt.y, x_max, pnt.y);
        }
      }
    }
    
    void drawLine(PGraphics g, KdTree.Node node, float x_min, float y_min, float x_max, float y_max){
      float dnorm = (node.depth)/(float)(max_depth+1);
      g.stroke(dnorm*150);
      g.strokeWeight( Math.max((1-dnorm)*5, 1) );
      g.line(x_min, y_min, x_max, y_max);
    }
    
    public void drawPoints(PGraphics g, KdTree.Node node){
      if( node.isLeaf() ){
        g.strokeWeight(1);g.stroke(0); g.fill(0,165,255);
        g.ellipse(node.pnt.x,node.pnt.y, 4, 4); 
      } else {
        drawPoints(g, node.L);
        drawPoints(g, node.R);
      }
    }
    

    
    
    
    
    //--------------------------------------------------------------------------
    // NEAREST-NEIGHBOR-SEARCH (NNS)
    //--------------------------------------------------------------------------
    
    public static class NN{
      Point pnt_in = null;
      Point pnt_nn = null;
      float min_sq = Float.MAX_VALUE;
      
      public NN(Point pnt_in){
        this.pnt_in = pnt_in;
      }
      
      void update(Node node){
        
        float dx = node.pnt.x - pnt_in.x;
        float dy = node.pnt.y - pnt_in.y;
        float cur_sq = dx*dx + dy*dy;

        if( cur_sq < min_sq ){
          min_sq = cur_sq;
          pnt_nn = node.pnt;
        }
      }
      
    }
    
    public NN getNN(Point point){
      NN nn = new NN(point);
      getNN(nn, root);
      return nn;
    }
    
    public NN getNN(NN nn, boolean reset_min_sq){
      if(reset_min_sq) nn.min_sq = Float.MAX_VALUE;
      getNN(nn, root);
      return nn;
    }
    
    private void getNN(NN nn, KdTree.Node node){
      if( node.isLeaf() ){
        nn.update(node);
      } else {
        float dist_hp = planeDistance(node, nn.pnt_in); 
        
        // check the half-space, the point is in.
        getNN(nn, (dist_hp < 0) ? node.L : node.R);
        
        // check the other half-space when the current distance (to the 
        // nearest-neighbor found so far) is greater, than the distance
        // to the other (yet unchecked) half-space's plane.
        if( (dist_hp*dist_hp) < nn.min_sq ){
          getNN(nn, (dist_hp < 0) ? node.R : node.L); 
        }
      }
    }
    
    private final float planeDistance(KdTree.Node node, Point point){
      if( (node.depth&1) == 0){
        return point.x - node.pnt.x;
      } else {
        return point.y - node.pnt.y;
      }
    }
    
    
    //--------------------------------------------------------------------------
    // KD-TREE NODE
    //--------------------------------------------------------------------------
    /**
     * KdTree Node.
     * 
     * @author thomas diewald
     *
     */
    public static class Node{
      int depth;
      Point pnt;
      Node L, R;
      
      public Node(int depth){
        this.depth = depth;
      }
      boolean isLeaf(){
        return (L==null) | (R==null); // actually only one needs to be teste for null.
      }
    }
    
  }
  
  
  
  
  
  //--------------------------------------------------------------------------
  // SOME SORTING
  //--------------------------------------------------------------------------
  
  public static final class SortX implements Comparator<Point>{
    //@Override
    public int compare(final Point a, final Point b) {
      return (a.x < b.x) ? -1 : ((a.x > b.x)? +1 : 0);
    }
  }
  public static final class SortY implements Comparator<Point>{
    //@Override
    public int compare(final Point a, final Point b) {
      return (a.y < b.y) ? -1 : ((a.y > b.y)? +1 : 0);
    }
  }
  
  
  /**
   * 
   * Quicksort in Java, Version 0.6
   * Copyright 2009-2010 Lars Vogel
   * 
   * http://www.vogella.com/articles/JavaAlgorithmsQuicksort/article.html
   * 
   * adapted by thomas diewald.
   *
   */
  public static class Quicksort  {
    private int dim = 0;
    private Point[] points;
    private Point points_t_;
    
    public void sort(Point[] points, int dim) {
      if (points == null || points.length == 0) return;
      this.points = points;
      this.dim = dim;
      quicksort(0, points.length - 1);
    }

    private void quicksort(int low, int high) {
      int i = low, j = high;
      Point pivot = points[low + ((high-low)>>1)];

      while (i <= j) {
        if( dim == 0 ){
          while (points[i].x < pivot.x) i++;
          while (points[j].x > pivot.x) j--;
        } else {
          while (points[i].y < pivot.y) i++;
          while (points[j].y > pivot.y) j--;
        }
        if (i <= j)  exchange(i++, j--);
      }
      if (low <  j) quicksort(low,  j);
      if (i < high) quicksort(i, high);
    }

    private void exchange(int i, int j) {
      points_t_ = points[i];
      points[i] = points[j];
      points[j] = points_t_;
    }
  } 
  

  


