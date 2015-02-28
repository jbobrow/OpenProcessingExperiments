
class AbsorbBall extends Ball {
  
  void renderSymbol() {
    stroke(255);
    fill(255);
    strokeWeight(1);
    triangle(x-3,y-7,x+3,y-7,x,y);
    triangle(x-3,y+7,x+3,y+7,x,y);
    triangle(x-7,y-3,x-7,y+3,x,y);
    triangle(x+7,y-3,x+7,y+3,x,y);
    strokeWeight(3);
    line(x,y-7,x,y-30);
    line(x,y+7,x,y+30);
    line(x+7,y,x+30,y);
    line(x-7,y,x-30,y);
    strokeWeight(1);
    fill(100);

  }
  
}

