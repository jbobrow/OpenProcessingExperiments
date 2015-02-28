
//------ ANAGLYPH ------//
//the anaglyph class provides functions to prepare the stage for rendering a 3d scene :: it is very slow because it requires 3 pgraphics objects to be blended each frame
//blending algorithm taken from leebyron's redblue library
class Anaglyph{
  PGraphics left,right;
  PVector eye,rotation,focus;
  float spread;
  int w,h;
  float strokeweight = 5;
  Anaglyph(int $w,int $h,float $spread){
    spread = $spread;
    w = $w; h = $h;
    eye = new PVector(0,0,($h/2.0)/tan(PI*60.0/360.0));
    focus = new PVector();
    rotation = new PVector();
    left = createGraphics(w,h,P3D);
    right = createGraphics(w,h,P3D);
  }
  void left_eye_begin(){
    left.beginDraw();
    left.pushMatrix();
    left.camera(eye.x-spread/2,eye.y,eye.z,focus.x,focus.y,focus.z,0,1,0);
    if(rotation.x!=0){
      left.pushMatrix();
      left.rotateX(rotation.x);
    }
    if(rotation.y!=0){
      left.pushMatrix();
      left.rotateY(rotation.y);
    }
    if(rotation.z!=0){
      left.pushMatrix();
      left.rotateZ(rotation.z);
    }
  }
  void left_eye_end(){
    if(rotation.x!=0) left.popMatrix();
    if(rotation.y!=0) left.popMatrix();
    if(rotation.z!=0) left.popMatrix();
    left.popMatrix();
    left.endDraw();
  }
  void right_eye_begin(){
    right.beginDraw();
    right.pushMatrix();
    right.camera(eye.x+spread/2,eye.y,eye.z,focus.x,focus.y,focus.z,0,1,0);
    if(rotation.x!=0){
      right.pushMatrix();
      right.rotateX(rotation.x);
    }
    if(rotation.y!=0){
      right.pushMatrix();
      right.rotateY(rotation.y);
    }
    if(rotation.z!=0){
      right.pushMatrix();
      right.rotateZ(rotation.z);
    }
  }
  void right_eye_end(){
    if(rotation.x!=0) right.popMatrix();
    if(rotation.y!=0) right.popMatrix();
    if(rotation.z!=0) right.popMatrix();
    right.popMatrix();
    right.endDraw();
  }
  void set_rotation(PVector $xyz){
    rotation.set($xyz);
  }
  void set_eye(PVector $xyz){
    eye.set($xyz);
  }
  void set_focus(PVector $xyz){
    focus.set($xyz);
  }
  void set_spread(float $spread){
    spread = $spread;
  }
  void set_attributes(color $fill,color $stroke,float $strokeweight){
    left.fill($fill);
    right.fill($fill);
    left.stroke($stroke);
    right.stroke($stroke);
    left.strokeWeight($strokeweight);
    right.strokeWeight($strokeweight);
  }
  void set_background(color $background){
    left.background($background);
    right.background($background);
  }
  void set_background(PImage $img){
    left.background($img);
    right.background($img);
  }
  void render(PGraphics $pg){
    for(int i=0;i<$pg.pixels.length;i++) $pg.pixels[i] = 0xFF000000|(left.pixels[i]&0xFF0000)|(right.pixels[i]>>8&0xFF00)|(right.pixels[i]&0xFF);
  }
}

