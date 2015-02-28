
class BG {
  float square1x, square1y;
  float square2x, square2y;
  float square3x, square3y;
  float square1v, square2v, square3v;
  
  float colorVar;
  float rColor;
  float gColor;
  float bColor;
  
  BG () {
    square1x = 30;
    square2x = 10;
    square3x = 800;
    
    square1y = 300;
    square2y = 325;
    square3y = 335;
    
    square1v = -0.3;
    square2v = -0.1;
    square3v = -0.5;
  }
  
  void update() {
    rColor = map(player.x, 0, width, 30, 200);
    gColor = map(player2.x, 0, width, 0, 50);
    bColor = map(sqrt(sq(player.y)+sq(player2.y)),0,sqrt(sq(width)+sq(height)),0,50);
    
    square1x += square1v;
    square2x += square2v;
    square3x += square3v;
    
    if(square1x < -200) {
      square1x = width;
    }
    if(square2x < -500) {
      square2x = width;
    }
    if(square3x < -100) {
      square3x = width;
    }
  }
  
  void sketch() {
    background(rColor,gColor,bColor);
    fill(rColor/2,gColor/2,bColor/2);
    
    rect(0,350,800,50);
    rect(square1x,square1y,200,100);
    rect(square2x,square2y,500,50);
    rect(square3x,square3y,100,150);
  }
}

