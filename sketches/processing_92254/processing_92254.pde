
//
// author: thomas diewald
//         http://thomasdiewald.com/blog/
//
// date: 07.03.2013
//
// KdTree nearest neighbor search.
// each pixel gets colored by the distance to its nearest neighbor
// which results in a voronoi-diagram.
//
// using a KdTree enables to have a huge number of points
// while keeping an interactive framerate.
//
//
// mouseX+mouseX ... number of points
// mousPressed ..... invert color
// key SPACE ....... display KdTree
//
//

import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Locale;


  Point[] points;
  
  public void setup() {
    size(600, 600, P2D);
  }
  
  public void draw() {
    
    // add/remove points
    assurePoints( (mouseX+mouseY)*3 );
 
    // update points positions
    for( Point p : points ){ 
      p.update();
    }
    
    // create kd-tree
    KdTree kd_tree = new KdTree(points);
    
    // render: either kd-tree or voronoi (nearest neighbor)
    if( keyPressed && key == ' '){
      
      background(255);
      kd_tree.draw(this.g, true, true, 0, 0, width, height);
      
    } else {
   
      float fs = (float) (0.6 * Math.log(Math.sqrt( points.length ))+.01) ;
      
      float r_comp = Math.max(Math.min(                           2*fs , 255),0);
      float g_comp = Math.max(Math.min(map(mouseY, 0, height, 0,  5*fs), 255),0);
      float b_comp = Math.max(Math.min(map(mouseX, 0, width,  0, 10*fs), 255),0);
      
      final boolean invert = mousePressed;
      
      loadPixels();
      {
        for (int y = 0; y < height; y +=2) {
          for (int x = 0; x < height; x +=2) {
            int px = y*width+x;
   
            float d = (float)Math.sqrt(kd_tree.getNN( new Point(x,y)).min_sq);
            
            int r = (int)Math.min((d*r_comp), 255);
            int g = (int)Math.min((d*g_comp), 255);
            int b = (int)Math.min((d*b_comp), 255);
   
            pixels[px]=
            pixels[px+1] =
            pixels[px+width] =  
            pixels[px+width+1] = invert ? ~ARGB(r,g,b) : ARGB(r,g,b);
          } 
        } 
      }
      updatePixels();
    }
    

    updateWindowTitle();
    
    drawInfoText();
  }

  
 

  final int ARGB(int r, int g, int b){
    return 0xFF000000 | r<<16 | g<<8  | b;
  }
  
  void drawInfoText(){
    if( frameCount < 10){
      textFont( createFont("Calibri", 12) );
      textMode(SCREEN);
    }
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
  
  
  
  void assurePoints(int num_points){
    if( points == null){
      points = new Point[0];
    } else {
      if( num_points == points.length ){
        return;
      }
    }
    Collections.shuffle(Arrays.asList(points));
    num_points = Math.max(num_points,1);
    int old_len = points.length;
    int new_len = num_points;
    if( new_len < old_len){
      points = Arrays.copyOf(points, new_len);
    } 
    if( new_len > old_len ){
      points = Arrays.copyOf(points, new_len);
      for(int i = old_len; i < new_len; i++){
        points[i] = new Point(random(0.0f, 5.5f));
      }
    }
  }
  
  public class Point{
    public float x, y, dx, dy;
    
    public Point(float x, float y){
      this.x = x;
      this.y = y;
    }

    public Point(float speed){
      int o = width/3;
      float a = random(TWO_PI);
      this.dx = speed*cos(a);
      this.dy = speed*sin(a);
//      this.x  = random(o, width-o);
//      this.y  = random(o, height-o);
      
      this.x = width /2 + random(0,       width/3)*cos(a);
      this.y = height/2 + random(width/4, width/3)*sin(a);
    }
    
    public void update(){
      if( (x+=dx) < 0 || x > width ) dx = -dx;
      if( (y+=dy) < 0 || y > height) dy = -dy;
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
    
//    private final static Quicksort quick_sort = new Quicksort();
    private final static Comparator<Point> SORT_X = new SortX();
    private final static Comparator<Point> SORT_Y = new SortY();
    
    private void build(final KdTree.Node node, final Point[] points){
      
      final int e = points.length;
      final int m = e>>1;

      if( e > 1 ){
        int depth = node.depth;
        Arrays.sort(points, ((depth&1)==0)?SORT_X:SORT_Y);
//        quick_sort.sort(points, depth&1); // faster than Arrays.sort() !
 
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
  
  
  
  
  
  


