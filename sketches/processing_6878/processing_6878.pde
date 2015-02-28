
class Branch extends Segment{
  Branch[] branches = new Branch[100];
  int nbranches = 0;
  int level;
  String parents;
  Tree t;
  float ry,rz;
  Point p1,p2;
  Branch(Point $p1,Point $p2,float $rz,float $ry,int $level,Tree $t,String $parents){
    super($p1,$p2);
    t = $t;
    p1 = $p1;
    p2 = $p2;
    ry = $ry;
    rz = $rz;
    level = $level;
    t.branches[t.nbranches] = this;
    parents = t.nbranches+"|"+$parents;
    t.nbranches++;
    if(level<tree_levels){
      if(level==tree_levels-1||random(1)>branch_single){
        int tnbranches = round(randomize(branch_children,branch_children_r));
        for(int i=0;i<tnbranches;i++){
          Point p3 = new Point(p2.x,p2.y-randomize(branch_length,branch_length_r)+branch_length_f*(level+1),p2.z);
          branches[nbranches] = new Branch(p2,p3,randomize(branch_spread,branch_spread_r),randomize(i*TWO_PI/tnbranches,branch_rotate_r),level+1,t,parents);
          nbranches++;
        }
      }else{
        Point p3 = new Point(p2.x,p2.y-randomize(branch_length,branch_length_r)+branch_length_f*(level+1),p2.z);
        branches[nbranches] = new Branch(p2,p3,branch_droop,0,level+1,t,parents);
        nbranches++;
      }
    }
  }
  void init(){
    if(nbranches>0){
      for(int i=0;i<nbranches;i++){
        branches[i].init();
      }
    }else{
      t.buds[t.nbuds] = this;
      t.nbuds++;
    }
    rotate(rz,ry,p1.x,p1.y,p1.z);
  }
  Polyline get_path(){
    Segment[] segments = new Segment[1000];
    int nsegments = 0;
    if(parents!=""){
      int[] path = int(splitTokens(parents,"|"));
      for(int i=0;i<path.length;i++){
        segments[nsegments] = t.branches[path[i]];
        nsegments++;
      }
    }
    segments = (Segment[]) subset(segments,0,nsegments);
    segments = (Segment[]) reverse(segments);
    Polyline p = new Polyline(segments);
    return p;
  }
  void rotate(float $rz,float $ry,float $x,float $y,float $z){
    for(int i=0;i<nbranches;i++){
      branches[i].rotate($rz,$ry,$x,$y,$z);
    }
    p2.rotate(cos($rz),sin($rz),"z",$x,$y,$z);
    p2.rotate(cos($ry),sin($ry),"y",$x,$y,$z);
  }
  void render(){
    strokeWeight(branch_thickness*(tree_levels-level+1));
    super.render();
  }
}

