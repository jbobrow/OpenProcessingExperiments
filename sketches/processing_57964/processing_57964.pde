
class Rainband extends FBox
{ 
  color m_color;
  FBox m_box;
  
  Rainband(int h, int w) {
    super(h,w);
    setup();
  }
  
  void setup(){
    super.setNoStroke();
    super.setPosition(mouseX, mouseY);
    super.setStaticBody(true);
    super.setRestitution(0.9);
    super.setGrabbable(false);
  }
  
  void draw( PGraphics applet ) {
    super.draw(applet);
  }
}

