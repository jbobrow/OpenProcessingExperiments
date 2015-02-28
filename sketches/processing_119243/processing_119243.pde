


class Heart{

  PVector pos;
  int r;
  float heartSize;
  
  Heart(float x, float y, int _r, float s) {
    pos = new PVector(x, y);
    r = _r;
    heartSize = s;
  }
  
  void display() {
    
    pushStyle();
    fill(250,40,120,50);
    noStroke();
//    ellipse(pos.x, pos.y+5, r/2, r+4);
    
    pushMatrix();
    translate(pos.x, pos.y);
//    ellipse(50, 25, r/2, r+4);
    scale(heartSize);    

    beginShape();
    vertex(0, -5);
    bezierVertex(0, -25, 40, -15, 0, 20);
    vertex(0, -5);
    bezierVertex(0, -25, -40, -15, 0, 20);
    endShape();


    popMatrix();
    popStyle();



  }
  
}

