
class Circle extends Shapes{

  color c1;
  
  Circle(float _xpos, float _ypos, color _c1){
    super(_xpos, _ypos);
    this.c1 = _c1;
  }
  
  void render(){
    ellipseMode(CENTER);
    fill(c1);
    ellipse(xpos, ypos, 8, 8);
  }
}

