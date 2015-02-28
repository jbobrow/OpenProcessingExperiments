
class Anaglyph{
  PGraphics left,right,combined;
  float ex,ey,ez,rx,ry,rz,fx,fy,fz,edx;
  int w,h;
  color leftstroke = color(0,255,255);
  color rightstroke = color(255,0,0);
  //color leftfill = color(0,255,255);
  //color rightfill = color(255,0,0);
  color leftfill = color(255,0);
  color rightfill = color(255,0);
  float strokeweight = 5;
  Anaglyph(int $w,int $h,float $edx){
    edx = $edx;
    w = $w; h = $h;
    ex = ey = rx = ry = rz = fx = fy = fz = 0;
    ez = ($h/2.0)/tan(PI*60.0/360.0);
    left = createGraphics(w,h,P3D);
    right = createGraphics(w,h,P3D);
    combined = createGraphics(w,h,P3D);
  }
  void left_eye_begin(){
    left.beginDraw();
    left.background(255,0);
    left.fill(leftfill);
    left.strokeWeight(strokeweight);
    left.stroke(leftstroke);
    left.pushMatrix();
    left.camera(ex-edx/2,ey,ez,fx,fy,fz,0,1,0);
    left.pushMatrix();
    left.rotateX(rx);
    left.pushMatrix();
    left.rotateY(ry);
    left.pushMatrix();
    left.rotateZ(rz);
  }
  void left_eye_end(){
    left.popMatrix();
    left.popMatrix();
    left.popMatrix();
    left.popMatrix();
    left.endDraw();
  }
  void right_eye_begin(){
    right.beginDraw();
    right.background(255,0);
    right.fill(rightfill);
    right.strokeWeight(strokeweight);
    right.stroke(rightstroke);
    right.pushMatrix();
    right.camera(ex+edx/2,ey,ez,fx,fy,fz,0,1,0);
    right.pushMatrix();
    right.rotateX(rx);
    right.pushMatrix();
    right.rotateY(ry);
    right.pushMatrix();
    right.rotateZ(rz);
  }
  void right_eye_end(){
    right.popMatrix();
    right.popMatrix();
    right.popMatrix();
    right.popMatrix();
    right.endDraw();
  }
  void set_rotation(float $rx,float $ry,float $rz){
    rx = $rx; ry = $ry; rz = $rz;
  }
  void set_eye(float $ex,float $ey,float $ez){
    ex = $ex; ey = $ey; ez = $ez;
  }
  void set_focus(float $fx,float $fy,float $fz){
    fx = $fx; fy = $fy; fz = $fz;
  }
  void set_perspective(float $edx){
    edx = $edx;
  }
  void render(PGraphics $pg){
    combined.beginDraw();
    combined.background(255,0);
    combined.image(left,0,0);
    combined.blend(right,0,0,right.width,right.height,0,0,right.width,right.height,MULTIPLY);
    combined.endDraw();
    $pg.imageMode(CENTER);
    $pg.image(combined,0,0);
  }
}

