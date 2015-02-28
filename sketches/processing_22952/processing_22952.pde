
class arrow {
  float x, y, velocity, Asize;
  PVector p1, p2, p3, p4, p5, p6, p7;
  PImage img;
  boolean offScreen;
  
  arrow(float Ascale, float velocity, float posX) { 
    updateArrow(Ascale, velocity, posX);
  }
  
  void updateArrow(float Ascale, float velocity, float posX) {
    this.velocity = velocity;
    this.offScreen = false;
    p1 = new PVector(posX, 0, 0);
    p2 = new PVector(posX - (60*Ascale), -120*Ascale, 0);
    p3 = new PVector(posX - (30*Ascale), -120*Ascale, 0);
    p4 = new PVector(posX - (30*Ascale), -160*Ascale, 0);
    p5 = new PVector(posX + (30*Ascale), -160*Ascale, 0);
    p6 = new PVector(posX + (30*Ascale), -120*Ascale, 0);
    p7 = new PVector(posX + (60*Ascale), -120*Ascale, 0);
  }
  
  void update() {
      beginShape();
      vertex(p1.x, p1.y);
      vertex(p2.x, p2.y);
      vertex(p3.x, p3.y);
      vertex(p4.x, p4.y);
      vertex(p5.x, p5.y);
      vertex(p6.x, p6.y);
      vertex(p7.x, p7.y);
      vertex(p1.x, p1.y);
      endShape();
      p1.y+=velocity;
      p2.y+=velocity;
      p3.y+=velocity;
      p4.y+=velocity;
      p5.y+=velocity;
      p6.y+=velocity;
      p7.y+=velocity;
      if(p4.y > height) this.offScreen = true;
  }
  
  boolean offScreen() {
    return this.offScreen;
  }
}

