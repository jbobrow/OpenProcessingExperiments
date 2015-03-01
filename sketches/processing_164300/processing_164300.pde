
class Brush0 extends Main{
  
  Brush0(int wdth, int x, int y) {
    super(wdth, x, y);
    tx= 300;
    ty= 900;
    
  }
  
  void render() {
    stroke(#70A5F7);//blue
    strokeWeight(120);
    point(x,y);

    
  }
}


