
class Particle {
  float xPos, yPos, xSize, ySize;

  Particle(float x, float y, float xs, float ys){
    xPos = x;
    yPos = y;
    xSize = xs;
    ySize = ys;
  }

  void update(){
    drawParticle();
  }

  void drawParticle(){
    line(xPos,yPos,mouseX,mouseY);
    ellipseMode(CENTER);
    ellipse(xPos,yPos,xSize,ySize);
  }

}



