

public static class EMath {
  public static PVector VectorRotate(PVector v1, float rotRadians) {
    return new PVector( 
    v1.x*cos(rotRadians) - v1.y*sin(rotRadians), 
    v1.x*sin(rotRadians) + v1.y*cos(rotRadians));
  }
  
  public static float VectorMagSq(PVector vec) {
   return vec.x*vec.x+vec.y*vec.y; 
  }
}

public static class EDraw {

  public static PVector mouse(PApplet papp) {
    return new PVector(papp.mouseX, papp.mouseY);
  }
  public static void fill(PGraphics buffer, KColour colour) { 
    buffer.fill(colour.ToColor());
  }
  //2D Primatives
  public static void arc(PGraphics buffer, PVector _position, PVector _size, float _start, float _stop) { 
    buffer.arc(_position.x, _position.y, _size.x, _size.y, _start, _stop);
  }
  public static void ellipse(PGraphics buffer, PVector _position, PVector _size) { 
    buffer.ellipse(_position.x, _position.y, _size.x, _size.y);
  }
  public static void line(PGraphics buffer, PVector _position1, PVector _position2) { 
    buffer.line(_position1.x, _position1.y, _position2.x, _position2.y);
  }
  public static void point(PGraphics buffer, PVector _position) { 
    buffer.point( _position.x, _position.y);
  }
  public static void quad(PGraphics buffer, PVector _position1, PVector _position2, PVector _position3, PVector _position4) { 
    buffer.quad( _position1.x, _position1.y, _position2.x, _position2.y, _position3.x, _position3.y, _position4.x, _position4.y);
  }
  public static void rect(PGraphics buffer, PVector _position, PVector _size) { 
    buffer.rect(_position.x, _position.y, _size.x, _size.y);
  }
  public static void triangle(PGraphics buffer, PVector _position1, PVector _position2, PVector _position3) { 
    buffer.triangle( _position1.x, _position1.y, _position2.x, _position2.y, _position3.x, _position3.y);
  }


  public static void draw(PGraphics buffer) {
    buffer.pushStyle();
    //buffer.background(255);
    buffer.strokeWeight(5);
    buffer.fill(0);
    EDraw.line(buffer, new PVector(), new PVector(40, 40));
    buffer.fill(127);
    EDraw.arc(buffer, new PVector(50, 50), new PVector(70, 70), 0, PI/2);
    buffer.fill(255, 0, 0);
    EDraw.ellipse(buffer, new PVector( 100, 100), new PVector(50, 50));
    buffer.fill(0, 255, 0);
    EDraw.point(buffer, new PVector(130, 130));
    EDraw.quad(buffer, new PVector(140, 140), new PVector(160, 140), new PVector(160, 180), new PVector(140, 160));
    buffer.fill(0, 0, 255);
    EDraw.rect(buffer, new PVector(190, 190), new PVector(30, 30));
    buffer.fill(0, 255, 255);
    EDraw.triangle(buffer, new PVector(250, 250), new PVector(270, 270), new PVector(230, 270));
    buffer.popStyle();
  }
}


