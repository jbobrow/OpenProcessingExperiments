
class pointer
{
  float left, right;
  PVector pos, pos2;
  PVector vel;

  pointer(int v) {
      pos = new PVector (100, int(random(-12000, 0)));
      pos2 = new PVector (300, int(random(-12000, 0)));    
      vel = new PVector (0, (v*2)+3); //only moving in y direction
  }

  void arr() {
    fill(255);
    strokeWeight(9);
    stroke(54,83,234, 160);//vary colours
    
    //left arrow
    if (pos.y <= 490) {
      if(pos.y >= yPos){
        yPos = pos.y;
      }
      beginShape();
      vertex(pos.x-20, pos.y);
      vertex(pos.x, pos.y-20);
      vertex(pos.x, pos.y-10);
      vertex(pos.x+10, pos.y-10);
      vertex(pos.x+10, pos.y+10);
      vertex(pos.x, pos.y+10);
      vertex(pos.x, pos.y+20);
      endShape(CLOSE);
    }
    
    stroke(13,242,2, 160);//vary colours
    //right arrow
    if (pos2.y <= 525) {
      if(pos2.y >= yPos2){
        yPos2 = pos2.y;
      }
      beginShape();
      vertex(pos2.x+20, pos2.y);
      vertex(pos2.x, pos2.y+20);
      vertex(pos2.x, pos2.y+10);
      vertex(pos2.x-10, pos2.y+10);
      vertex(pos2.x-10, pos2.y-10);
      vertex(pos2.x, pos2.y-10);
      vertex(pos2.x, pos2.y-20);
      endShape(CLOSE);
    }
  }
  void motion() {//move arrows
    pos.add(vel);//add the velocity vector to your position
    pos2.add(vel);
  }
}


