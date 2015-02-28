
//------ GLOBAL ------//
//the global class holds all other default classes
//its only purpose is for organization and to imitate actionscript
class Global{
  float sun_ry = PI/2;
  float sun_rz = PI/2;
  float particle_speed = .005;
  float particle_wander_speed = .01;
  float particle_attract_distance = 400;
  float particle_attract_speed = .005;
  float particle_repel_distance = 50;
  float particle_repel_speed = .05;
  float distance_tolerance = .0001;
  float simplify_distance_tolerance = 5;
  float slope_tolerance = .001;
  float simplify_slope_tolerance = .01;
  float angle_tolerance = .001;
  float point_speed = .01;
  Point zero_point;
  Point error_point;
  float gravity = 0;
  float friction = 0;
  float bounce = .9;
  float density = 1.5;
  float arrow_size = 10;
  int w,h;
  int npoints,nsegments,nvectors,nlines,npolygons,npolylines,nplanes,nfaces,nterrains,nparticles,ncolliders,nshadows,narrows;
  Point[] points = new Point[1000000]; Segment[] segments = new Segment[100000]; Vector[] vectors = new Vector[100000]; Line[] lines = new Line[10000]; Polygon[] polygons = new Polygon[100000]; Polyline[] polylines = new Polyline[100000]; Plane[] planes = new Plane[100000]; Face[] faces = new Face[100000]; Terrain[] terrains = new Terrain[1000]; Particle[] particles = new Particle[1000000]; Collider[] colliders = new Collider[100000]; Shadow[] shadows = new Shadow[100000]; Arrow[] arrows = new Arrow[10000];
  Polygon stage;
  Global(int $w,int $h){
    w = $w; h = $h;
    npoints = nsegments = nvectors = nlines = npolygons = npolylines = nplanes = nfaces = nterrains = nparticles = ncolliders = nshadows = narrows = 0;
  }
  void init(){
    Point[] ps = new Point[4]; ps[0] = new Point(-w/2,-h/2,0); ps[1] = new Point(w/2,-h/2,0); ps[2] = new Point(w/2,h/2,0); ps[3] = new Point(-w/2,h/2,0);
    stage = new Polygon(ps);
    zero_point = new Point(0,0,0);
    error_point = new Point(-9999,-9999,-9999);
  }
  float constrainX(float $x){
    return min(w/2,max(-w/2,$x));
  }
  float constrainY(float $y){
    return min(h/2,max(-h/2,$y));
  }
  Point random_point(){
    //xy coordinates only
    return new Point(random(-w/2,w/2),random(-h/2,h/2),0);
  }
  void echo(){
    println("---- GLOBAL ----");
    println("Points: "+npoints);
    println("Segments: "+nsegments);
    println("Vectors: "+nvectors);
    println("Lines: "+nlines);
    println("Polygons: "+npolygons);
    println("Polylines: "+npolylines);
    println("Planes: "+nplanes);
    println("Faces: "+nfaces);
    println("Terrains: "+nterrains);
    println("Particles: "+nparticles);
    println("Colliders: "+ncolliders);
  }
  void render(int $n){
    if($n>=8192){
      for(int i=0;i<narrows;i++){
        fill(255,0,0,100);
        stroke(255,0,0);
        strokeWeight(1);
        arrows[i].render();
      }
      $n -= 8192;
    }
    if($n>=4096){
      for(int i=0;i<nshadows;i++){
        fill(0,50);
        stroke(0);
        strokeWeight(1);
        shadows[i].render();
      }
      $n -= 4096;
    }
    if($n>=2048){
      for(int i=0;i<ncolliders;i++){
        fill(255,255,240);
        stroke(255);
        strokeWeight(1);
        colliders[i].render();
      }
      $n -= 2048;
    }
    if($n>=1024){
      for(int i=0;i<nparticles;i++){
        fill(255,255,240);
        stroke(255,0,0);
        strokeWeight(1);
        particles[i].render();
      }
      $n -= 1024;
    }
    if($n>=512){
      for(int i=0;i<nterrains;i++){
        fill(50);
        stroke(100);
        strokeWeight(1);
        terrains[i].render();
      }
      $n -= 512;
    }
    if($n>=256){
      for(int i=0;i<nfaces;i++){
        fill(255,255,240);
        stroke(255);
        strokeWeight(1);
        faces[i].render();
      }
      $n -= 256;
    }
    if($n>=128){
      for(int i=0;i<nplanes;i++){
        fill(255,240,240);
        stroke(255);
        strokeWeight(1);
        planes[i].render(zero_point);
      }
      $n -= 128;
    }
    if($n>=64){
      for(int i=0;i<npolygons;i++){
        fill(255,250,250);
        stroke(0);
        strokeWeight(1);
        polygons[i].render();
      }
      $n -= 64;
    }
    if($n>=32){
      for(int i=0;i<npolylines;i++){
        fill(255,250,250);
        stroke(0);
        strokeWeight(1);
        polylines[i].render();
      }
      $n -= 32;
    }
    if($n>=16){
      noFill();
      stroke(0,0,255);
      strokeWeight(1);
      for(int i=0;i<nlines;i++){
        lines[i].render();
      }
      $n -= 16;
    }
    if($n>=8){
      noFill();
      stroke(0,255,255);
      strokeWeight(1);
      for(int i=0;i<nsegments;i++){
        segments[i].render();
      }
      $n -= 8;
    }
    if($n>=4){
      noFill();
      stroke(255,0,255);
      strokeWeight(1);
      for(int i=0;i<nvectors;i++){
        vectors[i].render(zero_point);
      }
      $n -= 4;
    }
    if($n>=2){
      fill(0);
      stroke(0);
      strokeWeight(1);
      for(int i=0;i<npoints;i++){
        points[i].render();
      }
      $n -= 2;
    }
    if($n>=1){
      noFill();
      stroke(255,0,0);
      strokeWeight(1);
      stage.render();
      $n -= 1;
    }
  }
}

float randomize(float $n,float $r){
  return $n+random(-$r/2,$r/2);
}

