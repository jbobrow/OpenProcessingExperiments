
class shootingStar {
  float x, y;
  float spdX;
  float spdY;
  int c;
  
  //Constructor
 shootingStar(float x, float y) {
    this.x = x;
    this.y = y;
    spdX = 2.5;
    spdY = -0.7;
    
  }

 
  void update(){
    x+= spdX;
    y+=spdY;
  }


  void display() {
    fill(255, 255, 119);
    beginShape();
    vertex(x-22, y-12);
    vertex(x-90, y-25);
    vertex(x-70, y);
    vertex(x-90, y+25);
    vertex(x-22, y+12);
    endShape(CLOSE);

    float theta = PI/3;
    float xcoord, ycoord;
    beginShape();
    for (int i=0; i<10/2; i++) {
      xcoord = cos(theta);
      ycoord = sin(theta);
      vertex(xcoord*20+x, ycoord*20+y);
      theta += TWO_PI/10;
      xcoord = cos(theta);
      ycoord = sin(theta);
      vertex(xcoord*10+x, ycoord*10+y);
      theta += TWO_PI/10;
    }
    endShape(CLOSE);
  }

}


