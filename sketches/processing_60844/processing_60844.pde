
class Button{
  float x;
  float y;
  float w;
  float h;
  color c;
  
  Button(float _x, float _y, float _w, float _h, color _c){
    x=_x;
    y=_y;
    w=_w;
    h=_h;
    c=_c;
  }  
  void createButton(){
    noStroke();
    fill (c);
    rect (x,y,w,h);

  }
}

