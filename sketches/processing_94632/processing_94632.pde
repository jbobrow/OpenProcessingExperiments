

//----------------------------------------------------------------------------
//
// author: (c) thomas diewald
// date: 28.03.2013
// 
// Convex Hull 3D: QuickHull Algorithm
//
// http://thomasdiewald.com/blog/?p=1888
//----------------------------------------------------------------------------



import java.util.Locale;
import peasy.*;




  DwConvexHull3D conv_hull;

  public void setup(){
    size(700, 700, P3D);
    
    PeasyCam cam = new PeasyCam(this, 0, 0, 0, 1500);
    cam.setRotations( -1.3968815, 0.71367186, -0.12572986);

//    long timer = System.currentTimeMillis();
    
    conv_hull = new DwConvexHull3D();
    conv_hull.DEBUG_MODE    = false; 
    conv_hull.DEBUG_VERBOSE = false;
    
    conv_hull.LIFO( true );
    conv_hull.cvhInit( createPointCloud(2).points );
    conv_hull.cvhBuild(0);

//    timer = System.currentTimeMillis()-timer;
//    System.out.println("");
//    System.out.println("  total time  "+timer+" ms");      
//    System.out.println("  iterations  "+conv_hull.numIterations());
//    System.out.println("  num faces   "+conv_hull.numFaces() +" (exact="+conv_hull.numFacesExact()+")");
//    System.out.println("  LIFO        "+conv_hull.LIFO());  
    
    conv_hull.DEBUG_MODE    = false; 
    conv_hull.DEBUG_VERBOSE = false;
    
    textFont( createFont("Verdana", 11));
    textMode( SCREEN );
  }
  
  
  
  PointCloud createPointCloud(int type){
//    long timer = System.currentTimeMillis();

    PointCloud point_cloud = new PointCloud(200); 
    
    switch(type){
      case 1: point_cloud.randomCube         ( 100000, 1000, 1000, 1000); break;
      case 2: point_cloud.centerSampleSphere ( 100000,  500,  500,  500); break;
      case 3: point_cloud.uniformSampleSphere( 100000,  500,  500,  500); break; // check: F = 2*V-4 (number of faces = 2*number of vertices - 4)
    }
    
//    timer = System.currentTimeMillis()-timer;
//    System.out.println("created pointcloud "+timer+" ms, points = "+point_cloud.num_points);
    return point_cloud;
  }
  

  @Override
  public void draw() {
    background(255);
    lights();

    conv_hull.draw( (PGraphics3D) this.g );

    updateInfoText();
    updateWindowTitle();
  }
  
  void updateInfoText(){

    int dy = 14;
    int x = 20;
    int y = 20;

    fill(0);
    
    String txt_what       = "Convex Hull 3D: Quickhull";
    
    String txt_num_points = "num points: "+conv_hull.numPoints();
    String txt_num_faces  = "num faces: "+conv_hull.numFaces();
    String txt_num_iter   = "num iterations: "+conv_hull.numIterations();
  
    String txt_iterations = "iterations [ UP, DOWN ]: "+iterations;
    String txt_stack      = "stack [ x,y ]: "+ (conv_hull.LIFO() ?  "depth first (LIFO)" : "breadth first (FIFO)");

    String txt_finished   = "finished [ f ]: "+conv_hull.finished();
    String txt_restart    = "restart [1,2,3]";
    
 
    
    text(txt_what      , x, y); y+= dy;
    y+= dy;
    text(txt_num_points, x, y); y+= dy;
    text(txt_num_faces , x, y); y+= dy;
    text(txt_num_iter  , x, y); y+= dy;
    y+= dy;
    text(txt_iterations, x, y); y+= dy;
    text(txt_stack     , x, y); y+= dy;
    y+= dy;
    text(txt_finished  , x, y); y+= dy;
    text(txt_restart   , x, y); y+= dy;
  }

  void updateWindowTitle(){
    if( online ) 
      return;
    String txt_title     = "QuickHull";
    String txt_framerate = String.format(Locale.ENGLISH, "fps %6.2f", frameRate);
    txt_title += " | " + txt_framerate;
    frame.setTitle(txt_title);
  }
  
  
  @Override
  public void keyPressed(){
    if( key == ESC && online) key = 0;
    
    if(  key == 'x' || key == 'y' ){  
      boolean LIFO = (key == 'x');
      conv_hull.LIFO( LIFO );
      conv_hull.cvhBuild(iterations);
    }
    
    if( key == CODED){
      if( keyCode == UP   ) iterations++;
      if( keyCode == DOWN ) iterations--;
      iterations = Math.max(iterations, 1);
    }
  }
  
  int iterations = 1; // iterations to process at once
 
  int screen_shot_nr = 0;
  @Override
  public void keyReleased(){
    if (key == 's' && !online ){
      String stack = ""+ (conv_hull.LIFO() ?  "LIFO" : "FIFO");
      String iter  = ""+ conv_hull.numIterations();
      String nr    = String.format("%02d", screen_shot_nr);
      String filename = "data/screenshot/diewald_quickhull_"+iter+"_"+stack+"_"+nr+".png";
      save(filename);
      System.out.println("saved image: "+filename);
    }
    

    if( key == '1' || key == '2' || key == '3' ){
      conv_hull.cvhInit( createPointCloud( key-'0' ).points );
    }
    
    if( key == 'f'){
      conv_hull.cvhBuild(-1);
    }
  }
  



