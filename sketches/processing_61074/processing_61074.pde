
DrawBall[] balls= new DrawBall[100];


//DrawBall ball1;
//DrawBall ball2;

void setup(){
  size (400, 400);
  
  for(int i = 0; i<balls. length; i++){
    DrawBall ball = new DrawBall(color(random(255),random(255),random(255),random(255)), random(1,5), random(width), random(height));
     balls[i] = ball; 
  }
}
 // ball1 = new DrawBall(color(255, 100, 0), 1.5, random(width), random(height));
 // ball2 = new DrawBall(color(155, 200, 100), 3, random(width), random(height));



void draw() {
  background(255);
  
  if(mousePressed){
  
  for(int i =0; i<balls.length; i++){
    balls[i].render();
  }
  //ball1.render();
  //ball2.render();

}
}


class DrawBall {
  color c;
  float sp;
  float x;
  float y;
  float x2;
  float y2;
  

  DrawBall(color _c, float _sp, float _x, float _y) {
    c = _c;
    sp = _sp;
    x = _x;
    y = _y;
  }
  
  void rot(){
    x2 = x + 50*cos(radians(frameCount*sp));
    y2 = y + 50*sin(radians(frameCount*sp));
  }

  void render() {
    rot();
    fill(c);
    ellipse(x2, y2, 10, 10);
  }
}


