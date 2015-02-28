
//Processing combined effort
//This is a basic template suggested by bit.craft from the processing.org forums
//Others have expressed interest in working on a combined processing effort.
//The premise is that we are achieve to stitch multiple sketches together after 150 frames
//Using passing parameters between sketches to allow smoth transition.
//This is a very basic sketch template of what we are trying to achieve
//If you have any comments are sketches to submit reply here or post at the following links
//
//http://processing.org/discourse/yabb2/YaBB.pl?num=1266418665/0
//
//http://processing.org/discourse/yabb2/YaBB.pl?num=1266769552/0#0

import java.lang.reflect.Constructor;
public boolean forward = true;
public boolean up = false;
public int px=0;
public int py =0;
public int ly=0;
public int lx=0;

final int W = 255, H = 255, BG = #000000, fps = 30, seconds = 2;
boolean export = false; //cannot be used with online version
PApplet[] sketches;
String[] names;
int s;
public PFont font1; 

void setup() {
  
  size(255, 255,P3D); // use absolute only for openprocessing header to detect normally use  size(W, H,P3D);
   font1 = createFont("arial",12);
  Class[] classes = getClass().getDeclaredClasses();
  int n = classes.length;
  sketches = new PApplet[n];
  names = new String[n];
  
  for(int i=0; i<n; i++) {
    try {
      Constructor c = classes[i].getDeclaredConstructor(getClass());
      sketches[i] = (PApplet) c.newInstance(this);
      sketches[i].init();  
      names[i] = split(c.getName(), "$")[1];    
    } catch (Exception e) {}
  }
  textFont(font1, 12);
  frameRate(fps);
}


void draw() {
 bounce(true, 3, 1, 5);
  if(frameCount % (seconds * fps) == 1) {
    
    // stop running sketch
    if(frameCount>1 ) {
     if (!online) println("stopping " + names[s]);
      sketches[s].stop();
      s = (s+1) % sketches.length;
    }
    
    // start next sketch
  //  println("starting " + names[s]);
  
  
    sketches[s].run();
    text("fps: "+frameRate +" "+"starting " + names[s] +" frame count "+frameCount ,10,20 );
  }

  sketches[s].handleDraw();
  PImage img = sketches[s].get();
  img.loadPixels();
  image(img, 0, 0);
  if(export && frameCount <= fps*seconds*sketches.length) saveFrame("showreel-#####.png");
     
}

//
class Sketch2 extends PApplet {
  int t,x,X,Y,c,w=255,m;
void setup(){
 size(W,H); 
}
void draw(){t++;background(0);for(x=0;++x<w*w;){X=x%w+n();Y=x/w+n();c=50+(get(X,Y)>>8&w);set(X,Y,color(c,c,c*2));}}int n(){return int(noise(x%w/99f,x/w/99f,t/99f+m++%2)*w-w/2);
} 
}
//
class Sketch3 extends PApplet {
  
  int hf=255,wf=hf,iff;  
float df=0,ef=0,rf=.01,zf,nf;  
int X,Y;  
PImage water;  
PGraphics water2;  
  PImage bbg; 
void setup(){  
 size(W,H,P3D);   
bbg = new PImage(width,height); 
 water = new PImage (wf,hf);  
 water2 = createGraphics (wf,hf,P3D);  
 water.loadPixels();  
 loadPixels();  
}  
void draw(){  
  mouseX = px;
  mouseY= py;
  makebg(true,false); 
if (mousePressed){  
background(bbg); 
} 
else 
{ 
background(0);  
} 
 
df-=(mouseY-hf/2f)/hf/2f;//137  
ef+=(mouseX-wf/2f)/wf/2f;//120  
water2.loadPixels();  
water2.beginDraw();  
for(iff=0;iff<wf*wf;iff++){  
zf=iff/wf; // use  '/' for horizontal or '%' for vertical   
X=int(iff%wf/zf*hf);  
Y=int(hf/2+noise(iff%wf*rf+ef,iff*rf/wf+df)*99/zf*hf);  
  
color c=Y+(get(X,Y)>>8&iff);  
  
    if (!mousePressed){  
      
      //image(bbg,0,0); 
      // water.pixels[iff]=color(c-mouseY,c-mouseX,c*iff)+bbg.pixels[iff];   
      
      if (iff >0 && iff <pixels.length) water.pixels[iff]=blendColor(color(c-mouseY,c-mouseX,c*iff),bbg.pixels[iff],SUBTRACT);   //ADD / OVERLAY
      // water.pixels[iff]=color(c-mouseY,c-mouseX,c*iff)+bbg.get(X,Y);   
     //  water.pixels[iff]=blendColor(color(c-mouseY,c-mouseX,c*iff),bbg.pixels[iff],SUBTRACT);   
        
   }   
  
   if (mousePressed){  
      
      set(X,Y,color(c-mouseY,c-mouseX,c*iff));  
   }  
}  
  
water2.endDraw();  
water2.updatePixels();  
water.pixels = water2.pixels;  
water.updatePixels();  
if (!mousePressed){  
   image(water,0,0);  
    
    
}  
  
}  
  
  
void keyPressed(){  
   if (key =='h'){  
   colorMode(HSB,350);    
   }  
     
    
     
  if (key == 'r'){  
   colorMode(RGB,350);   
  }  
}  
 
int cpass=0; 
void makebg(Boolean animate, Boolean invert){ 
  
  water.loadPixels(); 
  color colx = 0; 
for(int y=0;y<height;y++){ 
    for(int x=0;x<width;x++){ 
        int pos=y*width+x; 
        color col = water.pixels[pos] ;// 
         colx = color(height-y,x,y-x);  
        if (animate){ 
         //colx = color(height-y,X,cpass+y);  
        // colx = color(height-y,x,cpass-X);  
         colx = color(mouseY-y,x,cpass+y);  
        } 
 
         
        float rr= red(colx); 
        float bb= blue(colx); 
        float gg= green(colx); 
         
          rr = colx >> 16 & 0xff; 
        gg = colx >> 8 & 0xff; 
        bb = colx  & 0xff; 
//        for(int i=0;i<4;i++){ 
//          dis =dist(p[i].xpos,p[i].ypos,x,y)/2; 
//          rr += cc[0]/dis-gain; 
//          gg += cc[1]/dis-gain; 
//          bb += cc[2]/dis-gain; 
//        } 
  if (!invert)    {  bbg.pixels[pos]=color(rr,gg,bb);} 
    if (invert)   {   bbg.pixels[pos]=-color(rr,gg,bb);} 
    } 
    bbg.updatePixels(); 
//    if (!online){ 
    arraycopy(bbg.pixels,water.pixels);  
//    } 
  } 
  if (animate){ 
    cpass++;  
  } 
if (cpass>4000){  
 cpass=0;   
}  
 
} 

}
//
//
//  
////  void setup() {
////    size(W, H,JAVA2D);
////    smooth();
////    textFont(font1, 12);
////  }
////  void draw()  {
////    background(BG); 
////    ellipse(px, py, 20, 20);
////    text("fps: "+frameRate +" "+"starting " + names[s] +" frame count "+frameCount ,10,20 );
////  } 

//
//class Sketch2 extends PApplet {
//  void setup() {
//    size(W, H, JAVA2D);
//        smooth();
//        textFont(font1, 12);
//  }
//  void draw()  {
//    background(BG); 
// //   ellipse(W/2, H/2, 20, 20);
//    ellipse(px, py, 20, 20);
//   text("fps: "+frameRate +" "+"starting " + names[s] +" frame count "+frameCount ,10,20 );
//  } 
//}
//
//
//class Sketch3 extends PApplet {
//  void setup() {
//    size(W, H, JAVA2D); 
//        smooth();
//        textFont(font1, 12);
//  }
//  void draw()  {
//    background(BG); 
//   // lights(); 
//    noStroke(); 
//   // translate(W/2, H/2, 0); 
//   // translate(px,py, 0); 
//    //sphere(10);
//    ellipse(px,py,10,10);
//  text("fps: "+frameRate +" "+"starting " + names[s] +" frame count "+frameCount ,10,20 );
//  } 
//}


class Sketch4 extends PApplet{
  //NEBULA 
//Matt Schroeter 
//December 1st, 2008 
//matthanns.com 
 
float depth = 400;  
 
void setup(){ 
 size(W, H, P3D); 
 noStroke(); 
} 
 
void draw(){ 
 background(15, 15, 15); 
 
  float cameraY = height/1; 
  float cameraX = width/1; 
  
 translate(width/2, height/2, -depth/2); 
  
 rotateY(frameCount*PI/500); 
  
 float fov = cameraX/float(width) * PI/2; 
 float cameraZ = cameraY / tan(fov / 2.0); 
 float aspect = float(width)/float(height); 
  
 perspective(fov, aspect, cameraZ/2000.0, cameraZ*4000.0); 
  
 
 translate(width/10, height/10, depth/2); 
  
 for(int i=0; i<2; i++) { 
 float r = random(100); 
 directionalLight(2, 83, 115, // Color 
 1, 10, 0); // The x-, y-, z-axis direction' 
 directionalLight(3, 115, 140, // Color 
 10, 10, 0); // The x-, y-, z-axis direction' 
 } 
 
 
 for(int i=0; i<10; i++) { 
  
   float r = random(20);  
  
 rotateX(frameCount*PI/1000); 
  
 //alt effect 
 //rotateY(frameCount*PI/1000); 
  
  
 for (int y = -2; y < 2; y++) { 
 for (int x = -2; x < 2; x++) { 
 for (int z = -2; z < 2; z++) { 
 
 pushMatrix(); 
 translate(400*x, 300*y, 300*z); 
 box(5, 5, 100); 
 popMatrix(); 
  
 pushMatrix(); 
 translate(400*x, 300*y, 50*z); 
 box(100, 5, 5); 
 popMatrix(); 
  
 pushMatrix(); 
 translate(400*x, 10*y, 50*z); 
 box(50, 5, 5); 
 popMatrix(); 
 
 pushMatrix(); 
 rotateY(frameCount*PI/400); 
 translate(100*x, 300*y, 300*z); 
 box(60, 40, 20); 
 popMatrix(); 
  
      } 
     } 
    } 
   } 
  } 

  
}


class Sketch5 extends PApplet{
 /** 
<p>Don't move too fast — you might scare it. Click to forgive and forget.</p> 
*/ 

int n = 5000; // number of cells 
float bd = 37; // base line length 
float sp = 0.004; // rotation speed step 
float sl = .97; // slow down rate 
 
Cell[] all = new Cell[n]; 
 
class Cell{ 
  int x, y; 
  float s = 0; // spin velocity 
  float c = 0; // current angle 
  Cell(int x, int y) { 
    this.x=x; 
    this.y=y; 
  } 
  void sense() { 
    if(pmouseX != 0 || pmouseY != 0) 
      s += sp * det(x, y, pmouseX, pmouseY, mouseX, mouseY) / (dist(x, y, mouseX, mouseY) + 1); 
    s *= sl; 
    c += s; 
    float d = bd * s + .001; 
    line(x, y, x + d * cos(c), y + d * sin(c)); 
  } 
} 
 
void setup(){ 
  size(W, H, P2D); 
  stroke(0, 0, 0, 20); 
  for(int i = 0; i < n; i++){ 
    float a = i + random(0, PI / 9); 
    float r = ((i / (float) n) * (width / 2) * (((n-i) / (float) n) * 3.3)) + random(-3,3) + 3; 
    all[i] = new Cell(int(r*cos(a)) + (width/2), int(r*sin(a)) + (height/2)); 
  } 
} 
 
void draw() { 
  mouseX = px;
  mouseY = py;
  background(255); 
  for(int i = 0; i < n; i++) 
    all[i].sense(); 
} 
 
void mousePressed() { 
  for(int i=0;i<n;i++) 
    all[i].c = 0; 
} 
 
float det(int x1, int y1, int x2, int y2, int x3, int y3) { 
  return (float) ((x2-x1)*(y3-y1) - (x3-x1)*(y2-y1)); 
} 
 
}
class Sketch1 extends PApplet{
  import processing.opengl.*;
//import processing.video.*;

Global global; //always create the global variable before using any of the default classes (created by Don)

//PApplet pg;
//PGraphics pg;
PFont font;
//MovieMaker mm;

boolean RENDERING = true;
boolean RECORDING = false;
boolean CLOCKING = true;
boolean WORKING = true;

int timer = 0;

float rx = 0;
float rz = 0;
float trx = 0;
float trz = 0;

Particle[] particles = new Particle[30];
Particle puller,pusher;
Cloud cl;
Delaunay de;
Voronoi vo;
public int  _npmax = 15;
boolean click = false;

void setup(){
  //initialize stage
  size(W,H,P3D);
 // pg = this;
  //pg = createGraphics(500,500,P3D);
    background(255);
    loadPixels();
  //if(RECORDING){ frameRate(24); }
//  font = loadFont("ArialMT-18.vlw");
//  textFont(font,18);
// textFont(font1, 12);
  textAlign(CENTER,CENTER);
  //initialize global
  global = new Global(  width,  height,  height);
  global.init();
  //initialize moviemaker
  //if(RECORDING){ mm = new MovieMaker(pg,global.w,global.h,"mov.mov",24,MovieMaker.JPEG,MovieMaker.HIGH); }
  //initialize sketch
  for(int i=0;i<particles.length;i++){
    particles[i] = new Particle(random(  width)-  width/2,random(  height)-  height/2,0,2,true);
  }
  cl = new Cloud(particles);
  de = new Delaunay(particles,global.circumscribed_face);
  vo = new Voronoi(de);
}

void draw(){
  mouseX = px;
  mouseY = py;
    background(-1);
   render();
    // updatePixels();
   //image(pg,0,0);
  //  text("fps: "+frameRate +" "+"starting " + names[s] +" frame count "+frameCount ,10,20 );
 
}

void render(){
  rx += (trx-rx)*.05;
  rz += (trz-rz)*.05;
  if(RENDERING){
      background(200);
      pushMatrix();
      translate(global.w/2,global.h/2,0);
      rotateX(rx);
      rotateZ(rz);
      stroke(0,100);
      fill(255);
      //kicker
   particles[0].move_to(  mouseX-global.w/2,  mouseY-global.h/2,0);
    cl.wander();
    cl.repel();
    cl.step();
    de.synchronize();
    vo.synchronize();
    vo.render();
    cl.render();
      popMatrix();
  }
  if(CLOCKING&&frameCount%100==0){
    println(100/((millis()-timer)/1000.0f));
    timer = millis();
  }
  //if(RECORDING){ mm.addFrame(); }
}


// Arrow

//------ ARROW ------//
//arrows are mostly used for rendering vectors and things in 3d :: they're not very effecient for every-frame rendering
class Arrow extends Segment{
  Point p3,p4,p5,p6;
  float arrow_size = 10;
  Arrow(Point $p1,Point $p2){
    super($p1,$p2);
    p3 = new Point(p1.x+l-arrow_size,p1.y+arrow_size/2,p1.z);
    p4 = new Point(p1.x+l-arrow_size,p1.y-arrow_size/2,p1.z);
    p5 = new Point(p1.x+l-arrow_size,p1.y,p1.z+arrow_size/2);
    p6 = new Point(p1.x+l-arrow_size,p1.y,p1.z-arrow_size/2);
    step();
  }
  void step(){
    l = get_length();
    float rz = atan2(p2.y-p1.y,p2.x-p1.x);
    Point temp = new Point(0,0,0);
    temp.match(p2);
    temp.rotate(cos(-rz),sin(-rz),"z",p1.x,p1.y,p1.z);
    float azi = atan2(temp.z-p1.z,temp.x-p1.x);
    float cosa1 = cos(azi);
    float sina1 = sin(azi);
    float cosa2 = cos(rz);
    float sina2 = sin(rz);
    p3.move_to(p1.x+l-arrow_size,p1.y+arrow_size/2,p1.z);
    p3.rotate(cosa1,sina1,"y",p1.x,p1.y,p1.z);
    p3.rotate(cosa2,sina2,"z",p1.x,p1.y,p1.z);
    p4.move_to(p1.x+l-arrow_size,p1.y-arrow_size/2,p1.z);
    p4.rotate(cosa1,sina1,"y",p1.x,p1.y,p1.z);
    p4.rotate(cosa2,sina2,"z",p1.x,p1.y,p1.z);
    p5.move_to(p1.x+l-arrow_size,p1.y,p1.z+arrow_size/2);
    p5.rotate(cosa1,sina1,"y",p1.x,p1.y,p1.z);
    p5.rotate(cosa2,sina2,"z",p1.x,p1.y,p1.z);
    p6.move_to(p1.x+l-arrow_size,p1.y,p1.z-arrow_size/2);
    p6.rotate(cosa1,sina1,"y",p1.x,p1.y,p1.z);
    p6.rotate(cosa2,sina2,"z",p1.x,p1.y,p1.z);
  }
  void render(){
    super.render();
      beginShape(TRIANGLE_STRIP);
      vertex(p3.x,p3.y,p3.z);
      vertex(p2.x,p2.y,p2.z);
      vertex(p5.x,p5.y,p5.z);
      vertex(p2.x,p2.y,p2.z);
      vertex(p4.x,p4.y,p4.z);
      vertex(p2.x,p2.y,p2.z);
      vertex(p6.x,p6.y,p6.z);
      vertex(p2.x,p2.y,p2.z);
      vertex(p3.x,p3.y,p3.z);
      endShape();
      beginShape();
      vertex(p3.x,p3.y,p3.z);
      vertex(p5.x,p5.y,p5.z);
      vertex(p4.x,p4.y,p4.z);
      vertex(p6.x,p6.y,p6.z);
      endShape(CLOSE);
  }
}

//------ BLOB ------//
//blobs are groups of curved polygons made from proximity tests within one or more particle clouds
class Blob{
  int npolygons,nclouds,nparticles;
  float cohesion_distance = 40;
  float outline_distance = 80;
  Polygon[] polygons = new Polygon[1000];
  Polygon[] outlines = new Polygon[1000];
  Cloud[] clouds = new Cloud[100];
  Particle[] particles = new Particle[1000];
  Blob(Cloud[] $clouds){
    npolygons = nclouds = nparticles = 0;
    for(int i=0;i<$clouds.length;i++){
      add_cloud($clouds[i]);
    }
  }
  void add_cloud(Cloud $c){
    clouds[nclouds++] = $c;
    for(int i=0;i<$c.nparticles;i++){
      particles[nparticles++] = $c.particles[i];
    }
  }
  Polygon[] get_groups(){
    int ngroups = 0;
    Polygon[] groups = new Polygon[nparticles];
    boolean[] grouped = new boolean[nparticles];
    for(int i=0;i<nparticles;i++){
      if(grouped[i]) continue;
      groups[ngroups++] = new Polygon(get_group(particles[i],grouped));
    }
    groups = (Polygon[]) subset(groups,0,ngroups);
    return groups;
  }
  Particle[] get_group(Particle $p,boolean[] $grouped){
    Particle[] group = new Particle[1];
    group[0] = $p;
    for(int i=0;i<nparticles;i++){
      if($grouped[i]) continue;
      if($p.get_distance_to(particles[i])<=cohesion_distance){
        $grouped[i] = true;
        group = (Particle[]) concat(group,get_group(particles[i],$grouped));
      }
    }
    return group;
  }
  void step(){
    for(int i=0;i<nclouds;i++){
      clouds[i].step();
    }
    polygons = get_groups();
    npolygons = polygons.length;
    for(int i=0;i<npolygons;i++){
      outlines[i] = polygons[i].get_outline(cohesion_distance);
    }
  }
  void render(){
    for(int i=0;i<npolygons;i++){
      if(outlines[i]!=polygons[i]){
        if(outlines[i].is_complex()) continue;
        outlines[i].render("curve");
      }
    }
    /*
    for(int i=0;i<nclouds;i++){
      clouds[i].render();
    }
    */
  }
}

//------ CLOUD ------//
//clouds are groups of particles
class Cloud{
  int nparticles,npullers,npushers;
  Particle[] particles = new Particle[1000];
  Particle[] pullers = new Particle[100];
  Particle[] pushers = new Particle[100];
  boolean wrapping = false; boolean bouncing = true;
  boolean puller_wrapping = false; boolean puller_bouncing = true; boolean puller_locked = true;
  boolean pusher_wrapping = false; boolean pusher_bouncing = true; boolean pusher_locked = true;
  float speed = 0.1; float wander_speed = 0.1; float attract_distance = 80; float attract_speed = 0.0006; float repel_distance = 40; float repel_speed = 0.05;
  float puller_speed = 0.005; float puller_wander_speed = 0.01; float puller_attract_distance = 200; float puller_attract_speed = 0.0007; float puller_repel_distance = 30; float puller_repel_speed = 0.07;
  float pusher_speed = 0.005; float pusher_wander_speed = 0.01; float pusher_attract_distance = 0; float pusher_attract_speed = 0.0005; float pusher_repel_distance = 60; float pusher_repel_speed = 0.08;
  float gx = 0; float gy = 0; float gz = 0;
  float friction = 0.1;
  float bounce_friction = 0.4;
  Cloud(Particle[] $particles){
    nparticles = npullers = npushers = 0;
    for(int i=0;i<$particles.length;i++){
      if($particles[i]==null) break;
      add_particle($particles[i]);
    }
  }
  Cloud(Particle[] $particles,Particle[] $pullers,Particle[] $pushers){
    nparticles = npullers = npushers = 0;
    for(int i=0;i<$particles.length;i++){
      add_particle($particles[i]);
    }
    for(int i=0;i<$pullers.length;i++){
      add_puller($pullers[i]);
    }
    for(int i=0;i<$pushers.length;i++){
      add_pusher($pushers[i]);
    }
  }
  void add_particle(Particle $p){
    $p.wrapping = wrapping; $p.bouncing = bouncing;
    $p.speed = speed; $p.wander_speed = wander_speed; $p.attract_distance = attract_distance; $p.attract_speed = attract_speed; $p.repel_distance = repel_distance; $p.repel_speed = repel_speed;
    $p.gx = gx; $p.gy = gy; $p.gz = gz; $p.friction = friction; $p.bounce_friction = bounce_friction;
    particles[nparticles++] = $p;
  }
  void add_puller(Particle $p){
    $p.wrapping = puller_wrapping; $p.bouncing = puller_bouncing; $p.locked = puller_locked;
    $p.speed = puller_speed; $p.wander_speed = puller_wander_speed; $p.attract_distance = puller_attract_distance; $p.attract_speed = puller_attract_speed; $p.repel_distance = puller_repel_distance; $p.repel_speed = puller_repel_speed;
    $p.gx = gx; $p.gy = gy; $p.gz = gz; $p.friction = friction; $p.bounce_friction = bounce_friction;
    pullers[npullers++] = $p;
  }
  void add_pusher(Particle $p){
    $p.wrapping = pusher_wrapping; $p.bouncing = pusher_bouncing; $p.locked = pusher_locked;
    $p.speed = pusher_speed; $p.wander_speed = pusher_wander_speed; $p.attract_distance = pusher_attract_distance; $p.attract_speed = pusher_attract_speed; $p.repel_distance = pusher_repel_distance; $p.repel_speed = pusher_repel_speed;
    $p.gx = gx; $p.gy = gy; $p.gz = gz; $p.friction = friction; $p.bounce_friction = bounce_friction;
    pushers[npushers++] = $p;
  }
  void apply_force(float $fx,float $fy,float $fz){
    for(int i=0;i<nparticles;i++){
      particles[i].vx += $fx;
      particles[i].vy += $fy;
      particles[i].vz += $fz;
    }
  }
  void wander(){
    for(int i=0;i<nparticles;i++){
      particles[i].wander(false);
    }
  }
  void attract(){
    for(int i=0;i<nparticles;i++){
      for(int j=i+1;j<nparticles;j++){
        particles[i].attract(particles[j]);
      }
    }
  }
  void repel(){
    for(int i=0;i<nparticles;i++){
      for(int j=i+1;j<nparticles;j++){
        particles[i].repel(particles[j]);
      }
    }
  }
  void step(){
    for(int i=0;i<npullers;i++){
      for(int j=0;j<nparticles;j++){
        pullers[i].attract(particles[j]);
        pullers[i].repel(particles[j]);
      }
    }
    for(int i=0;i<npushers;i++){
      for(int j=0;j<nparticles;j++){
        pushers[i].attract(particles[j]);
        pushers[i].repel(particles[j]);
      }
    }
    for(int i=0;i<nparticles;i++){
      particles[i].step();
    }
    for(int i=0;i<npullers;i++){
      pullers[i].step();
    }
    for(int i=0;i<npushers;i++){
      pushers[i].step();
    }
  }
  void render(){
    for(int i=0;i<nparticles;i++){
      particles[i].render();
    }
    /*
    for(int i=0;i<npullers;i++){
      pullers[i].render();
    }
    for(int i=0;i<npushers;i++){
      pushers[i].render();
    }
    */
  }
}

//------ DELAUNAY ------//
//constructs a delaunay triangulation from a set of points
class Delaunay{
  int nfaces,npoints;
  Face boundary;
  Face[] faces = new Face[2000];
  Point[] points = new Point[1500];//500
  Delaunay(Point[] $points,Face $boundary){
    nfaces = npoints = 0;
    boundary = faces[nfaces++] = $boundary;
    for(int i=0;i<$points.length;i++){
      if($points[i]==null) break;
      add_face($points[i]);
    }
  }
  void synchronize(){
    int ntemp = npoints;
    nfaces = npoints = 0;
    faces[nfaces++] = boundary;
    for(int i=0;i<ntemp;i++){
      add_face(points[i]);
    }
  }
  void add_face(Point $p){
    for(int i=0;i<npoints;i++){
      if($p.get_distance_to(points[i])<=global.distance_tolerance){ return; }
    }
    Point[] ps = new Point[3]; ps[0] = $p;
    points[npoints++] = $p;
    Segment[] segments = new Segment[100];
    int nsegments = 0;
    for(int i=0;i<nfaces;i++){
      if(faces[i].is_point_inside_circumcircle($p)){
        segments[nsegments++] = faces[i].segments[0];
        segments[nsegments++] = faces[i].segments[1];
        segments[nsegments++] = faces[i].segments[2];
        faces[i] = null;
      }
    }
    int duplicates;
    for(int i=0;i<nsegments;i++){
      duplicates = 0;
      for(int j=0;j<nsegments;j++){
        if(segments[i].is_identical(segments[j])){ duplicates++; }
      }
      if(duplicates==1){
        ps[1] = segments[i].p1; ps[2] = segments[i].p2;
        faces[nfaces++] = new Face(ps);
      }
    }
    cleanup();
  }
  void cleanup(){
    Face[] temp = new Face[2000];
    int ntemp = 0;
    for(int i=0;i<nfaces;i++){
      if(faces[i]!=null){ temp[ntemp++] = faces[i]; }
    }
    arraycopy(temp,faces);
    nfaces = ntemp;
  }
  void render(){
    for(int i=0;i<nfaces;i++){
      if(faces[i].p1==boundary.p1||faces[i].p2==boundary.p1||faces[i].p3==boundary.p1||faces[i].p1==boundary.p2||faces[i].p2==boundary.p2||faces[i].p3==boundary.p2||faces[i].p1==boundary.p3||faces[i].p2==boundary.p3||faces[i].p3==boundary.p3) continue;
      faces[i].render();
    }
    /*
    for(int i=0;i<npoints;i++){
      points[i].render();
    }
    */
  }
}

//------ FACE ------//
class Face extends Polygon{
  Point p1,p2,p3,icp,ccp;;
  Plane pl;
  float ccr;
  Face(Point[] $points){
    super($points);
    p1 = $points[0]; p2 = $points[1]; p3 = $points[2];
    pl = new Plane(p1,p2,p3);
    icp = get_incenter_point();
    ccp = get_circumcenter_point();
    ccr = get_circumcircle_radius();
  }
  void orient(Point $p){
    if(pl.get_point_side($p)>0){
      flip();
    }
  }
  void flip(){
    Point temp = p2;
    p2 = p3; p3 = temp;
  }
  boolean is_acute(){
    float d1,d2,d3,x,h,y,a1,a2,a3;
    d1 = p1.get_distance_to(p2); d2 = p2.get_distance_to(p3); d3 = p3.get_distance_to(p1);
    x = (sq(d1)+sq(d2)-sq(d3))/(2*d2); h = sqrt(sq(d1)-sq(x)); y = d2-x;
    a1 = (atan(h/x)+PI)%PI; a2 = (atan(h/y)+PI)%PI; a3 = PI-(a1+a2);
    if(a1<HALF_PI&&a2<HALF_PI&&a3<HALF_PI){ return true; }
    return false;
  }
  float get_circumcircle_radius(){
    return ccp.get_distance_to(p1);
  }
  Point get_incenter_point(){
    float d1,d2,d3; Point p;
    d1 = p2.get_distance_to(p3); d2 = p3.get_distance_to(p1); d3 = p1.get_distance_to(p2);
    return new Point(((d1*p1.x)+(d2*p2.x)+(d3*p3.x))/(d1+d2+d3),((d1*p1.y)+(d2*p2.y)+(d3*p3.y))/(d1+d2+d3),((d1*p1.z)+(d2*p2.z)+(d3*p3.z))/(d1+d2+d3));
  }
  Point get_circumcenter_point(){
    Vector p12,p23,n12,n23; Point mid12,mid23; Line l12,l23; Segment s;
    pl.nv = pl.get_normal();
    p12 = new Vector(p2.x-p1.x,p2.y-p1.y,p2.z-p1.z); p23 = new Vector(p3.x-p2.x,p3.y-p2.y,p3.z-p2.z);
    n12 = cross_product(pl.nv,p12); n23 = cross_product(pl.nv,p23);
    mid12 = new Point((p2.x+p1.x)/2,(p2.y+p1.y)/2,(p2.z+p1.z)/2); mid23 = new Point((p3.x+p2.x)/2,(p3.y+p2.y)/2,(p3.z+p2.z)/2);
    l12 = new Line(mid12,new Point(mid12.x+n12.vx,mid12.y+n12.vy,mid12.z+n12.vz));
    l23 = new Line(mid23,new Point(mid23.x+n23.vx,mid23.y+n23.vy,mid23.z+n23.vz));
    return l12.get_segment_to_line(l23).p1;
  }
  boolean is_point_inside_circumcircle(Point $p){
    if(ccp.get_distance_to($p)<=ccr){ return true; }
    return false;
  }
  boolean is_line_intersecting(Line $l){
    if(!pl.is_line_intersecting($l)){ return false; }
    Point p; Vector v1,v2,v3; float a1,a2,a3;
    p = pl.get_line_intersect_point($l);
    if(p==global.error_point){ return false; }
    v1 = new Vector(p1.x-p.x,p1.y-p.y,p1.z-p.z); v1.unitize();
    v2 = new Vector(p2.x-p.x,p2.y-p.y,p2.z-p.z); v2.unitize();
    v3 = new Vector(p3.x-p.x,p3.y-p.y,p3.z-p.z); v3.unitize();
    a1 = acos(min(max(dot_product(v1,v2),-1),1));
    a2 = acos(min(max(dot_product(v2,v3),-1),1));
    a3 = acos(min(max(dot_product(v3,v1),-1),1));
    if(abs((a1+a2+a3)-TWO_PI)<=global.angle_tolerance){ return true; }
    return false;
  }
  boolean is_segment_intersecting(Segment $s,boolean $inclusive){
    Line l = new Line($s.p1,$s.p2);
    if(!pl.is_line_intersecting(l)){ return false; }
    Point p; Vector v1,v2,v3; float a1,a2,a3;
    p = pl.get_line_intersect_point(l);
    if($s.get_distance_to(p.x,p.y,p.z)>global.distance_tolerance){ return false; }
    v1 = new Vector(p1.x-p.x,p1.y-p.y,p1.z-p.z); v1.unitize();
    v2 = new Vector(p2.x-p.x,p2.y-p.y,p2.z-p.z); v2.unitize();
    v3 = new Vector(p3.x-p.x,p3.y-p.y,p3.z-p.z); v3.unitize();
    a1 = acos(min(max(dot_product(v1,v2),-1),1));
    a2 = acos(min(max(dot_product(v2,v3),-1),1));
    a3 = acos(min(max(dot_product(v3,v1),-1),1));
    if(abs((a1+a2+a3)-TWO_PI)<=global.angle_tolerance){ return true; }
    return false;
  }
  Point get_line_intersect_point(Line $l){
    //must test for intersection first or this will error or result in a point off the face
    return pl.get_line_intersect_point($l);
  }
  boolean cull(){
    float p1x,p1y,p2x,p2y,p3x,p3y;
    p1x = screenX(p1.x,p1.y,p1.z); p1y = screenY(p1.x,p1.y,p1.z);
    p2x = screenX(p2.x,p2.y,p2.z); p2y = screenY(p2.x,p2.y,p2.z);
    p3x = screenX(p3.x,p3.y,p3.z); p3y = screenY(p3.x,p3.y,p3.z);
    if(((p2y-p1y)/(p2x-p1x)-(p3y-p1y)/(p3x-p1x)<0)^(p1x<=p2x==p1x>p3x)){ return false; }
    return true;
  }
  void render(boolean $cull){
    if(!$cull||!cull()){
      super.render();
    }
  }
}

//------ GLOBAL ------//
//the global class holds all other default classes
//its only purpose is for organization and to imitate actionscript
class Global{
  Point zero_point,error_point;
  float[] sines,cosines;
  int w,h,d;
  Polygon stage;
  Face circumscribed_face;
  float distance_tolerance = .001;
  float simplify_distance_tolerance = 5;
  float slope_tolerance = .001;
  float simplify_slope_tolerance = .01;
  float angle_tolerance = .001;
  int angles = 720;
  Global(int $w,int $h,int $d){
    w = $w; h = $h; d = $d;
  }
  void init(){
    Point[] ps = new Point[4]; ps[0] = new Point(-w/2,-h/2,0); ps[1] = new Point(w/2,-h/2,0); ps[2] = new Point(w/2,h/2,0); ps[3] = new Point(-w/2,h/2,0);
    stage = new Polygon(ps);
    ps = new Point[3]; ps[0] = new Point(0,-h/2-sqrt(sq(w)-sq(w/2)),0); ps[1] = new Point(-w/2-h/sqrt(3),h/2,0); ps[2] = new Point(w/2+h/sqrt(3),h/2,0);
    circumscribed_face = new Face(ps);
    zero_point = new Point(0,0,0);
    error_point = new Point(-9999,-9999,-9999);
    sines = new float[angles]; cosines = new float[angles];
    for(int i=0;i<angles;i++){
      sines[i] = (float) Math.sin(((float) i/angles)*TWO_PI);
      cosines[i] = (float) Math.cos(((float) i/angles)*TWO_PI);
    }
  }
  float constrainX(float $x){
    return min(w/2,max(-w/2,$x));
  }
  float constrainY(float $y){
    return min(h/2,max(-h/2,$y));
  }
  float constrainZ(float $z){
    return min(0,max(-d,$z));
  }
  Point random_point(){
    //xy coordinates only
    return new Point(random(-w/2,w/2),random(-h/2,h/2),0);
  }
  float sin(float $n){
    while($n<0) $n += TWO_PI;
    return sines[(int)(angles*($n%TWO_PI)/TWO_PI)];
  }
  float cos(float $n){
    while($n<0) $n += TWO_PI;
    return cosines[(int)(angles*($n%TWO_PI)/TWO_PI)];
  }
  float randomize(float $n,float $r){
    return $n+random(-$r/2,$r/2);
  }
}

//------ LINE ------//
class Line{
  float a,b;
  Segment s;
  Line(Point $p1,Point $p2){
    if($p2.x-$p1.x!=0){
      a = ($p2.y-$p1.y)/($p2.x-$p1.x);
    }else{
      a = 999999999;
    }
    b = $p1.y-a*$p1.x;
    s = new Segment($p1,$p2);
  }
  void crop(){
    if(global.stage.is_splittable(this)){
      s = get_polygon_chord(global.stage);
    }
  }
  boolean is_ray_intersecting(float $x,float $y,boolean $inclusive){
    //xy coordinates only :: for inside-outside testing, etc. :: ray points right, starting from the given coordinates
    float pbua1 = (s.p2.x-s.p1.x)*($y-s.p1.y)-(s.p2.y-s.p1.y)*($x-s.p1.x);
    float pbu2 = s.p2.y-s.p1.y;
    if(pbu2==0){ return false; }
    float pbua = pbua1/pbu2;
    if($inclusive){
      if(pbua>=0){ return true; }
    }else{
      if(pbua>0){ return true; }
    }
    return false;
  }
  boolean is_line_intersecting(Line $l){
    //xy coordinates only
    float pbu2 = (s.p2.y-s.p1.y)*($l.s.p2.x-$l.s.p1.x)-(s.p2.x-s.p1.x)*($l.s.p2.y-$l.s.p1.y);
    if(pbu2==0){ return false; }
    return false;
  }
  boolean is_coord_on(float $x,float $y,float $z){
    float d = get_distance_to($x,$y,$z);
    if(d<=global.distance_tolerance){ return true; }
    return false;
  }
  Segment get_polygon_chord(Polygon $po){
    //xy coordinates only
    Point[] temp1 = new Point[$po.nsegments];
    int n1 = 0;
    for(int i=0;i<$po.nsegments;i++){
      if($po.segments[i].is_line_intersecting(this,true)){
        temp1[n1++] = $po.segments[i].get_intersect_point(s);
      }
    }
    if(n1>=2){
      if(n1!=2){
        //remove duplicates in case of on-point intersection
        Point[] temp2 = new Point[n1];
        int n2 = 0;
        for(int i=0;i<n1;i++){
          boolean found = false;
          for(int j=0;j<n2;j++){
            if(temp1[i].get_distance_to(temp2[j].x,temp2[j].y,temp2[j].z)<global.distance_tolerance){
              found = true;
              break;
            }
          }
          if(!found){
            temp2[n2++] = temp1[i];
          }
        }
        if(n2==2){
          return new Segment(new Point(temp2[0].x,temp2[0].y,temp2[0].z),new Point(temp2[1].x,temp2[1].y,temp2[1].z));
        }
      }else{
        return new Segment(new Point(temp1[0].x,temp1[0].y,temp1[0].z),new Point(temp1[1].x,temp1[1].y,temp1[1].z));
      }
    }
    return new Segment(global.error_point,global.error_point);
  }
  Point get_closest_point(float $x,float $y,float $z){
    float u = (($x-s.p1.x)*(s.p2.x-s.p1.x)+($y-s.p1.y)*(s.p2.y-s.p1.y)+($z-s.p1.z)*(s.p2.z-s.p1.z))/sq(dist(s.p1.x,s.p1.y,s.p1.z,s.p2.x,s.p2.y,s.p2.z));
    float x = s.p1.x+u*(s.p2.x-s.p1.x);
    float y = s.p1.y+u*(s.p2.y-s.p1.y);
    float z = s.p1.z+u*(s.p2.z-s.p1.z);
    return new Point(x,y,z);
  }
  float get_distance_to(float $x,float $y,float $z){
    Point p = get_closest_point($x,$y,$z);
    return dist(p.x,p.y,p.z,$x,$y,$z);
  }
  Segment get_segment_to_line(Line $l){
    //must test for zero distance before using this function
    float p13x,p13y,p13z,p43x,p43y,p43z,p21x,p21y,p21z,d1343,d4321,d1321,d4343,d2121,pbmua,pbmub;
    p13x = s.p1.x-$l.s.p1.x; p13y = s.p1.y-$l.s.p1.y; p13z = s.p1.z-$l.s.p1.z;
    p43x = $l.s.p2.x-$l.s.p1.x; p43y = $l.s.p2.y-$l.s.p1.y; p43z = $l.s.p2.z-$l.s.p1.z;
    p21x = s.p2.x-s.p1.x; p21y = s.p2.y-s.p1.y; p21z = s.p2.z-s.p1.z;
    d1343 = p13x*p43x+p13y*p43y+p13z*p43z; d4321 = p43x*p21x+p43y*p21y+p43z*p21z; d1321 = p13x*p21x+p13y*p21y+p13z*p21z; d4343 = p43x*p43x+p43y*p43y+p43z*p43z; d2121 = p21x*p21x+p21y*p21y+p21z*p21z;
    pbmua = (d1343*d4321-d1321*d4343)/(d2121*d4343-d4321*d4321);
    pbmub = (d1343+d4321*pbmua)/d4343;
    Point p1 = new Point(s.p1.x+pbmua*p21x,s.p1.y+pbmua*p21y,s.p1.z+pbmua*p21z);
    Point p2 = new Point($l.s.p1.x+pbmub*p43x,$l.s.p1.y+pbmub*p43y,$l.s.p1.z+pbmub*p43z);
    return new Segment(p1,p2);
  }
  void render(){
    s.render();
  }
}

//------ MASS ------//
//masses are slightly more sophisticated than particles, as they can accept forces
//they can maintain their radius from other masses and can be a part of a spring system
class Mass extends Particle{
  float m,fx,fy,fz;
  float density = 1.3;
  Mass(float $x,float $y,float $z,float $vx,float $vy,float $vz,float $r,float $density){
    super($x,$y,$z,$vx,$vy,$vz,$r,false);
    bouncing = true;
    density = $density;
    m = PI*sq(r)*density;
    fx = fy = fz = 0;
  }
  Mass(float $x,float $y,float $z){
    super($x,$y,$z,2,false);
    bouncing = true;
    m = 1;
    fx = fy = fz = 0;
  }
  void bump(Mass $m){
    //xy coordinates only
    float d = dist($m.x,$m.y,x,y);
    float rr = $m.r+r;
    if(d<rr&&d!=0){
      float a = atan2($m.y-y,$m.x-x);
      float cosa = cos(a);
      float sina = sin(a);
      float vx1p = cosa*vx+sina*vy;
      float vy1p = cosa*vy-sina*vx;
      float vx2p = cosa*$m.vx+sina*$m.vy;
      float vy2p = cosa*$m.vy-sina*$m.vx;
      float p = vx1p*m+vx2p*$m.m;
      float v = vx1p-vx2p;
      vx1p = (p-$m.m*v)/(m+$m.m);
      vx2p = v+vx1p;
      vx = cosa*vx1p-sina*vy1p;
      vy = cosa*vy1p+sina*vx1p;
      $m.vx = cosa*vx2p-sina*vy2p;
      $m.vy = cosa*vy2p+sina*vx2p;
      float diff = bounce_friction*((r+$m.r)-d)/2;
      float cosd = cosa*diff;
      float sind = sina*diff;
      x -= cosd;
      y -= sind;
      $m.x += cosd;
      $m.y += sind;
    }
  }
  void step(){
    vx += fx;
    vy += fy;
    vz += fz;
    super.step();
    fx = fy = fz = 0;
  }
}

//------ MUSCLE ------//
//a spring that expands and contracts repeatedly
class Muscle extends Spring{
  float td,otd;
  int frame = 0;
  int frames = 200;
  Muscle(Mass $m1,Mass $m2,float $k,float $d,float $td){
    super($m1,$m2,$k,$d);
    td = otd = $td;
  }
  void step(){
    frame++;
    d = od+(td-od)/2+cos(PI+TWO_PI*(frame%frames)/frames)*(td-od)/2;
    super.step();
  }
}

//------ PARTICLE ------//
//the particle class is stage-aware, in that it can wrap its position from one side of the screen to the other
//particles have no mass, but have a display radius
class Particle extends Point{
  float vx,vy,vz,tvx,tvy,tvz,r;
  boolean wrapping = false;
  boolean bouncing = false;
  boolean locked = false;
  float speed = 0.005;
  float wander_speed = 0.01;
  float attract_distance = 350;
  float attract_speed = 0.005;
  float repel_distance = 25;
  float repel_speed = 0.06;
  float gx = 0;
  float gy = 1;
  float gz = 0;
  float friction = 0.02;
  float bounce_friction = 0.4;
  Particle(float $x,float $y,float $z,float $vx,float $vy,float $vz,float $r,boolean $forces){
    super($x,$y,$z);
    vx = tvx = $vx; vy = tvy = $vy; vz = tvz = $vz; r = $r;
    if(!$forces){
      wander_speed = 0;
      attract_speed = 0;
      repel_speed = 0;
    }
  }
  Particle(float $x,float $y,float $z,float $r,boolean $forces){
    super($x,$y,$z);
    vx = tvx = 0; vy = tvy = 0; vz = tvz = 0; r = $r;
    if(!$forces){
      wander_speed = 0;
      attract_speed = 0;
      repel_speed = 0;
    }
  }
  void attract(Particle $p){
    if(attract_speed==0) return;
    float d = get_distance_to($p.x,$p.y,$p.z);
    if(d<attract_distance&&d>repel_distance){
      float dtvx = ((attract_distance-d)*($p.x-x)/d)*attract_speed;
      float dtvy = ((attract_distance-d)*($p.y-y)/d)*attract_speed;
      float dtvz = ((attract_distance-d)*($p.z-z)/d)*attract_speed;
      if(!locked&&!$p.locked){
        vx += dtvx/2; vy += dtvy/2; vz += dtvz/2;
        $p.vx += -dtvx/2; $p.vy += -dtvy/2; $p.vz += -dtvz/2;
      }else if(locked){
        $p.vx += -dtvx; $p.vy += -dtvy; $p.vz += -dtvz;
      }else{
        vx += dtvx; vy += dtvy; vz += dtvz;
      }
    }
  }
  void repel(Particle $p){
    if(repel_speed==0) return;
    float d = get_distance_to($p.x,$p.y,$p.z);
    if(d<repel_distance&&d>global.distance_tolerance){
      float dtvx = ((repel_distance-d)*($p.x-x)/d)*repel_speed;
      float dtvy = ((repel_distance-d)*($p.y-y)/d)*repel_speed;
      float dtvz = ((repel_distance-d)*($p.z-z)/d)*repel_speed;
      if(!locked&&!$p.locked){
        vx += -dtvx/2; vy += -dtvy/2; vz += -dtvz/2;
        $p.vx += dtvx/2; $p.vy += dtvy/2; $p.vz += dtvz/2;
      }else if(locked){
        $p.vx += dtvx; $p.vy += dtvy; $p.vz += dtvz;
      }else{
        vx += -dtvx; vy += -dtvy; vz += -dtvz;
      }
    }
  }
  void wander(boolean $z){
    if(wander_speed==0) return;
    tvx += random(-wander_speed,wander_speed);
    tvy += random(-wander_speed,wander_speed);
    if($z){
      tvz += random(-wander_speed,wander_speed);
    }
    vx += (tvx-vx)*speed;
    vy += (tvy-vy)*speed;
    vz += (tvz-vz)*speed;
  }
  void step(){
    vx += (float) gx;
    vy += (float) gy;
    vz += (float) gz;
    vx *= (float) 1-friction;
    vy *= (float) 1-friction;
    vz *= (float) 1-friction;
    move(vx,vy,vz);
    if(bouncing){
      bounce();
    }else if(wrapping){
      wrap();
    }
  }
  void bounce(){
    if(x>global.w/2-r||x<-global.w/2+r){
        vx *= -(1-bounce_friction);
        tvx *= -(1-bounce_friction);
        x = constrain(x,-global.w/2+r,global.w/2-r);
      }
      if(y>global.h/2-r||y<-global.h/2+r){
        vy *= -(1-bounce_friction);
        tvy *= -(1-bounce_friction);
        y = constrain(y,-global.h/2+r,global.h/2-r);
      }
      if(z>-r||z<-global.d+r){
        vz *= -(1-bounce_friction);
        tvz *= -(1-bounce_friction);
        z = constrain(z,-r,global.d-r);
      }
  }
  void wrap(){
    //xy coordinates only
    if(x>global.w/2-r||x<-global.w/2+r){
      x += 3*global.w/2;
      x %= global.w;
      x -= global.w/2;
    }
    if(y>global.h/2-r||y<-global.h/2+r){
      y += 3*global.h/2;
      y %= global.h;
      y -= global.h/2;
    }
  }
  void render(){
    if(r>0.5){
        pushMatrix();
        translate(x,y,z);
        ellipse(0,0,r*2,r*2);
        popMatrix();
        point(x,y,z);
    }else{
        point(x,y,z);
    }
    //  line(ox,oy,oz,x,y,z);
  }
}

//------ PLANE ------//
class Plane{
  Vector nv;
  float d;
  Point p1,p2,p3;
  Vector pv1,pv2,pv3,v12,v23,v31;
  Plane(Point $p1,Point $p2,Point $p3){
    p1 = $p1; p2 = $p2; p3 = $p3;
    v12 = new Vector(p2.x-p1.x,p2.y-p1.y,p2.z-p1.z); v23 = new Vector(p3.x-p2.x,p3.y-p2.y,p3.z-p2.z); v31 = new Vector(p1.x-p3.x,p1.y-p3.y,p1.z-p3.z);
    nv = get_normal();
    d = get_d();
  }
  Vector get_normal(){
    v12.vx = p2.x-p1.x; v12.vy = p2.y-p1.y; v12.vz = p2.z-p1.z; v23.vx = p3.x-p2.x; v23.vy = p3.y-p2.y; v23.vz = p3.z-p2.z;
    nv = cross_product(v12,v23);
    nv.unitize();
    return nv;
  }
  float get_d(){
    return -dot_product(nv,p1);
  }
  int get_point_side(Point $p){
    float side = dot_product(nv,$p)-d;
    if(side<0){ return 1; }
    if(side>0){ return -1; }
    return 0;
  }
  boolean is_plane_parallel(Plane $pl1){
    Vector v = cross_product($pl1.nv,nv);
    if(v.m==0){ return true; }
    return false;
  }
  boolean is_line_intersecting(Line $l){
    float pbmud = nv.vx*($l.s.p2.x-$l.s.p1.x)+nv.vy*($l.s.p2.y-$l.s.p1.y)+nv.vz*($l.s.p2.z-$l.s.p1.z);
    if(pbmud==0){ return false; } //plane and line do not intersect
    return true;
  }
  boolean is_segment_intersecting(Segment $s,boolean $inclusive){
    float pbmud,pbmu;
    nv = get_normal();
    d = get_d();
    pbmud = nv.vx*($s.p2.x-$s.p1.x)+nv.vy*($s.p2.y-$s.p1.y)+nv.vz*($s.p2.z-$s.p1.z);
    if(pbmud==0){ return false; } //plane and line do not intersect
    pbmu = (nv.vx*$s.p2.x+nv.vy*$s.p2.y+nv.vz*$s.p2.z+d)/pbmud;
    if($inclusive){ if(pbmu<0||pbmu>1){ return false; } }else{ if(pbmu<=0||pbmu>=1){ return false; } } //intersection is not on segment
    return true;
  }
  Point get_3plane_intersection_point(Plane $pl1,Plane $pl2){
    //must check for parallel planes first
    Vector n12,n23,n31; float px,py,pz,pbden;
    nv = get_normal();
    d = get_d();
    n12 = cross_product($pl1.nv,$pl2.nv); n23 = cross_product($pl2.nv,nv); n31 = cross_product(nv,$pl1.nv);
    pbden = dot_product($pl1.nv,n23);
    px = ($pl1.d*n23.vx+$pl2.d*n31.vx+d*n12.vx)/pbden;
    py = ($pl1.d*n23.vy+$pl2.d*n31.vy+d*n12.vy)/pbden;
    pz = ($pl1.d*n23.vz+$pl2.d*n31.vz+d*n12.vz)/pbden;
    return new Point(px,py,pz);
  }
  Point get_line_intersect_point(Line $l){
    //must check for line-plane intersection first
    float pbmu,pbmud;
    nv = get_normal();
    d = get_d();
    pbmud = nv.vx*($l.s.p2.x-$l.s.p1.x)+nv.vy*($l.s.p2.y-$l.s.p1.y)+nv.vz*($l.s.p2.z-$l.s.p1.z);
    if(pbmud!=0){
      pbmu = (nv.vx*$l.s.p2.x+nv.vy*$l.s.p2.y+nv.vz*$l.s.p2.z+d)/pbmud;
      return new Point($l.s.p2.x+($l.s.p1.x-$l.s.p2.x)*pbmu,$l.s.p2.y+($l.s.p1.y-$l.s.p2.y)*pbmu,$l.s.p2.z+($l.s.p1.z-$l.s.p2.z)*pbmu);
    }else{
      return global.error_point;
    }    
  }
  void render(Point $p){
    nv.render($p);
  }
}

//------ POINT ------//
class Point{
  float speed = .01;
  float x,y,z,ox,oy,oz,oox,ooy,ooz,tx,ty,tz,otx,oty,otz;
  Point(float $x,float $y,float $z){
    x = ox = oox = tx = otx = $x;
    y = oy = ooy = ty = oty = $y;
    z = oz = ooz = tz = otz = $z;
  }
  void reset(){
    x = oox; y = ooy; z = ooz; ox = oox; oy = ooy; oz = ooz; tx = oox; ty = ooy; tz = ooz; otx = oox; oty = ooy; otz = ooz;
  }
  void match(Point $p){
    x = $p.x; y = $p.y; z = $p.z; ox = $p.ox; oy = $p.oy; oz = $p.oz; tx = $p.tx; ty = $p.ty; tz = $p.tz; otx = $p.otx;  oty = $p.oty; otz = $p.otz;
  }
  void move(float $dx,float $dy,float $dz){
    ox = x; oy = y; oz = z; x += $dx; y += $dy; z += $dz; tx = x; ty = y; tz = z;
  }
  void move_to(float $x,float $y,float $z){
    ox = x; oy = y; oz = z; x = $x; y = $y; z = $z; tx = x; ty = y; tz = z;
  }
  void direct(float $dx,float $dy,float $dz){
    otx = tx; oty = ty; otz = tz; tx += $dx; ty += $dy; tz += $dz;
  }
  void direct_to(float $tx,float $ty,float $tz){
    otx = tx; oty = ty; otz = tz; tx = $tx; ty = $ty; tz = $tz;
  }
  void rotate(float $cosa,float $sina,String $axis,float $x,float $y,float $z){
    float dx,dy,dz;
    if($axis=="x"){
      dz = z-$z; dy = y-$y;
      z = $z+dz*$cosa-dy*$sina; y = $y+dy*$cosa+dz*$sina;
    }else if($axis=="y"){
      dx = x-$x; dz = z-$z;
      x = $x+dx*$cosa-dz*$sina; z = $z+dz*$cosa+dx*$sina;
    }else if($axis=="z"){
      dx = x-$x; dy = y-$y;
      x = $x+dx*$cosa-dy*$sina; y = $y+dy*$cosa+dx*$sina;
    }
    tx = x; ty = y; tz = z; ox = x; oy = y; oz = z; otx = x; oty = y; otz = z;
  }
  float get_distance_to(float $x,float $y,float $z){
    return dist(x,y,z,$x,$y,$z);
  }
  float get_distance_to(Point $p){
    return dist(x,y,z,$p.x,$p.y,$p.z);
  }
  void step(){
    ox = x;
    oy = y;
    oz = z;
    x += (tx-x)*speed;
    y += (ty-y)*speed;
    z += (tz-z)*speed;
  }
  void render(){
      beginShape();
      vertex(x-2,y-2,z);
      vertex(x+2,y-2,z);
      vertex(x+2,y+2,z);
      vertex(x-2,y+2,z);
      endShape(CLOSE);
  }
}

//------ POLYGON ------//
class Polygon{
  int npoints,nsegments;
  Point[] points = new Point[1000];
  Segment[] segments = new Segment[1000];
  Point centroid;
  Polygon(Point[] $points){
    npoints = nsegments = 0;
    for(int i=0;i<$points.length;i++){
      if($points[i]==null) break;
      add_point($points[i]);
    }
  }
  Polygon(){
    npoints = nsegments = 0;
  }
  void reset(){
    for(int i=0;i<nsegments;i++){
      segments[i].reset();
    }
  }
  void rotate(float $a,String $axis){
    float cosa = cos($a);
    float sina = sin($a);
    centroid = get_centroid_point();
    for(int i=0;i<npoints;i++){
      points[i].rotate(cosa,sina,$axis,centroid.x,centroid.y,centroid.z);
    }
  }
  void add_point(Point $p){
    for(int i=0;i<npoints;i++){
      if($p.get_distance_to(points[i].x,points[i].y,points[i].z)<=global.distance_tolerance){ return; }
    }
    points[npoints++] = $p;
    if(npoints>2){
      if(npoints==3){
        //create first closing segment
        segments[nsegments] = new Segment(points[npoints-2],points[npoints-1]);
        segments[nsegments+1] = new Segment(points[npoints-1],points[0]);
        nsegments += 2;
      }else{
        //replace closing segment
        segments[nsegments-1] = new Segment(points[npoints-2],points[npoints-1]);
        segments[nsegments++] = new Segment(points[npoints-1],points[0]);
      }
    }else if(npoints>1){
      segments[nsegments++] = new Segment(points[npoints-2],points[npoints-1]);
    }
  }
  void insert_point(Point $p,Point $after){
    //this is not an efficient way to insert points, just the easiest
    int ntemp = npoints;
    Point[] temp = new Point[1000];
    arraycopy(points,temp);
    points = new Point[1000];
    npoints = 0;
    nsegments = 0;
    for(int i=0;i<ntemp;i++){
      add_point(temp[i]);
      if(temp[i]==$after){ add_point($p); }
    }
  }
  void delete_point(Point $p){
    //this is not an efficient way to remove points, just the easiest :: for reducing lots of large polygons, this should target only the segment to be removed, rather than rebuilding the entire polygon
    int ntemp = npoints;
    Point[] temp = new Point[1000];
    arraycopy(points,temp);
    points = new Point[1000];
    npoints = 0;
    nsegments = 0;
    for(int i=0;i<ntemp;i++){
      if(temp[i]!=$p){
        add_point(temp[i]);
      }
    }
  }
  Polygon get_bounding_box(){
    //xy coordinates only
    float xmin = 9999; float ymin = 9999; float xmax = -9999; float ymax = -9999;
    for(int i=0;i<npoints;i++){
      xmin = min(points[i].x,xmin);
      ymin = min(points[i].y,ymin);
      xmax = max(points[i].x,xmax);
      ymax = max(points[i].y,ymax);
    }
    Point[] ps = new Point[4]; ps[0] = new Point(xmin,ymin,0); ps[1] = new Point(xmax,ymin,0); ps[2] = new Point(xmax,ymax,0); ps[3] = new Point(xmin,ymax,0);
    return new Polygon(ps);
  }
  void simplify(){
    //xy coordinates only
    if(nsegments>2){
      for(int i=0;i<nsegments;i++){
        if(segments[i].get_length()<global.simplify_distance_tolerance||abs(segments[i].get_slope()-segments[(i+1)%nsegments].get_slope())<global.simplify_slope_tolerance){
          delete_point(points[(i+1)%npoints]);
          simplify();
          break;
        }
      }
    }
  }
  void densify(float $d){
    for(int i=0;i<nsegments;i++){
      if(segments[i].get_length()>$d){
        insert_point(segments[i].get_midpoint(),segments[i].p1);
        densify($d);
        break;
      }
    }
  }
  boolean is_complex(){
    //xy coordinates only
    if(npoints!=nsegments){ return true; }
    for(int i=0;i<nsegments;i++){
      for(int j=i+1;j<nsegments;j++){
        if(j==i+1||j==(i+nsegments-1)%nsegments){
          if(segments[i].is_segment_intersecting(segments[j],false)){ return true; }
        }else{
          if(segments[i].is_segment_intersecting(segments[j],true)){ return true; }
        }
      }
    }
    return false;
  }
  boolean is_coord_inside(float $x,float $y){
    //xy coordinates only :: this technique is slower but more accurate than the ray intersection method :: this checks the sum of the angles between all point pairs and the tested point
    float a1,a2;
    float a = 0;
    for(int i=0;i<nsegments;i++){
      a1 = atan2(segments[i].p1.y-$y,segments[i].p1.x-$x);
      a2 = atan2(segments[i].p2.y-$y,segments[i].p2.x-$x);
      a += (a2-a1+5*PI)%TWO_PI-PI; //make sure a falls between -pi and pi
    }
    if(abs(a)+global.angle_tolerance<PI){ return false; }
    return true;
  }
  boolean is_polygon_inside(Polygon $po){
    //xy coordinates only
    for(int i=0;i<npoints;i++){
      if(!is_coord_inside(points[i].x,points[i].y)){ return false; }
    }
    return true;
  }
  boolean is_polygon_intersecting(Polygon $po){
    //xy coordinates only
    for(int i=0;i<nsegments;i++){
      for(int j=0;j<nsegments;j++){
        if(segments[i].is_segment_intersecting(segments[j],true)){ return true; }
      }
    }
    if(is_polygon_inside(this)){ return true; }
    if(is_polygon_inside($po)){ return true; }
    return false;
  }
  boolean is_splittable(Line $l){
    //xy coordinates only
    if(is_complex()){ return false; }
    int ints = 0;
    for(int i=0;i<npoints;i++){
      if($l.is_coord_on(points[i].x,points[i].y,0)){
        ints++;
      }else if(segments[i].is_line_intersecting($l,false)){
        ints++;
      }
    }
    if(ints==2){ return true; }
    return false;
  }
  float get_distance_to(float $x,float $y,float $z){
    float d = segments[0].get_distance_to($x,$y,$z);
    for(int i=1;i<nsegments;i++){
      float temp = segments[i].get_distance_to($x,$y,$z);
      if(temp<d){ d = temp; }
    }
    return d;
  }
  float get_signed_area(){
    //xy coordinates only :: this method of calculating the area will return a signed value: negative means counterclockwise orientation, positive means clockwise :: the signed area is needed for the centroid calculation
    if(is_complex()){ return 0; }
    float a = 0;
    for(int i=0;i<npoints;i++){
      a += points[i].x*points[(i+1)%npoints].y-points[(i+1)%npoints].x*points[i].y;
    }
    return (a*0.5);
  }
  float get_area(){
    //xy coordinates only
    return abs(get_signed_area());
  }
  float get_width(){
    float xmin = 9999; float xmax = -9999;
    for(int i=0;i<npoints;i++){
      xmin = min(points[i].x,xmin);
      xmax = max(points[i].x,xmax);
    }
    return (xmax-xmin);
  }
  float get_height(){
    float ymin = 9999; float ymax = -9999;
    for(int i=0;i<npoints;i++){
      ymin = min(points[i].y,ymin);
      ymax = max(points[i].y,ymax);
    }
    return (ymax-ymin);
  }
  Point get_closest_point(float $x,float $y,float $z){
    //xy coordinates only
    float temp,d; Point p;
    d = segments[0].get_distance_to($x,$y,$z);
    p = segments[0].get_closest_point($x,$y,$z);
    for(int i=1;i<nsegments;i++){
      temp = segments[i].get_distance_to($x,$y,$z);
      if(temp<d){
        d = temp;
        p = segments[i].get_closest_point($x,$y,$z);
      }
    }
    return p;
  }
  Point get_points_centroid_point(){
    //this retrieves the centroid of the points that compose the polygon, not the centroid of the polygon! :: they're not the same thing, it's a cruel world
    float cx = 0; float cy = 0; float cz = 0;
    for(int i=0;i<npoints;i++){
      cx += points[i].x; cy += points[i].y; cz += points[i].z;
    }
    cx /= npoints; cy /= npoints; cz /= npoints;
    Point p = new Point(cx,cy,cz);
    return p;
  }
  Point get_centroid_point(){
    //xy coordinates only
    float a = get_signed_area();
    if(a==0){ return global.error_point; }
    float cx = 0; float cy = 0;
    for(int i=0;i<npoints;i++){
      float temp = points[i].x*points[(i+1)%npoints].y-points[(i+1)%npoints].x*points[i].y;
      cx += (points[i].x+points[(i+1)%npoints].x)*temp;
      cy += (points[i].y+points[(i+1)%npoints].y)*temp;
    }
    cx /= a*6; cy /= a*6;
    return new Point(cx,cy,0);
  }
  Polygon get_convex_hull(){
    if(npoints<4) return this;
    //xy coordinates only :: returns the convex hull for this polygon's set of points :: this is a relatively costly function as it is scripted here
    float a,d;
    int ip = 0; int ntemp = 0; Point[] temp = new Point[npoints]; float[] as = new float[npoints]; float[] ds = new float[npoints];
    //find the topmost point
    for(int i=1;i<npoints;i++){
      if(points[i].y<points[ip].y){ ip = i; }
    }
    //if two points are colinear with the topmost point, take only the one furthest away
    for(int i=0;i<npoints;i++){
      if(i!=ip){
        a = (atan2(points[ip].y-points[i].y,points[ip].x-points[i].x)+PI)%TWO_PI;
        d = dist(points[ip].x,points[ip].y,points[i].x,points[i].y);
        if(d>0){
          boolean found = false;
          for(int j=0;j<ntemp;j++){
            if(a==as[j]){
              if(d>ds[j]){
                //remove the closer point
                Point[] temp1 = (Point[]) subset(temp,0,j); Point[] temp2 = (Point[]) subset(temp,j+1,temp.length-(j+1)); temp = (Point[]) concat(temp1,temp2);
                float[] as1 = subset(as,0,j); float[] as2 = subset(as,j+1,temp.length-(j+1)); as = concat(as1,as2);
                float[] ds1 = subset(ds,0,j); float[] ds2 = subset(ds,j+1,temp.length-(j+1)); ds = concat(ds1,ds2);
                ntemp--; j--;
              }else{
                //skip this point
                found = true;
                break;
              }
            }
          }
          if(!found){
            //add point to array
            temp[ntemp] = points[i]; as[ntemp] = a; ds[ntemp++] = d;
          }
        }
      }
    }
    //bubble sort the arrays according to angle
    for(int i=0;i<ntemp-1;i++){
      for(int j=0;j<ntemp-1-i;j++){
        if(as[j]>as[j+1]){
          Point temp1 = temp[j]; temp[j] = temp[j+1]; temp[j+1] = temp1;
          float as1 = as[j]; as[j] = as[j+1]; as[j+1] = as1;
        }
      }
    }
    temp[ntemp++] = points[ip];
    temp = (Point[]) subset(temp,0,ntemp);
    temp = (Point[]) reverse(temp);
    //find convex hull points
    if(ntemp>3){
      for(int i=0;i<ntemp;i++){
        float pbside = (temp[(i+1+ntemp)%ntemp].y-temp[(i+ntemp)%ntemp].y)*(temp[(i+2+ntemp)%ntemp].x-temp[(i+ntemp)%ntemp].x)-(temp[(i+1+ntemp)%ntemp].x-temp[(i+ntemp)%ntemp].x)*(temp[(i+2+ntemp)%ntemp].y-temp[(i+ntemp)%ntemp].y);
        if(pbside<0){
          //remove the point if it lies on the wrong side
          if((i+1+ntemp)%ntemp==0){
            temp = (Point[]) subset(temp,1,ntemp-1);
          }else if((i+1+ntemp)%ntemp==ntemp-1){
            temp = (Point[]) subset(temp,0,ntemp-1);
          }else{
            Point[] temp1 = (Point[]) subset(temp,0,(i+1+ntemp)%ntemp);
            Point[] temp2 = (Point[]) subset(temp,(i+2+ntemp)%ntemp,ntemp-(i+2+ntemp)%ntemp);
            temp = (Point[]) concat(temp1,temp2);
          }
          i -= 2; ntemp--;
          temp = (Point[]) subset(temp,0,ntemp);
        }
      }
    }
    //return new polygon
    //temp = (Point[]) subset(temp,0,ntemp);
    Polygon po = new Polygon(temp);
    po.simplify();
    return po;
  }
  Polygon get_outline(float $cohesion_distance){
    if(npoints<4) return this;
    float a,mina;
    Vector v,ov;
    int n = 0; int active = 0; int next = 0; int previous = 0; int ip = 0; int ntemp = 0; Point[] temp = new Point[npoints]; float cosa = cos(-PI+0.001); float sina = sin(-PI+0.001);
    //find the topmost point
    for(int i=0;i<npoints;i++){
      if(points[i].y<points[ip].y){ ip = i; }
    }
    active = ip;
    ov = new Vector(-100,0.001,0);
    v = new Vector(0,0,0);
    mina = 9999;
    //repeat until we hit the topmost point again
    while((active!=ip||n==0)&&n<100){
      mina = 9999;
      for(int j=0;j<npoints;j++){
        if(j!=active&&points[active].get_distance_to(points[j])<=$cohesion_distance){
          v.vx = points[j].x-points[active].x; v.vy = points[j].y-points[active].y;
          a = atan2(-ov.vy*v.vx+ov.vx*v.vy,ov.vx*v.vx+ov.vy*v.vy);
          if(a<0) a += TWO_PI;
          if(a<mina){
            mina = a;
            next = j;
          }
        }
      }
      ov.vx = points[next].x-points[active].x; ov.vy = points[next].y-points[active].y;
      ov.rotate(cosa,sina,"z");
      if(next==previous) return this;
      previous = active;
      active = next;
      temp[ntemp++] = points[active];
      n++;
    }
    //temp = (Point[]) subset(temp,0,ntemp);
    return new Polygon(temp);
  }
  Polygon[] split(Line $l){
    //xy coordinates only :: must test to make sure it is a simple polygon first or you'll get strange results
    int ip = 0; Point[] ints = new Point[npoints]; float[] intsi = new float[npoints+2]; int nints = 0; Point[] temp1 = new Point[npoints+2]; float[] temp1i = new float[npoints+2]; int ntemp1 = 0; Point[] temp2 = new Point[npoints+2]; int ntemp2 = 0;
    for(int i=0;i<npoints;i++){
      if($l.is_coord_on(points[i].x,points[i].y,0)){
        ints[nints] = points[i]; intsi[nints++] = i;
        temp1[ntemp1] = points[i]; temp1i[ntemp1++] = i;
        ip = i;
      }else if(segments[i].is_line_intersecting($l,false)){
        Point lint = $l.s.get_intersect_point(segments[i]);
        ints[nints] = lint; intsi[nints++] = i+0.5;
        if(nints%2==0){ temp1[ntemp1] = points[i]; temp1i[ntemp1++] = i; }
        temp1[ntemp1] = lint; temp1i[ntemp1++] = i+0.5; 
        ip = i;
      }else if(nints%2==1){
        temp1[ntemp1] = points[i]; temp1i[ntemp1++] = i;
      }
    }
    for(int i=ip;i<ip+npoints;i++){
      boolean found = false;
      for(int j=0;j<ntemp1;j++){
        if(i%npoints==temp1i[j]){ found = true; break; }
      }
      if(!found){ temp2[ntemp2++] = points[i%npoints]; }
    }
    temp2[ntemp2] = new Point(0,0,0); temp2[ntemp2++].match(ints[0]);
    temp2[ntemp2] = new Point(0,0,0); temp2[ntemp2++].match(ints[1]);
    //temp1 = (Point[]) subset(temp1,0,ntemp1);
    //temp2 = (Point[]) subset(temp2,0,ntemp2);
    Polygon po1 = new Polygon(temp1);
    Polygon po2 = new Polygon(temp2);
    Polygon[] pos = {po1,po2};
    return pos;
  }
  void render(){
    if(npoints<3) return;
      beginShape();
    for(int i=0;i<npoints;i++){
        vertex(points[i].x,points[i].y,points[i].z);
    }
      endShape(CLOSE);
    /*
    for(int i=0;i<npoints;i++){
      points[i].render();
    }
    */
  }
  void render(String $type){
    if(npoints<3) return;
  
      beginShape(POLYGON); 
    if($type=="line"){
      for(int i=0;i<npoints;i++){
          vertex(points[i].x,points[i].y,points[i].z);
      }
    }
    
    if($type=="curve"){
        curveTightness(-0.8);
        curveVertex(points[npoints-1].x,points[npoints-1].y,points[npoints-1].z);
      for(int i=0;i<npoints;i++){
          curveVertex(points[i].x,points[i].y,points[i].z);
      }
        curveVertex(points[0].x,points[0].y,points[0].z);
        curveVertex(points[1].x,points[1].y,points[1].z);
    }
    
    if($type=="bezier"){
        vertex((points[npoints-1].x+points[0].x)/2,(points[npoints-1].y+points[0].y)/2,(points[npoints-1].z+points[0].z)/2);
      for(int i=0;i<npoints;i++){
            bezierVertex(points[i].x,points[i].y,points[i].z,points[i].x,points[i].y,points[i].z,(points[(i+1)%npoints].x+points[i].x)/2,(points[(i+1)%npoints].y+points[i].y)/2,(points[(i+1)%npoints].z+points[i].z)/2);
       }
    }
      endShape(CLOSE);
      
   // }
    /*
    for(int i=0;i<npoints;i++){
      points[i].render();
    }
    */
  }
  void render(PImage $img,float $s){
    if(npoints<3) return;
      beginShape();
      texture($img);
    for(int i=0;i<npoints;i++){
        vertex(round(points[i].x),round(points[i].y),round(points[i].z),round($s*(points[i].x+global.w/2)),round($s*(points[i].y+global.h/2)));
    }
      endShape(CLOSE);
  }
}
/*
  boolean is_coord_inside(float $x,float $y){
    //xy coordinates only :: this technique has a shortcoming :: when the point tested aligns vertically with either the topmost or bottommost point of the polygon, the tested point is said to lie inside, when in reality, it must be outside
    int ints = 0;
    for(int i=0;i<nsegments;i++){
      if(segments[i].is_ray_intersecting($x,$y,true)){
        ints++;
      }
    }
    if(ints%2==0){ return false; }
    return true;
  }
  boolean is_coord_inside(float $x,float $y){
    //xy coordinates only :: this is an alternative to the angle sum method :: it uses the dot product and only one acos calc, but seems to run slower than the atan method, probably due to the creation of the vector objects
    Vector v1 = new Vector(0,0,0);
    Vector v2 = new Vector(0,0,0);
    float a = 0;
    for(int i=0;i<nsegments;i++){
      v1.vx = segments[i].p1.x-$x; v1.vy = segments[i].p1.y-$y; v1.unitize();
      v2.vx = segments[i].p2.x-$x; v2.vy = segments[i].p2.y-$y; v2.unitize();
      a += acos(dot_product(v1,v2));
    }
    if(abs(a-TWO_PI)<global.angle_tolerance){ return true; }
    return false;
  }
  */
  
  //------ POLYLINE ------//
class Polyline{
  Segment[] segments = new Segment[1000];
  int nsegments;
  Polyline(Segment[] $segments){
    nsegments = 0;
    for(int i=0;i<$segments.length;i++){
      if($segments[i]==null) break;
      add_segment($segments[i]);
    }
  }
  Polyline(Point[] $points){
    nsegments = 0;
    for(int i=0;i<$points.length;i++){
      if($points[i]==null) break;
      add_point($points[i]);
    }
  }
  Polyline(){
    nsegments = 0;
  }
  float get_length(){
    float l = 0;
    for(int i=0;i<nsegments;i++){
      l += segments[i].get_length();
    }
    return l;
  }
  void add_point(Point $p){
    if(nsegments==0){
      add_segment(new Segment($p,new Point($p.x+0.1,$p.y+.01,$p.z)));
    }else{
      add_segment(new Segment(segments[nsegments-1].p2,$p));
    }
  }
  void add_segment(Segment $s){
    segments[nsegments++] = $s;
  }
  void render(){
    if(nsegments<1) return;
    for(int i=0;i<nsegments;i++){
      segments[i].render();
    }
  }
}

//------ RIGID ------//
//rigids are polygons that attempt to hold their shape when subjected to forces :: incomplete
class Rigid extends Polygon{
  int nmasses;
  Mass[] masses = new Mass[1000];
  float density = 1.3;
  float m;
  Rigid(Mass[] $masses,float $density){
    super($masses);
    for(int i=0;i<$masses.length;i++){
      if($masses[i]==null) break;
      add_mass($masses[i]);
    }
    m = get_area()*$density;
  }
  void add_mass(Mass $m){
    masses[nmasses++] = $m;
  }
  void step(){
    rotate(0.01,"z");
    centroid = get_centroid_point();
  }
  void render(){
    super.render();
    centroid.render();
  }
}

//------ SEGMENT ------//
class Segment{
  float l;
  Point p1,p2;
  Segment(Point $p1,Point $p2){
    p1 = $p1; p2 = $p2;
    l = get_length();
  }
  void reset(){
    p1.reset();
    p2.reset();
  }
  void match(Segment $s){
    p1.match($s.p1);
    p2.match($s.p2);
  }
  float get_length(){
    return dist(p1.x,p1.y,p1.z,p2.x,p2.y,p2.z);
  }
  Point get_midpoint(){
    return new Point((p1.x+p2.x)/2,(p1.y+p2.y)/2,(p1.z+p2.z)/2);
  }
  float get_angle(){
    return atan2(p2.y-p1.y,p2.x-p1.x);
  }
  float get_slope(){
    //xy coordinates only
    if(p2.x!=p1.x){
      return ((p2.y-p1.y)/(p2.x-p1.x));
    }else{
      return 999999999;
    }
  }
  boolean is_identical(Segment $s){
    if((p1==$s.p1&&p2==$s.p2)||(p2==$s.p1&&p1==$s.p2)){ return true; }
    return false;
  }
  boolean is_coincident(Segment $s){
    float slope1 = get_slope();
    float slope2 = $s.get_slope();
    if(is_coord_on($s.p1.x,$s.p1.y,$s.p1.z)&&abs(slope1-slope2)<=global.slope_tolerance){ return true; }
    return false;
  }
  boolean is_ray_intersecting(float $x,float $y,boolean $inclusive){
    //xy coordinates only :: for inside-outside testing, etc. :: ray points right, starting from the given coordinates
    float pbua1 = (p2.x-p1.x)*($y-p1.y)-(p2.y-p1.y)*($x-p1.x);
    float pbu2 = p2.y-p1.y;
    float pbub1 = $y-p1.y;
    if(pbu2==0){ return false; }
    float pbua = pbua1/pbu2;
    float pbub = pbub1/pbu2;
    if($inclusive){
      if(pbua>=0&&pbub>0&&pbub<=1){ return true; }
    }else{
      if(pbua>0&&pbub>0&&pbub<=1){ return true; }
    }
    return false;
  }
  boolean is_line_intersecting(Line $l,boolean $inclusive){
    //xy coordinates only
    float pbua1 = (p2.x-p1.x)*($l.s.p1.y-p1.y)-(p2.y-p1.y)*($l.s.p1.x-p1.x);
    float pbu2 = (p2.y-p1.y)*($l.s.p2.x-$l.s.p1.x)-(p2.x-p1.x)*($l.s.p2.y-$l.s.p1.y);
    float pbub1 = ($l.s.p2.x-$l.s.p1.x)*($l.s.p1.y-p1.y)-($l.s.p2.y-$l.s.p1.y)*($l.s.p1.x-p1.x);
    if(pbu2==0){ return false; }
    float pbua = pbua1/pbu2;
    float pbub = pbub1/pbu2;
    if($inclusive){
      if(pbub>=0&&pbub<=1){ return true; }
    }else{
      if(pbub>0&&pbub<1){ return true; }
    }
    return false;
  }
  boolean is_segment_intersecting(Segment $s,boolean $inclusive){
    //xy coordinates only
    float pbua1 = (p2.x-p1.x)*($s.p1.y-p1.y)-(p2.y-p1.y)*($s.p1.x-p1.x);
    float pbu2 = (p2.y-p1.y)*($s.p2.x-$s.p1.x)-(p2.x-p1.x)*($s.p2.y-$s.p1.y);
    float pbub1 = ($s.p2.x-$s.p1.x)*($s.p1.y-p1.y)-($s.p2.y-$s.p1.y)*($s.p1.x-p1.x);
    if(pbu2==0){ return false; }
    float pbua = pbua1/pbu2;
    float pbub = pbub1/pbu2;
    if($inclusive){
      if(pbub>=0&&pbub<=1&&pbua>=0&&pbua<=1){ return true; }
    }else{
      if(pbub>0&&pbub<1&&pbua>0&&pbua<1){ return true; }
    }
    return false;
  }
  boolean is_coord_on(float $x,float $y,float $z){
    float d = get_distance_to($x,$y,$z);
    if(d<=global.distance_tolerance){ return true; }
    return false;
  }
  float get_distance_to(float $x,float $y,float $z){
    Point p = get_closest_point($x,$y,$z);
    return dist(p.x,p.y,p.z,$x,$y,$z);
  }
  Point get_closest_point(float $x,float $y,float $z){
    float u = (($x-p1.x)*(p2.x-p1.x)+($y-p1.y)*(p2.y-p1.y)+($z-p1.z)*(p2.z-p1.z))/sq(dist(p1.x,p1.y,p1.z,p2.x,p2.y,p2.z));
    float x = p1.x+u*(p2.x-p1.x);
    float y = p1.y+u*(p2.y-p1.y);
    float z = p1.z+u*(p2.z-p1.z);
    if(x>p1.x&&x>p2.x){ x = max(p1.x,p2.x); }
    if(x<p1.x&&x<p2.x){ x = min(p1.x,p2.x); }
    if(y>p1.y&&y>p2.y){ y = max(p1.y,p2.y); }
    if(y<p1.y&&y<p2.y){ y = min(p1.y,p2.y); }
    if(z>p1.z&&z>p2.z){ z = max(p1.z,p2.z); }
    if(z<p1.z&&z<p2.z){ z = min(p1.z,p2.z); }
    return new Point(x,y,z);
  }
  Point get_intersect_point(Segment $s){
    //xy coordinates only :: must test for on-segment intersection before using this, otherwise it will project the segments as lines to their intersection point :: it will also return {9999,9999,9999} for parallel lines (should be tested for prior to using this)
    float pbu2 = (p2.y-p1.y)*($s.p2.x-$s.p1.x)-(p2.x-p1.x)*($s.p2.y-$s.p1.y);
    if(pbu2!=0){
      float pbua1 = (p2.x-p1.x)*($s.p1.y-p1.y)-(p2.y-p1.y)*($s.p1.x-p1.x);
      float pbua = pbua1/pbu2;
      return new Point($s.p1.x+($s.p2.x-$s.p1.x)*pbua,$s.p1.y+($s.p2.y-$s.p1.y)*pbua,0);
    }
    return null;
  }
  void render(){
      line(p1.x,p1.y,p1.z,p2.x,p2.y,p2.z);
  }
}

//------ SHADOW ------//
//shadows are polygons cast on to terrains
class Shadow{
  Polygon po1,po2;
  Terrain te;
  float sun_ry = PI/4;
  float sun_rz = PI;
  Shadow(Polygon $po1,Terrain $te){
    po1 = $po1; te = $te;
    project();
  }
  void project(){
    Point sun = new Point(100,0,0); sun.rotate(cos(sun_ry),sin(sun_ry),"y",0,0,0); sun.rotate(cos(sun_rz),sin(sun_rz),"z",0,0,0);
    Line sunlight = new Line(new Point(0,0,0),sun);
    Point[] points = {};
    for(int i=0;i<po1.nsegments;i++){
      points = (Point[]) concat(points,project_segment(po1.segments[i],sunlight));
    }
    po2 = new Polygon(points);
  }
  Point[] project_segment(Segment $s,Line $l){
    Point[] points = {};
    Point p1 = get_projected_point($s.p1,$l);
    if(p1!=global.error_point){
      points = (Point[]) append(points,p1);
      Point p2 = get_projected_point($s.p2,$l);
      if(p2!=global.error_point){
        //get inbetween points
        Segment s = new Segment(p1,p2);
        Segment[] segments = te.get_edge_intersect_segments(s);
        if(segments.length>0){
          float[] ds = new float[segments.length+1];
          ds[0] = 0;
          for(int i=0;i<segments.length;i++){
            //get intersect points
            Point temp = s.get_intersect_point(segments[i]);
            if(temp!=global.error_point){
              //get xy distance to p1
              ds[i+1] = dist(temp.x,temp.y,p1.x,p1.y);
              //project from the XY plane up/down to segment
              temp = te.get_line_intersect_point(new Line(temp,new Point(temp.x,temp.y,temp.z-100)));
              if(temp!=global.error_point){ points = (Point[]) append(points,temp); }
            }            
          }
          //sort by xy distance to p1
          for(int i=0;i<points.length-1;i++){
            for(int j=0;j<points.length-1-i;j++){
              if(ds[j]>ds[j+1]){
                Point points1 = points[j]; points[j] = points[j+1]; points[j+1] = points1;
                float ds1 = ds[j]; ds[j] = ds[j+1]; ds[j+1] = ds1;
              }
            }
          }
        }
      }
    }
    return points;
  }
  Point get_projected_point(Point $p,Line $l){
    float dx = $p.x-$l.s.p1.x;
    float dy = $p.y-$l.s.p1.y;
    float dz = $p.z-$l.s.p1.z;
    $l.s.p1.move(dx,dy,dz);
    $l.s.p2.move(dx,dy,dz);
    return get_closest_point(te.get_line_intersect_points($l),$p);
  }
  Point get_closest_point(Point[] $points,Point $p){
    if($points.length>0){
      float[] ds = new float[$points.length];
      for(int i=0;i<$points.length;i++) ds[i] = $points[i].get_distance_to($p);
      for(int i=0;i<$points.length-1;i++){
        for(int j=0;j<$points.length-1-i;j++){
          if(ds[j]>ds[j+1]){
            Point points1 = $points[j]; $points[j] = $points[j+1]; $points[j+1] = points1;
            float ds1 = ds[j]; ds[j] = ds[j+1]; ds[j+1] = ds1;
          }
        }
      }
      return $points[0];
    }else{
      return global.error_point;
    }
  }
  void render(){
    po2.render();
  }
}

//------ SPRING ------//
//springs join and move masses
class Spring extends Segment{
  float k,d,od;
  Mass m1,m2;
  Spring(Mass $m1,Mass $m2,float $k,float $d){
    super($m1,$m2);
    m1 = $m1; m2 = $m2; k = $k; d = od = $d;
  }
  void step(){
    float dd = (get_length()-d)/2;
    float dx,dy,dz,u;
    dx = m2.x-m1.x;
    dy = m2.y-m1.y;
    dz = m2.z-m1.z;
    u = mag(dx,dy,dz);
    if(!m1.locked&&!m2.locked){
      m1.fx += (dd*k*dx/u)/m1.m;
      m1.fy += (dd*k*dy/u)/m1.m;
      m1.fz += (dd*k*dz/u)/m1.m;
      m2.fx -= (dd*k*dx/u)/m2.m;
      m2.fy -= (dd*k*dy/u)/m2.m;
      m2.fz -= (dd*k*dz/u)/m2.m;
    }else if(m1.locked){
      m2.fx -= (dd*k*dx/u)/m2.m;
      m2.fy -= (dd*k*dy/u)/m2.m;
      m2.fz -= (dd*k*dz/u)/m2.m;
    }else if(m2.locked){
      m1.fx += (dd*k*dx/u)/m1.m;
      m1.fy += (dd*k*dy/u)/m1.m;
      m1.fz += (dd*k*dz/u)/m1.m;
    }
  }
  void render(boolean $zigzag){
    if($zigzag&&m1.z==0&&m2.z==0){
      float l = get_length();
      int kinks = max(6,ceil(od/10));
        pushMatrix();
        translate(m1.x,m1.y);
        rotateZ(get_angle());
        beginShape();
      for(int i=0;i<kinks;i++){
        if(i<=3||i>=kinks-4){
            vertex(i*l/(kinks-1),0);
        }else{
          if(i%2==0){
              vertex(i*l/(kinks-1),15);
          }else{
              vertex(i*l/(kinks-1),-15);
          }
        }
      }
        endShape();
        popMatrix();
    }else{
      render();
    }
  }
  void render(){
      line(m1.x,m1.y,m1.z,m2.x,m2.y,m2.z);
  }
}

//------ TERRAIN ------//
//a grid of connected points and faces
class Terrain{
  Point[][] points;
  Face[][][] faces;
  int xpoints,ypoints;
  float x,y,z,w,h,d,xspacing,yspacing;
  Terrain(float $x,float $y,float $z,float $w,float $h,float $d,float $density){
    x = $x; y = $y; z = $z; w = $w; h = $h; d = $d;
    xpoints = round(w*$density)+1;
    ypoints = round(h*$density)+1;
    xspacing = w/(xpoints-1);
    yspacing = h/(ypoints-1);
    points = new Point[xpoints][ypoints];
    for(int i=0;i<xpoints;i++){
      for(int j=0;j<ypoints;j++){
        points[i][j] = new Point(x+i*xspacing,y+j*yspacing,z);
      }
    }
    faces = new Face[xpoints-1][ypoints-1][2];
    for(int i=0;i<xpoints-1;i++){
      for(int j=0;j<ypoints-1;j++){
        Point[] ps1 = new Point[3]; Point[] ps2 = new Point[3];
        if((i%2==0&&j%2==1)||(i%2==1&&j%2==0)){
          ps1[0] = points[i][j]; ps1[1] = points[i+1][j]; ps1[2] = points[i][j+1];
          ps2[0] = points[i+1][j+1]; ps2[1] = points[i][j+1]; ps2[2] = points[i+1][j];
        }else{
          ps1[0] = points[i][j+1]; ps1[1] = points[i][j]; ps1[2] = points[i+1][j+1];
          ps2[0] = points[i+1][j]; ps2[1] = points[i+1][j+1]; ps2[2] = points[i][j];
        }
        faces[i][j][0] = new Face(ps1);
        faces[i][j][1] = new Face(ps2);
      }
    }
  }
  void randomize(){
    for(int i=0;i<xpoints;i++){
      for(int j=0;j<ypoints;j++){
        points[i][j].z = random(d);
      }
    }
  }
  void smooth(float $weight,int $iterations){
    //for best results, use relatively low weights and high iteration counts
    float[][] temp = new float[xpoints][ypoints];
    for(int i=0;i<xpoints;i++){
      for(int j=0;j<ypoints;j++){
        //smooth by weighted average of adjacent points
        int neighbors = (i==0||i==xpoints-1)?((j==0||j==ypoints-1)?2:3):((j==0||j==ypoints-1)?3:4);
        float z = points[i][j].z*(1-$weight);
        if(i>0){ z += points[i-1][j].z*$weight/neighbors; }
        if(i<xpoints-1){ z += points[i+1][j].z*$weight/neighbors; }
        if(j>0){ z += points[i][j-1].z*$weight/neighbors; }
        if(j<ypoints-1){ z += points[i][j+1].z*$weight/neighbors; }
        temp[i][j] = z;
      }
    }
    for(int i=0;i<xpoints;i++){
      for(int j=0;j<ypoints;j++){
        points[i][j].z = temp[i][j];
      }
    }
    if($iterations>0){ smooth($weight,$iterations-1); }
  }
  Point get_line_intersect_point(Line $l){
    //this will return the first point it finds :: fine for vertical projects or relatively vertical projects onto a relatively smooth terrain
    Face f = get_line_intersect_face($l);
    if(f.p1==global.error_point){ return global.error_point; }
    return f.get_line_intersect_point($l);
  }
  Point[] get_line_intersect_points(Line $l){
    //this will return all intersecting points, very costly on large terrains
    Point[] ps = {};
    Face[] fs = get_line_intersect_faces($l);
    for(int i=0;i<fs.length;i++){
      ps = (Point[]) append(ps,fs[i].get_line_intersect_point($l));
    }
    return ps;
  }
  Face get_line_intersect_face(Line $l){
    //this will return the first face it finds :: fine for vertical projects or relatively vertical projects onto a relatively smooth terrain
    for(int i=0;i<xpoints-1;i++){
      for(int j=0;j<ypoints-1;j++){
        if(faces[i][j][0].is_line_intersecting($l)){ return faces[i][j][0]; }
        if(faces[i][j][1].is_line_intersecting($l)){ return faces[i][j][1]; }
      }
    }
    Point[] ps = {global.error_point,global.error_point,global.error_point};
    return new Face(ps);
  }
  Face[] get_line_intersect_faces(Line $l){
    //this will return all intersecting faces, very costly on large terrains
    Face[] fs = {};
    for(int i=0;i<xpoints-1;i++){
      for(int j=0;j<ypoints-1;j++){
        if(faces[i][j][0].is_line_intersecting($l)){ fs = (Face[]) append(fs,faces[i][j][0]); }
        if(faces[i][j][1].is_line_intersecting($l)){ fs = (Face[]) append(fs,faces[i][j][1]); }
      }
    }
    return fs;
  }
  Segment[] get_edge_intersect_segments(Segment $s){
    //xy coordinates only :: coordinates are projected onto the XY plane :: this is a very expensive function, do not use on a frame-by-frame basis
    Segment temp = new Segment(points[0][0],points[0][1]);
    Segment[] segments = new Segment[1000];
    int nsegments = 0;
    for(int i=0;i<xpoints-1;i++){
      for(int j=0;j<ypoints-1;j++){
        //test cross segment
        if((i%2==0&&j%2==1)||(i%2==1&&j%2==0)){
          temp.p1 = points[i][j+1]; temp.p2 = points[i+1][j];
        }else{
          temp.p1 = points[i][j]; temp.p2 = points[i+1][j+1];
        }
        if(temp.is_segment_intersecting($s,true)){ segments[nsegments++] = new Segment(temp.p1,temp.p2); }
        //test right segment if on right grid square
        if(i==xpoints-2){
          temp.p1 = points[i+1][j]; temp.p2 = points[i+1][j+1];
          if(temp.is_segment_intersecting($s,true)){ segments[nsegments++] = new Segment(temp.p1,temp.p2); }
        }
        //test bottom segment if on bottom grid square
        if(j==ypoints-2){
          temp.p1 = points[i][j+1]; temp.p2 = points[i+1][j+1];
          if(temp.is_segment_intersecting($s,true)){ segments[nsegments++] = new Segment(temp.p1,temp.p2); }
        }
        //test left segment
        temp.p1 = points[i][j]; temp.p2 = points[i+1][j];
        if(temp.is_segment_intersecting($s,true)){ segments[nsegments++] = new Segment(temp.p1,temp.p2); }
        //test top segment
        temp.p1 = points[i][j]; temp.p2 = points[i][j+1];
        if(temp.is_segment_intersecting($s,true)){ segments[nsegments++] = new Segment(temp.p1,temp.p2); }
      }
    }
    segments = (Segment[]) subset(segments,0,nsegments);
    return segments;
  }
  void rotate(float $cosa,float $sina,String $axis,float $x,float $y,float $z){
    for(int i=0;i<xpoints;i++){
      for(int j=0;j<ypoints;j++){
        points[i][j].rotate($cosa,$sina,$axis,$x,$y,$z);
      }
    }
  }
  void render(){
    for(int i=0;i<xpoints;i++){
      for(int j=0;j<ypoints;j++){
        if(i<xpoints-1&&j<ypoints-1){
          faces[i][j][0].render(false);
          faces[i][j][1].render(false);
        }
      }
    }
  }
  void render(PImage $img,float $s){
    for(int i=0;i<xpoints;i++){
      for(int j=0;j<ypoints;j++){
        if(i<xpoints-1&&j<ypoints-1){
          faces[i][j][0].render($img,$s);
          faces[i][j][1].render($img,$s);
        }
      }
    }
  }
}

//------ VECTOR ------//
class Vector{
  float vx,vy,vz,m;
  Vector(float $vx,float $vy,float $vz){
    vx = $vx;
    vy = $vy;
    vz = $vz;
    m = get_magnitude();
  }
  Vector(Point $p){
    vx = $p.x;
    vy = $p.y;
    vz = $p.z;
    m = get_magnitude();
  }
  float get_magnitude(){
    return mag(vx,vy,vz);
  }
  void unitize(){
    m = get_magnitude();
    if(m==0){ return; }
    vx = vx/m; vy = vy/m; vz = vz/m;
    m = 1;
  }
  void rotate(float $cosa,float $sina,String $axis){
    float tx,ty,tz;
    if($axis=="x"){
      tz = vz*$cosa-vy*$sina; ty = vy*$cosa+vz*$sina;
      vz = tz; vy = ty;
    }else if($axis=="y"){
      tx = vx*$cosa-vz*$sina; tz = vz*$cosa+vx*$sina;
      vx = tx; vz = tz;
    }else if($axis=="z"){
      tx = vx*$cosa-vy*$sina; ty = vy*$cosa+vx*$sina;
      vx = tx; vy = ty;
    }
  }
  void add(Vector $v){
    vx += $v.vx; vy += $v.vy; vz += $v.vz;
  }
  void add(Point $p){
    vx += $p.x; vy += $p.y; vz += $p.z;
  }
  void subtract(Vector $v){
    vx -= $v.vx; vy -= $v.vy; vz -= $v.vz;
  }
  void subtract(Point $p){
    vx -= $p.x; vy -= $p.y; vz -= $p.z;
  }
  void scale(float $s){
    vx *= $s; vy *= $s; vz *= $s;
  }
  void render(Point $p){
      line($p.x,$p.y,$p.z,$p.x+vx,$p.y+vy,$p.z+vz);
  }
}

float dot_product(Vector $v1,Vector $v2){
  return ($v1.vx*$v2.vx)+($v1.vy*$v2.vy)+($v1.vz*$v2.vz);
}
float dot_product(Vector $v1,Point $p1){
  return ($v1.vx*$p1.x)+($v1.vy*$p1.y)+($v1.vz*$p1.z);
}
float dot_product(Point $p1,Point $p2){
  return ($p1.x*$p2.x)+($p1.y*$p2.y)+($p1.z*$p2.z);
}

Vector cross_product(Vector $v1,Vector $v2){
  return new Vector($v1.vy*$v2.vz-$v1.vz*$v2.vy,$v1.vz*$v2.vx-$v1.vx*$v2.vz,$v1.vx*$v2.vy-$v1.vy*$v2.vx);
}


//------ VORONOI ------//
//creates a voronoi diagram based on its corresponding delaunay triangulation
class Voronoi{
  Polygon[] polygons;
  int npolygons;
  Delaunay de;
  Voronoi(Delaunay $de){
    de = $de;
    npolygons = 0;
    polygons = new Polygon[2000];
    synchronize();
  }
  void synchronize(){
    npolygons = 0;
    Point[] ps;
    int nps;
    for(int i=0;i<de.npoints;i++){
      ps = new Point[100];
      nps = 0;
      //find circumcenters of all polygons that include this point
      for(int j=0;j<de.nfaces;j++){
        if(de.faces[j].p1==de.points[i]||de.faces[j].p2==de.points[i]||de.faces[j].p3==de.points[i]){
          ps[nps++] = de.faces[j].ccp;
        }
      }
      //order points
      float[] as = new float[nps];
      for(int j=0;j<nps;j++) as[j] = atan2(ps[j].y-de.points[i].y,ps[j].x-de.points[i].x)+TWO_PI;
      for(int j=0;j<nps-1;j++){
        for(int k=0;k<nps-1-j;k++){
          if(as[k]>as[k+1]){
            Point ps1 = ps[k]; ps[k] = ps[k+1]; ps[k+1] = ps1;
            float as1 = as[k]; as[k] = as[k+1]; as[k+1] = as1;
          }
        }
      }
      ps = (Point[]) subset(ps,0,nps);
      polygons[npolygons++] = new Polygon(ps);
    }
  }
  void render(){
    for(int i=0;i<npolygons;i++){
      polygons[i].render("bezier");
    }
  }
}


  



  
}

void bounce(boolean rnd, int by, int lo, int hi){
 if (forward){
  if (rnd)px+=random(lo,hi); 
   if (!rnd){
    px+=by; 
   }
 } 
 
 
   if (!forward){
     if(rnd)px-=random(lo,hi);  
     if (!rnd){
      px-=by; 
     }
     }
   
   if (up){
    if (rnd)py-=random(lo,hi*2); 
     if (!rnd){
       py+=by;
     }
     }
     
     if (!up){
      if(rnd)py+=random(lo,hi*2); 
     if (!rnd){
       py-=by;
     }  
       
     }
   
   
   if (px>width)forward = false;
   if (px<0)    forward = true;
   if (py>height)up     = true;
   if (py<0     )up     = false;
  }  
  
 
  
  

