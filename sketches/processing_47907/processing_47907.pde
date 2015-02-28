
  // Processing
  
  import processing.xml.*;
  import processing.core.*;
  //import peasy.org.apache.commons.math.*;
  //import peasy.org.apache.commons.math.geometry.*;
  import controlP5.*;
  // not for applet
  // if(!online)
  //import processing.opengl.*;
  
  public final static int FORWARD = 1;
public final static int BACKWARD = 2;
public final static int RIGHTWARD = 4;
public final static int LEFTWARD = 8;
public final static int UPWARD = 16;
public final static int DOWNWARD = 32;
public int direction = 0;
public int last_direction = 0;
public float lmx,lmy,dx,dy;
public final static float MAX_SPEED = 5.0f;
public final static float MIN_SPEED = 1.0f;
public float speed = 5.0f;
public float wd = 1600;
public float hh = 900;
public float dp = 1000;
public PVector forward_heading;
public PVector back_heading,left_heading,right_heading,up_heading,down_heading;
public PVector straight_up, straight_left, straight_down, straight_right, straight_forward, straight_back;
public ArrayList lines;
  public int appletMode=1;
  public int diameter = 100;
  public float scalar;
  public int longest;
  public double ttheta;
 // public Rotation r;
  public int double_click;
  public float sbxs,sbys;
  
  
  public PMatrix3D currCameraMatrix;
  public PGraphics3D g3;
  
  public ControlP5 controlP5;
  public int in_a_control = 0;
  public ControlP5 basics_panel;
  public int basics_panel_active = 0;
  public ControlP5 matrix_panel;
  public int matrix_panel_active = 0;
  public ControlP5 ev_panel;
  public int ev_panel_active = 0;
  public int instructions_panel_active = 0;
  public int ev1_sz, ev2_sz, ev3_sz, ev4_sz, ev5_sz;
  public int ev_sz = 138, ev_sz_actv = 150;
  public int mpa_sz, mpl_sz, mpd_sz;
  public int m_sz = 100, m_sz_actv = 168;
  public int mpa_sd, mpl_sd, mpd_sd;
  public float m_actv_delta = (m_sz_actv-m_sz)/2.0f;
  public int counter = 0;
  public PFont face;
  public float th_constant; 
  
  public Graph g1;
  
  class Line {
  public PVector another;
  public PVector yetanother;
  public color lc;

  public Line( float ax, float ay, float az, float tx, float ty, float tz ) {
    another = new PVector(ax,ay,az);
    yetanother = new PVector(tx,ty,tz);
    lc = color (180,200,200,200);
  }  
  
  public void draw() {
     stroke(lc);
     line(another.x,another.y,another.z,yetanother.x,yetanother.y,yetanother.z);  
  }
}

class Box {
  public PVector pos;
  public color bc;
  public int bradius;
  public float sum;
  public int tag;
  
  public Box() {
    bradius = 300;
    pos = new PVector(random(2*wd)-wd,0,random(2*dp)-dp);
    bc = color(random(360),200,200,180);
  }  
  
  public void draw() {
    translate(pos.x,pos.y,pos.z);
    fill(bc);
    box(bradius);
  }
}

public ArrayList acopy( ArrayList b ) {
  ArrayList acopy = new ArrayList(b.size());
  int as = acopy.size();
  for(int i = 0; i < as;i++) {
    acopy.add(b.get(i));
  }  
  return acopy;
}

  
  void setup() {
    // For applet
    face = createFont("MingLiU",40);
    textSize(20);
    th_constant = textAscent();
    textFont(face);
    int xw = (screenWidth*15)/16;
    int yh = (screenHeight*7)/8;
    //applet
    //m_sz = 100;
    //m_sz_actv = 110;
    //m_actv_delta = (m_sz_actv-m_sz)/2.0f;
    //if(!online)
    //size(xw,yh, P3D);
    //else
    size(900,568,P3D);
    sbxs = width/50;
    sbys = -height/50;
    rectMode(CENTER);
    colorMode(HSB,360,255,255,255);
    longest = width < height ? 1 : 0;
    scalar = width < height ? width : height;
    //tthea = tan(scalar);
    g3 = (PGraphics3D)g;
    background(0);
    setup_controls();
    g1 = new Graph();
    g1.random_graph();
    g1.layout();
    dvals();
    make_normals();
    make_grid();
    //smooth();
    // not for applet
  }
  
  public void make_grid() {
  float spacing = 100;
  lines = new ArrayList((int)(2*(wd+dp)/spacing + 1));
  stroke(200,255,255,255);
  for(float i = -wd; i <= wd; i+=spacing) {
    Line nl = new Line(i,0,-dp,i,0,dp);
    lines.add(nl);
  }
  for(float i = -dp; i <= dp; i+= spacing) {
    Line nl = new Line(-wd,0,i,wd,0,i);
    lines.add(nl);
  }  
  stroke(0,0,0,255);
}
  
  
  public void setup_controls() {
    controlP5 = new ControlP5(this);
    controlP5.setAutoDraw(false);
    
    setup_basics_panel();
    Toggle t1 = controlP5.addToggle("bp", false, (longest == 1)? 0 : width/2-100, (longest==1)? height/2-100 : height-20, 200, 20 ); 
    t1.captionLabel().set(null);
    
    setup_matrix_panel();
    t1 = controlP5.addToggle("mp", false, (longest == 1)? width/2-100 : 0, (longest==1)? height-20 : height/2-100, 20, 200 );
    t1.captionLabel().set(null);
    
    setup_ev_panel();
    t1 = controlP5.addToggle("vp", false, (longest == 1)? width/2-100 : width-20, (longest==1)? 20 : height/2-100, 20, 200   );
    t1.captionLabel().set(null);
    
    t1 = controlP5.addToggle("ip", false, (longest == 1)? 0 : width/2-100, (longest==1)? height/2-100 : 0, 200, 20);
    t1.captionLabel().setFont(ControlP5.grixel).adjust();
    t1.captionLabel().set(" Help");
   }
 

 public void setup_ev_panel() {
   ev_panel = new ControlP5(this);
   ev_panel.setAutoDraw(false);
   float flash = height / 6;
   ev1_sz = ev_sz;
   ev2_sz = ev_sz;
   ev3_sz = ev_sz;
   ev4_sz = ev_sz;
   ev5_sz = ev_sz;
      
 }
 
 public void draw_ev_panel() {
   float flash = height / 6;
   if(g1.y1 != null) {
     draw_ev(0, g1.y1_normed, (longest == 1)? 33 : width-171, (longest==1)? height-233 : flash, ev1_sz );
     draw_ev(1, g1.y2_normed, (longest == 1)? width/2-100 : width-171, (longest==1)? height-233 : 2*flash, ev2_sz );
     draw_ev(2, g1.y3_normed, (longest == 1)? width-233 : width-171, (longest==1)? height-233 : 3*flash, ev3_sz );
     draw_ev(3, g1.y4_normed, (longest == 1)? 33 : width-171, (longest==1)? height-233 : 4*flash, ev1_sz );
     draw_ev(4, g1.y5_normed, (longest == 1)? width/2-100 : width-171, (longest==1)? height-233 : 5*flash, ev2_sz );
   }
   ev_panel.draw();  
 }
 
 public void plot_v(ArrayList y, float xc, float yc, int sz, int highlight, boolean anchored) {
   int ys = y.size();
   int xstep = sz/ys;
   if(xstep < 1)
     xstep = 1;
   float  lx = xc;
   float  ly = yc;
   if(anchored) {
     strokeWeight(1);
     stroke(360,255,250,255);
     line(lx,ly,lx+ys*xstep,ly);
   }
   for(int i = 0; i < ys;i++) {
     float vi = (Float)y.get(i);
     float xi = xc+i*xstep;
     float yi = yc-vi;
     strokeWeight(1);
     stroke(255,255,255,255);    
     if(!anchored) {
       if(i > 0)
         line(lx,ly,xi,yi);
     }
     else
       line(lx,ly,xi,yi);
     if(i == highlight)
       rect(xi,yi,7,7);
     lx = xi;
     ly = yi;
   }
   if(anchored) {
     line(lx,ly,xc+ys*xstep,yc);
   }
 }
 
 public void draw_ev(int index, ArrayList y, float xc, float yc, int sz ) {
   rectMode(CORNER);
   strokeWeight(1);
   stroke(360,255,250,255);
   noFill();
   rect(xc-sz-3,yc-105,sz,105);
   plot_v(g1.vs, xc-sz+5, yc, sz, index, false);
   plot_v(y, xc+3, yc, sz, -1, true);
 }
 
 public void setup_matrix_panel() {
    mpa_sz = m_sz;
    mpa_sd = 0;
    mpl_sz = m_sz;
    mpl_sd = 0;
    mpd_sz = m_sz_actv;
    mpd_sd = 1;
 }
  
 public void draw_matrix_panel() {
    float m1x =  (longest == 1)? 53 : 53;
    float m1y =  (longest==1)? height-253 : 53;
    show_matrix_f( 0, m1x, m1y, mpa_sz ); 
    float m2x = (longest == 1)? width/2 : 53;
    float m2y = (longest==1)? height-253 : height/2-100;
    show_matrix_f( 1, m2x, m2y, mpl_sz );
    float m3x = (longest == 1)? width-253 : 53;
    float m3y = (longest==1)? height-253 : height-253;
    show_matrix_f( 2, m3x, m3y, mpd_sz );
 }
 
 public void show_matrix_f( int index, float xc, float yc, int sz ) {
   PGraphics m = (PGraphics)g1.matrix_cache.get(index);
   if(m != null) {
     if(sz == m_sz) {
       image((PImage)g1.matrix_cache.get(index), xc, yc, sz, sz);
     }
     else if(sz == m_sz_actv) {
       image((PImage)g1.matrix_cache.get(index), xc, yc, sz, sz);
     }
   }
   else {
     rectMode(CORNER);
     fill(0,0,128,128);
     rect(xc+m_sz/5,yc+m_sz/5,m_sz/2,m_sz/2);
     rectMode(CENTER);
   }
 }
 
 public void setup_basics_panel() {
    basics_panel = new ControlP5(this);
    basics_panel.setAutoDraw(false);
    
    Slider s1 = basics_panel.addSlider("s",1,255,(longest == 1)? 53 : width/2-110, (longest==1)? height/2-110 : height-53,200,20);
    s1.captionLabel().set("Vertex size");
    s1.setValue(40);
    
    s1 = basics_panel.addSlider("n",1,360,(longest == 1)? 53 : width/2+200, (longest==1)? height/2+200 : height-53,200,20);
    s1.captionLabel().set("Color Range Min");
    s1.setValue(0);
    
    s1 = basics_panel.addSlider("x",0,360,(longest == 1)? 33 : width/2+200, (longest==1)? height/2+200 : height-33,200,20);
    s1.captionLabel().set("Color Range Max");
    s1.setValue(360);
    
    s1 = basics_panel.addSlider("l",1,2046,(longest == 1)? 53 : width/2-400, (longest==1)? height/2-400 : height-53,200,20);
    s1.captionLabel().set("Edge Length");
    s1.setValue(height/2.0f);
    
    s1 = basics_panel.addSlider("ec",0,360,(longest == 1)? 53 : width/2-400, (longest==1)? height/2-400 : height-33,200,20);
    s1.captionLabel().set("Edge Color");
    s1.setValue(141);
    
    s1 = basics_panel.addSlider("srd",1.0f,height/2.0f,(longest == 1)? 153 : width/2-400, (longest==1)? height/2-400 : height-153,200,20);
    s1.captionLabel().set("Sphere Radius");
    s1.setValue(100.0f);
   
    Toggle t1 = basics_panel.addToggle("v", false, (longest == 1)? 103 : width/2+90, (longest==1)? height/2+90 : height-103,17,20);
    t1.captionLabel().setFont(ControlP5.grixel).adjust();
    t1.captionLabel().set("Eigensizing");
    t1.setState(true);
   
    t1 = basics_panel.addToggle("c", false, (longest == 1)? 103 : width/2+400, (longest==1)? height/2+400 : height-103,17,20);
    t1.captionLabel().setFont(ControlP5.grixel).adjust();
    t1.captionLabel().set("Eigencoloring");
    t1.setState(true);
   
    t1 = basics_panel.addToggle("ecl", false, (longest == 1)? 103 : width/2-400, (longest==1)? height/2-400 : height-103,17,20);
    t1.captionLabel().setFont(ControlP5.grixel).adjust();
    t1.captionLabel().set("Vertex-Colored Edges");
    t1.setState(true);
    
    Radio r1 = basics_panel.addRadio("rp1", 200, 100);
    r1.deactivateAll();
    r1.add("Sphere", 0);
    r1.add("Space", 1);
    r1.add("City", 2);
    r1.add("Plane", 3);
    r1.activate("Space");
 }
 
  
  public void controlEvent(ControlEvent theEvent) {
    in_a_control = 1;
    String source = theEvent.name();
    if(source == "s") {
      g1.vertex_size_range = theEvent.value();
      g1.embed();  
    }
    else if (source == "rp1") {
      switch((int)theEvent.value()) {
       case(0):
         g1.projectionStyle = g1.SPHERE;
         break;
       case(1):
         g1.projectionStyle = g1.SPACE;
         break;
       case(2):
         g1.projectionStyle = g1.CITY;
         break;
       case(3):
         g1.projectionStyle = g1.FLAT;
         break;
     }
     g1.embed();
    }
    else if (source == "n") {
      g1.vertex_color_range_min = theEvent.value();
      Slider s1 = (Slider)basics_panel.controller("x");
      if( s1.value() < g1.vertex_color_range_min ) {
        s1.setValue(g1.vertex_color_range_min);  
     }
     g1.embed();
    }
    
    else if (source == "x") {
     g1.vertex_color_range_max = theEvent.value();
     Slider s1 = (Slider)basics_panel.controller("n");
     if( s1.value() > g1.vertex_color_range_max ) {
       s1.setValue(g1.vertex_color_range_max); 
     }
     g1.embed();
    }
    else if (source == "l") {
      g1.edge_length = theEvent.value();
      g1.embed();
    }
    else if (source == "v") {
      g1.vertex_size_lock ^= 1;  
      g1.embed();
    }
    else if (source == "c") {
      g1.vertex_color_lock ^= 1;
      g1.embed();  
    }
    else if (source =="ec") {
      g1.edgeColor = color(theEvent.value(),230,230,100);
      g1.edgeColorB = color(140,250,250,250);
    }
    else if (source == "srd") {
      g1.srd = theEvent.value();
      g1.embed();  
    }
    else if (source == "ecl") {
      g1.edgeColorLockOn ^= 1;
      g1.embed();
    }
    else if (source == "xv" ) {
      g1.eigen_permutation[0] = (int)theEvent.value();
      g1.embed();
    }
    else if (source == "yv" ) {
      g1.eigen_permutation[1] = (int)theEvent.value();
      g1.embed();
    }
    else if (source == "zv" ) {
      g1.eigen_permutation[2] = (int)theEvent.value();
      g1.embed();
    }
    else if (source == "sv" ) {
      g1.eigen_permutation[3] = (int)theEvent.value();
      g1.embed();
    }
    else if (source == "cv" ) {
      g1.eigen_permutation[4] = (int)theEvent.value();
      g1.embed();
    }
    else if (source == "bp" ) {
      basics_panel_active ^= 1;  
    }
    else if (source == "mp" ) {
      matrix_panel_active ^= 1;  
    }
    else if(source == "vp" ) {
      ev_panel_active ^= 1;  
    }
    else if(source == "ip") {
      instructions_panel_active ^= 1;
      Toggle t1 = (Toggle)theEvent.controller();
      if(instructions_panel_active == 1) {
        t1.captionLabel().set(null);
      }
      else {
        t1.captionLabel().set("Help");
      }  
    }
    else if (source.startsWith("ev")) {
      Toggle src = (Toggle)theEvent.controller();
      if(source == "ev1" ) {
        src.captionLabel().set(get_feature_names(0));    
      }
      else if(source == "ev2" ) {
         src.captionLabel().set(get_feature_names(1));    
      }
      else if(source == "ev3" ) {
        src.captionLabel().set(get_feature_names(2));    
      }
      else if(source == "ev4" ) {
        src.captionLabel().set(get_feature_names(3));    
      }
      else if(source == "ev5" ) {
        src.captionLabel().set(get_feature_names(4));    
      }
    }
    if(g1.leasthops == null) 
      g1.layout();
}

  public String get_feature_names(int ev_num) {
    String fn = "";
    Toggle t1 = (Toggle)ev_panel.controller("ev_x");
    if(t1.getState()) {
        g1.eigen_permutation[0] = ev_num;
        fn += t1.name() + " ";
        t1.toggle();
    }
    t1 = (Toggle)ev_panel.controller("ev_y");
    if(t1.getState()) {
        g1.eigen_permutation[1] = ev_num;
        fn += t1.name() + " ";
        t1.toggle();
    }
    t1 = (Toggle)ev_panel.controller("ev_z");
    if(t1.getState()) {
        g1.eigen_permutation[2] = ev_num;
        fn += t1.name() + " ";
        t1.toggle();
    }
    t1 = (Toggle)ev_panel.controller("ev_s");
    if(t1.getState()) {
        g1.eigen_permutation[3] = ev_num;
        fn += t1.name() + " ";
        t1.toggle();
    }
    t1 = (Toggle)ev_panel.controller("ev_c");
    if(t1.getState()) {
        g1.eigen_permutation[4] = ev_num;
        fn += t1.name() + " ";
        t1.toggle();
    }
    
    return fn;
  }
  
  public void draw_grid() {
 
  int linum = lines.size();
  for(int i = 0; i < linum;i++) {
    Line lin = (Line)lines.get(i);
    lin.draw();
  }  
}

 
  void draw() {
       in_a_control = 0;
       background(0);
       draw_grid();
       g1.draw();
       currCameraMatrix = new PMatrix3D(g3.camera);
       camera();
       if(matrix_panel_active != 0)
        draw_matrix_panel();
       draw_controls();
       g3.camera = currCameraMatrix;
       update_heading();
  }
  
  public void draw_controls() {
     controlP5.draw();
     //draw_touchpads();
     if(basics_panel_active != 0)
        basics_panel.draw(); 
     if(ev_panel_active != 0)
        draw_ev_panel();
    if(instructions_panel_active != 0)
      draw_instructions();
   // draw_texts();
  }
  
  public void draw_instructions() {
    float th = 1.618*th_constant;
    float xo = width/8;
    float yo = height/4;
    textSize(20);
    fill(0,0,50,150);
    rectMode(CORNER);
    rect(xo,yo,screenWidth*2/3,22*th);
    rectMode(CENTER);
    fill(120,250,250,230);
    text("k - toggle directed",xo+33,yo+th);  
    text(", - layout",xo+33,yo+2*th);  
    text("b - re-box",xo+33,yo+3*th);  
    text("f - display an xml or xml map file",xo+33,yo+4*th);  
    text("j - highlight connected component (use with d)",xo+33,yo+5*th);  
    text("p - highlight all paths. To use: select a vertex, toggle p, hover or select another vertex",xo+33,yo+6*th);  
    text("esc - quit",xo+33,yo+7*th);  
    text("r - new random graph",xo+33,yo+8*th);
    text("mouse : left-drag to rotate, centre-button-drag to translate, right-drag to zoom",xo+33,yo+9*th);
    text("mouse : click to select/unselect, double click to unselect all",xo+33,yo+10*th);
    text("mouse : triple click to reset model.",xo+33,yo+11*th);
    text("h - toggle Focus mode",xo+33,yo+12*th);  
    text("e - toggle edges display",xo+33,yo+13*th);  
    text("v - toggle vertices display",xo+33,yo+14*th);  
    text("i - toggle hide mode (click on a vertext to hide it)",xo+33,yo+15*th);
    text("    when off, clicking on partially displayed vertices unhides their neighbours",xo+33,yo+16*th);
    text("left menu panel - control of matrices chosen for layout : adjacency, laplacian, shortest distance",xo+33,yo+17*th);
    text("bottom menu panel - control of edge length, vertext size",xo+33,yo+18*th);
    text("                    toggle size norming (normed by default), color range",xo+33,yo+19*th);
    text("                    toggle color norming (normed by default)",xo+33,yo+20*th);
    text("right menu panel - view of eigen values (left), and first 5 eigenvectors",xo+33,yo+21*th);
  }
  
  /**
  public void draw_touchpads ( ) {
    float cz = (float)cam.getDistance();
    float[] pos = cam.getPosition();
    float[] la = cam.getLookAt();
    float[] cam_rots = cam.getRotations();
    peasy.org.apache.commons.math.geometry.Vector3D cl = new peasy.org.apache.commons.math.geometry.Vector3D(la[0],la[1],la[2]);
    peasy.org.apache.commons.math.geometry.Vector3D cp = new peasy.org.apache.commons.math.geometry.Vector3D(-pos[0],-pos[1],-pos[2]);
    Rotation inv_cam = new Rotation(RotationOrder.ZYX, -cam_rots[2], -cam_rots[1], -cam_rots[0]);
    int ns = g1.nodes.size();
    for(int i = 0; i < ns;i++) {
      Node nd = (Node)g1.nodes.get(i);
      if(nd == null)
        continue;
      peasy.org.apache.commons.math.geometry.Vector3D ndp = new peasy.org.apache.commons.math.geometry.Vector3D(nd.position.x,nd.position.y,nd.position.z);
      ndp = inv_cam.applyTo(ndp.subtract(cl));
      fill(nd.selectcolor);
      float ndx = (float)(((ndp.getX()))); 
      float ndy = (float)(((ndp.getY())));
      float ndz = (float)(((ndp.getZ())));
      // for applet
      //float shifts = 1.0f;
      //if(online)
      //  float shifts = (float)((height-64)/(cz-ndp.getZ()));
      //else
      float shifts = (float)((height-100)/(cz-ndp.getZ()));
      rect((float)(ndx*shifts+width/2.0),(float)(ndy*shifts+height/2.0),(float)nd.radius*shifts, (float)nd.radius*shifts);
      text(nd.num+"",(float)(ndx*shifts+width/2.0),(float)ndy*shifts+height/2.0-nd.radius*shifts/1.618);
    }  
  }
  **/
  
  /**
  public void draw_texts ( ) {
    float cz = (float)cam.getDistance();
    float[] pos = cam.getPosition();
    float[] la = cam.getLookAt();
    float[] cam_rots = cam.getRotations();
    peasy.org.apache.commons.math.geometry.Vector3D cl = new peasy.org.apache.commons.math.geometry.Vector3D(la[0],la[1],la[2]);
    peasy.org.apache.commons.math.geometry.Vector3D cp = new peasy.org.apache.commons.math.geometry.Vector3D(-pos[0],-pos[1],-pos[2]);
    Rotation inv_cam = new Rotation(RotationOrder.ZYX, -cam_rots[2], -cam_rots[1], -cam_rots[0]);
    int ns = g1.nodes.size();
    for(int i = 0; i < ns;i++) {
      Node nd = (Node)g1.nodes.get(i);
      if(nd == null)
        continue;
      if(nd.selected + nd.hovered == 0)
        continue;
      if(nd.label.length() + nd.special.length() == 0)
        continue;
      peasy.org.apache.commons.math.geometry.Vector3D ndp = new peasy.org.apache.commons.math.geometry.Vector3D(nd.position.x,nd.position.y,nd.position.z);
      ndp = inv_cam.applyTo(ndp.subtract(cl));
      fill(nd.selectcolor);
      float ndx = (float)(((ndp.getX()))); 
      float ndy = (float)(((ndp.getY())));
      float ndz = (float)(((ndp.getZ())));
      // for applet
      //float shifts = 1.0f;
      //if(online)
      //  float shifts = (float)((height-64)/(cz-ndp.getZ()));
      //else
      float shifts = (float)((height-100)/(cz-ndp.getZ()));
      strokeWeight(1);
      stroke(color(0,0,255,255));
      textSize(20);
      float tw = textWidth(nd.label) <textWidth(nd.special) ? textWidth(nd.special)*1.2f : textWidth(nd.label)*1.2f;
      float th = textAscent();
      //textSize(10);
      fill(0,0,50,255);
      rectMode(CORNER);
      float tsx = tw*0.309;
      float tsh = th*0.618;
      rect((float)(ndx*shifts+width/2.0f)+sbxs,(float)ndy*shifts+height/2.0f-th+sbys, tw*1.618, 3.236*th);
      rectMode(CENTER);
      fill(color(0,0,255,200));
      text(nd.label,(float)(ndx*shifts+width/2.0f)+tsx+sbxs,(float)ndy*shifts+height/2.0f+sbys+tsh);
      textSize(14);
      text(nd.special,(float)(ndx*shifts+width/2.0f)+tsx+sbxs,(float)ndy*shifts+height/2.0f+sbys+tsh+th);
      if(nd.partial_display >= 0) {
        if(nd.storage_type == nd.MEM_STORAGE)
          text(" +" + nd.undirectededges.size() );
        else if(nd.storage_type == nd.LEGACY_STORAGE)
          text(" +" + nd.serial.getChildCount() );
      }
    }  
  }
  **/
  public void keyPressed(){
  if(key != CODED)
    switch(key) {
      case('w'):case('W'):direction |=FORWARD; last_direction = FORWARD; break;
      case('d'):case('D'):direction |=RIGHTWARD; last_direction = RIGHTWARD; break;
      case('s'):case('S'):direction |=BACKWARD; last_direction = BACKWARD; break;
      case('a'):case('A'):direction |=LEFTWARD; last_direction = LEFTWARD; break;
      case(' '):direction |=UPWARD; last_direction = UPWARD; break;
          case 'j':
           g1.allPaths ^= 1;
           g1.pointToPointOn = 0;
           break;
         case ',':
           g1.layout();
           //g1.boxinate();
           break;
         case 'f':
           g1 = new Graph();
           g1.load(this);
           break;
         case 'i':
           g1.hideOn ^= 1;
           break;
         case 'b':
           if( g1.xv == null )
             g1.layout();
           g1.boxinate();
           break;
         case 'r':
          g1 = new Graph();
          g1.random_graph();
          break;
         case 'k':
           g1.directedOn ^= 1;
           update_selected();
           break;
         case 'p':
           g1.pointToPointOn ^= 1;
           g1.allPaths = 0;
           break;
         case 'e':
          g1.edgesOn ^= 1;
          break;
         case 'h':
          g1.hoverOnlyOn ^= 1;
          break;
         case 'v':
          g1.verticesOn ^= 1;
          break;
         case 'm':
          g1.curvesOn ^= 1;
          break;
         case 'c':
           g1.crossings();
           break;
      }  
  else {
    switch(keyCode) {
       case(CONTROL):direction |=DOWNWARD; last_direction = DOWNWARD; break;
       case(SHIFT):
         if(speed > MIN_SPEED) {
           speed = MIN_SPEED; 
           break;
         }
    }
  }
}
 
public void keyReleased(){  
  if(key != CODED)
    switch(key) {
      case('w'):case('W'):direction ^=FORWARD; last_direction = FORWARD; break;
      case('d'):case('D'):direction ^=RIGHTWARD; last_direction = RIGHTWARD; break;
      case('s'):case('S'):direction ^=BACKWARD; last_direction = BACKWARD; break;
      case('a'):case('A'):direction ^=LEFTWARD; last_direction = LEFTWARD; break;
      case(' '):direction ^=UPWARD; last_direction = UPWARD; break;
         case 'j':
           g1.allPaths ^= 1;
           g1.pointToPointOn = 0;
           break;
         case ',':
           g1.layout();
           //g1.boxinate();
           break;
         case 'f':
           g1 = new Graph();
           g1.load(this);
           break;
         case 'i':
           g1.hideOn ^= 1;
           break;
         case 'b':
           if( g1.xv == null )
             g1.layout();
           g1.boxinate();
           break;
         case 'r':
          g1 = new Graph();
          g1.random_graph();
          break;
         case 'k':
           g1.directedOn ^= 1;
           update_selected();
           break;
         case 'p':
           g1.pointToPointOn ^= 1;
           g1.allPaths = 0;
           break;
         case 'e':
          g1.edgesOn ^= 1;
          break;
         case 'h':
          g1.hoverOnlyOn ^= 1;
          break;
         case 'v':
          g1.verticesOn ^= 1;
          break;
         case 'm':
          g1.curvesOn ^= 1;
          break;
         case 'c':
           g1.crossings();
           break;
      }  
  else
    switch(keyCode) {
       case(CONTROL):direction ^=DOWNWARD; last_direction = DOWNWARD; break;
       case(SHIFT):
         if(speed < MAX_SPEED) {
           speed = MAX_SPEED; 
           break;
         }
    }
}

public void update_heading() {
  input();
  //update_v(plane.pos);
  /**
  int boxnum = boxes.size();
  for(int i = boxnum-1; i > -1;i--) {
    Box box = (Box)boxes.get(i);
    update_v(box.pos);
    box.sum = box.pos.mag();
  }  
  **/
  int linum = lines.size();
  for(int i = 0; i < linum;i++) {
    Line lin = (Line)lines.get(i);
    update_v(lin.another);
    update_v(lin.yetanother); 
  }
}

public void update_v(PVector pos) {
 switch(direction) {
      case FORWARD:pos.sub(forward_heading); break;
      case BACKWARD:pos.sub(back_heading); break;
      case LEFTWARD:pos.sub(left_heading); break;
      case RIGHTWARD:pos.sub(right_heading); break;
      case UPWARD:pos.add(up_heading); break;
      case DOWNWARD:pos.add(down_heading); break;
      case FORWARD|LEFTWARD:pos.sub(forward_heading);pos.sub(left_heading); break;
      case FORWARD|RIGHTWARD:pos.sub(forward_heading);pos.sub(right_heading);  break;
      case BACKWARD|LEFTWARD:pos.sub(back_heading);pos.sub(left_heading);  break;
      case BACKWARD|RIGHTWARD:pos.sub(back_heading);pos.sub(right_heading);  break;
      case UPWARD|FORWARD:pos.sub(forward_heading);pos.add(up_heading);  break;
      case UPWARD|BACKWARD:pos.sub(back_heading);pos.add(up_heading);  break;
      case UPWARD|LEFTWARD:pos.add(up_heading);pos.sub(left_heading);  break;
      case UPWARD|RIGHTWARD:pos.add(up_heading);pos.sub(right_heading);  break;
      case DOWNWARD|FORWARD:pos.sub(forward_heading);pos.add(down_heading);  break;
      case DOWNWARD|BACKWARD:pos.sub(back_heading);pos.add(down_heading);  break;
      case DOWNWARD|LEFTWARD:pos.add(down_heading);pos.sub(left_heading);  break;
      case DOWNWARD|RIGHTWARD:pos.add(down_heading);pos.sub(right_heading);  break;
      case LEFTWARD|RIGHTWARD: 
        if(last_direction==LEFTWARD)
         pos.sub(left_heading);
        else
         pos.sub(right_heading);  
        break;
      case FORWARD|BACKWARD: 
        if(last_direction==FORWARD)
         pos.sub(forward_heading);
        else
         pos.sub(back_heading);
        break;
      case UPWARD|DOWNWARD:
        if(last_direction==UPWARD)
         pos.add(up_heading);
        else
         pos.add(down_heading);
        break;
    } 
    if(pos.y < 10)
      pos.y = 10;
}

  
    
  void mouseReleased() { }
  void mouseDragged(){}
  
  void mouseMoved() { 
    if(matrix_panel_active==1)
      check_matrices_pass();
    //check_nodes_pass();
  }
  
  public void input() {
 float mx = mouseX;
 float my = mouseY;
 float result = (mx-width/2)*(mx-width/2) + (my-height/2)*(my-height/2);
 noCursor();
 //if(result < height*height/4 ) {
   cursor(CROSS);  
   mx = map(mx, 0, width, -1, 1);
   my = map(my, 0, height, -1, 1); 
 //}
 //else {
 // cursor(HAND);
 // return; 
 //}
 dx = mx-lmx;
 dy = my-lmy;
 lmx = mx;
 lmy = my;
 float xang = mx * Math.abs(mx) / (8*PI);
 float yang = my * Math.abs(my) / (10*PI);
 right_heading.mult(speed*sin(xang));
 forward_heading.mult(cos(xang));
 forward_heading.add(right_heading);
 straight_up.mult(speed*sin(yang));
 forward_heading.mult(cos(yang));
 forward_heading.add(straight_up);
 //cam.lookAt(forward_heading.x, forward_heading.y, forward_heading.z, 1.0f);
 camera(0,0,0, forward_heading.x, forward_heading.y, forward_heading.z, 0.0, 1.0, 0.0);
 forward_heading.normalize();
 forward_heading.mult(speed);
 update_normals();
}

public void make_normals() {
    back_heading = new PVector(-forward_heading.x, -forward_heading.y, -forward_heading.z);
    up_heading = new PVector(0,speed,0);
    down_heading = new PVector(0,-speed,0);
    right_heading = forward_heading.cross(up_heading);
    left_heading = forward_heading.cross(down_heading);
}

public void dvals() {
  lmx = 0.0f; lmy = 0.0f;
  //int boxnum = boxes.size();
  forward_heading = new PVector(250,10,250);
  straight_up = new PVector(0,1,0);
  straight_down = new PVector(0,-1,0);
  straight_left = new PVector(-1,0,0);
  straight_right = new PVector(1,0,0);
  straight_forward = new PVector(0,0,1);
  straight_back = new PVector(0,0,-1);
  make_normals();
  //cam.lookAt(forward_heading.x, forward_heading.y, forward_heading.z, 1.0f);
 
  camera(0,0,0, forward_heading.x, forward_heading.y, forward_heading.z, 0.0, 1.0, 0.0);
}

public void update_normals() {
  back_heading.set(-forward_heading.x, -forward_heading.y, -forward_heading.z); 
  up_heading.set(0,speed,0);
  down_heading.set(0,-speed,0);
  straight_left.set(-1,0,0);
  straight_right.set(1,0,0);
  straight_forward.set(0,0,1);
  straight_back.set(0,0,-1);
  straight_up.set(0,1,0);
  straight_down.set(0,-1,0);
  right_heading = forward_heading.cross(straight_up);
  left_heading = forward_heading.cross(straight_down);
  }

public void mouseClicked() {
  if(mouseEvent.getClickCount() == 3) { 
    dvals();
  }
}
  
  void mousePressed() {
   if(matrix_panel_active==1)
     check_matrices_press();
   //check_nodes_press(); 
  }
  
  public void check_matrices_press() {
    float mx = mouseX;
    float my = mouseY;
    float m1x =  (longest == 1)? 53 : 53;
    float m1y =  (longest==1)? height-253 : 53;
    float m2x = (longest == 1)? width/2 : 53;
    float m2y = (longest==1)? height-253 : height/2-100;
    float m3x = (longest == 1)? width-253 : 53;
    float m3y = (longest==1)? height-253 : height-253;
    if( mx < m1x + mpa_sz && mx > m1x ) {
      if( my < m1y + mpa_sz && my > m1y ) {
        if(mpa_sd == 0) {
          mpa_sz = m_sz_actv;
          mpa_sd = 1;
        } 
        else {
          mpa_sz = m_sz;
          mpa_sd = 0;
        }
        g1.update_chosen_matrix();
        return; 
      }  
    }
    if( mx < m2x + mpl_sz && mx > m2x ) {
      if( my < m2y + mpl_sz && my > m2y ) {
        if(mpl_sd == 0) {
          mpl_sz = m_sz_actv;
          mpl_sd = 1;
        } 
        else {
          mpl_sz = m_sz;
          mpl_sd = 0;
        }
        g1.update_chosen_matrix();
        return;    
      }  
    }
    if( mx < m3x + mpd_sz && mx > m3x ) {
      if( my < m3y + mpd_sz && my > m3y ) {
        if(mpd_sd == 0) {
          mpd_sz = m_sz_actv;
          mpd_sd = 1;
        } 
        else {
          mpd_sz = m_sz;
          mpd_sd = 0;
        }
        g1.update_chosen_matrix();
        return; 
      }  
    }
  }
  
  /**
  public void check_nodes_press() {
    boolean result = false;
    float cz = (float)cam.getDistance();
    float[] la = cam.getLookAt();
    float[] cam_rots = cam.getRotations();
    float mx = mouseX-width/2.0f;
    float my = mouseY-height/2.0f;
    peasy.org.apache.commons.math.geometry.Vector3D cl = new peasy.org.apache.commons.math.geometry.Vector3D(la[0],la[1],la[2]);
    Rotation inv_cam = new Rotation(RotationOrder.ZYX, -cam_rots[2], -cam_rots[1], -cam_rots[0]);
    int ns = g1.nodes.size();
    float ndx,ndy,ndz,dx,dy,shifts;
    Node lh = null;
    float lhndz = -height;
  
    for(int i = 0; i < ns;i++) {
      Node nd = (Node)g1.nodes.get(i);
      if(nd == null)
        continue;
      peasy.org.apache.commons.math.geometry.Vector3D ndp = new peasy.org.apache.commons.math.geometry.Vector3D(nd.position.x,nd.position.y,nd.position.z);
      ndp = inv_cam.applyTo(ndp.subtract(cl));
      ndx = (float)(((ndp.getX()))); ndy = (float)(((ndp.getY()))); ndz = (float)(((ndp.getZ())));
      //applet
      //float shifts = (float)((height-64)/(cz-ndp.getZ()));
      shifts = (float)((height-100)/(cz-ndz));
      dx = (float)mx - ndx*shifts;
      dy = (float)my - ndy*shifts;
      if(g1.hoverOnlyOn == 0)
        result = shifts*shifts*nd.radiusq > dx*dx + dy*dy;
      else
        result = 0.5*shifts*nd.radiusq > dx*dx + dy*dy;
      if(result) {
        if(ndz > lhndz && (cz-ndz)>40) {
          lh = nd;  
          lhndz = ndz;
        }
      }
    }
  if(lh != null) {
      Node nd = lh;
      counter++;
      if(nd.partial_display >= 0 && g1.hideOn == 0) {
        //g1.load_more(nd);
        nd.show_hidden();
      }
      else if(g1.hideOn == 1) {
        nd.hide();  
      }
      else if(nd.selected == 0) {
        if(g1.allPaths == 1 || (g1.pointToPointOn == 1 && g1.directedOn == 0))
          g1.select_all_paths(nd,2);
        else if(g1.selectNode != null && g1.pointToPointOn == 1 && g1.directedOn == 1){
          g1.silence_all_paths(2);
          g1.select_all_paths(g1.selectNode, nd,2);
        }
        g1.selectNode = nd;
        nd.selected = 1;
        nd.counter = counter;
        spread_activity(nd);
      }
      else {
        if(g1.allPaths == 1 || g1.pointToPointOn == 1)
          g1.silence_all_paths(2);
        g1.selectNode = null;
        nd.hovered = 0;
        nd.selected = 0;
        nd.counter = 0;
        retract_activity(nd);
      }
    }
    else if(mouseEvent.getClickCount()==2) {
      silence_grid();
      g1.silence_all_paths(2);
    }
    else if(mouseEvent.getClickCount()==3) {
      cam.reset();
    } 
  }
  **/
    public void check_matrices_pass() {
    float mx = mouseX;
    float my = mouseY;
    float m1x =  (longest == 1)? 53 : 53;
    float m1y =  (longest==1)? height-253 : 53;
    float m2x = (longest == 1)? width/2 : 53;
    float m2y = (longest==1)? height-253 : height/2-100;
    float m3x = (longest == 1)? width-253 : 53;
    float m3y = (longest==1)? height-253 : height-253;
    if( mx < m1x + mpa_sz && mx > m1x && my < m1y + mpa_sz && my > m1y ) {
      if(mpa_sz == m_sz) 
        mpa_sz = m_sz_actv;
    }
    else if(mpa_sd == 0)
      mpa_sz = m_sz;
    if( mx < m2x + mpl_sz && mx > m2x && my < m2y + mpl_sz && my > m2y ) {
      if(mpl_sz == m_sz)
        mpl_sz = m_sz_actv;
    }
    else if(mpl_sd == 0)
      mpl_sz = m_sz;
    if( mx < m3x + mpd_sz && mx > m3x &&  my < m3y + mpd_sz && my > m3y ) {
      if(mpd_sz == m_sz)
        mpd_sz = m_sz_actv;
    }
    else if(mpd_sd == 0)
      mpd_sz = m_sz;
  }
    /**
  public void check_nodes_pass() {
    boolean result = false;
    float cz = (float)cam.getDistance();
    float[] la = cam.getLookAt();
    float[] cam_rots = cam.getRotations();
    float mx = mouseX-width/2.0f;
    float my = mouseY-height/2.0f;
    peasy.org.apache.commons.math.geometry.Vector3D cl = new peasy.org.apache.commons.math.geometry.Vector3D(la[0],la[1],la[2]);
    Rotation inv_cam = new Rotation(RotationOrder.ZYX, -cam_rots[2], -cam_rots[1], -cam_rots[0]);
    int ns = g1.nodes.size();
    float ndx,ndy,ndz,dx,dy,shifts;
    Node lh = null;
    float lhndz = -height;
    if(g1.hoverNode != null) {
      if(g1.allPaths == 1 || (g1.pointToPointOn == 1))
        g1.silence_all_paths(1);
      retract_activity(g1.hoverNode);  
      g1.hoverNode.hovered = 0;
      g1.hoverNode = null;
    }
    for(int i = 0; i < ns;i++) {
      Node nd = (Node)g1.nodes.get(i);
      if(nd == null)
        continue;
      peasy.org.apache.commons.math.geometry.Vector3D ndp = new peasy.org.apache.commons.math.geometry.Vector3D(nd.position.x,nd.position.y,nd.position.z);
      ndp = inv_cam.applyTo(ndp.subtract(cl));
      ndx = (float)(((ndp.getX()))); ndy = (float)(((ndp.getY()))); ndz = (float)(((ndp.getZ())));
      //applet
      //float shifts = (float)((height-64)/(cz-ndp.getZ()));
      shifts = (float)((height-100)/(cz-ndz));
      dx = (float)mx - ndx*shifts;
      dy = (float)my - ndy*shifts;
      if(g1.hoverOnlyOn == 0)
        result = shifts*shifts*nd.radiusq > dx*dx + dy*dy;
      else
        result = 0.5*shifts*nd.radiusq > dx*dx + dy*dy;
      if(result) {
        if(ndz > lhndz && (cz-ndz) > 40) {
          lh = nd;  
          lhndz = ndz;
        }
      }
    }
    if(lh != null) {
       Node nd = lh;
       if(g1.hoverNode != null) {
          if(g1.allPaths == 1 || g1.pointToPointOn == 1)
            g1.silence_all_paths(1);
          g1.hoverNode.hovered = 0;
          retract_activity(g1.hoverNode);
          g1.hoverNode = null;
        }
        if(g1.allPaths == 1 || (g1.pointToPointOn == 1 && g1.directedOn == 0))
          g1.select_all_paths(nd,1);
        else if(g1.selectNode != null && g1.pointToPointOn == 1 && g1.directedOn == 1) {
          g1.select_all_paths(g1.selectNode, nd,1);
        }
        g1.hoverNode = nd;
        nd.hovered = 1;
        spread_activity(nd);
    }
  }
  **/
  
  public void update_selected() {
    int ns = g1.nodes.size();
    for(int i = 0; i < ns;i++) {
      Node n = (Node)g1.nodes.get(i);
      if(n == null)
        continue;
      if(n.selected + n.hovered > 0) {
        g1.directedOn ^= 1;
        retract_activity(n);
        g1.directedOn ^= 1;
        spread_activity(n);
      }  
    }
  }
  
  public void silence_grid( ) {
    int ns = g1.nodes.size();
    int result = 0;
    for(int i = 0; i < ns;i++) {
      Node n = (Node)g1.nodes.get(i);
      if(n == null)
        continue;
      if(n.adjacent > 0)
        n.adjacent = 0;
    }
    if(result == 1) 
      return;
    for(int i = 0; i < ns;i++) {
      Node n = (Node)g1.nodes.get(i);
      if(n == null)
        continue;
      if(n.selected > 0)
        n.selected = 0;  
    }  
  }
  
  public void spread_activity( Node c ) {
    ArrayList ade = c.undirectededges;
    if(g1.directedOn == 1)
      ade = c.edges;
    int ades = ade.size();
    for(int i = 0; i < ades;i++) {
      Node n = (Node)((Edge)ade.get(i)).to;
      if(n != c) 
        n.adjacent = 1;
    }
  }
  
  public void retract_activity( Node c ) {
    ArrayList ade = c.undirectededges;
    if(g1.directedOn == 1)
      ade = c.edges;
    int ades = ade.size();
    for(int i = 0; i < ades;i++) {
      Node n = (Node)((Edge)ade.get(i)).to;
      if(n!=c) {
        n.adjacent = 0;  
      }
    }
  }
  /**
  public void rotate_to_top(Node nd) {
      peasy.org.apache.commons.math.geometry.Vector3D snd = new peasy.org.apache.commons.math.geometry.Vector3D(nd.position.x,nd.position.y,nd.position.z);
      peasy.org.apache.commons.math.geometry.Vector3D on_v = new peasy.org.apache.commons.math.geometry.Vector3D(0,-1,0);
      snd = snd.normalize();
      Rotation on_sn = new Rotation(snd,on_v);
      double[] angles = null;
      try {
        angles = on_sn.getAngles(RotationOrder.XYZ);
      }
      catch(Exception e ) {}
      cam.rotateX(-angles[0]);
      cam.rotateY(-angles[1]);
      cam.rotateZ(-angles[2]); 
  }
  **/
  
  

   


