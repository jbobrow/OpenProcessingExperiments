
class Note{
  float xpos, ypos, baseY;
  float sz;
  float counter=100;
  float time;
  
  Note(float ix, float iy, float iby, float isz, float it){
    xpos = ix; //current x position
    ypos = iy; //current y position
    baseY = iby; //ground for note stems
    sz = isz; //ellipse radius
    time = it; //fade counter
  }
   
  //draw stems/notes
  void display(){
    counter -= time;
    sz+=0.05;
    stroke(255, counter*2.55);
    line(xpos, baseY, xpos, ypos);
    ellipseMode(CENTER);
    noFill();
    ellipse(xpos, ypos, sz, sz);
    
  }
  //if stem is faded, return true
  boolean finished(){
    if (counter<=0.0){
      return true;
    }else{
      return false;
    }
  }
}

