
Square[] squares;


void setup(){
  size(1200,1000);
  smooth();
  squares = new Square[30];
  for(int i=0; i<squares.length; i++){
    squares[i] = new Square(random(width), random(height), squares);
  }
}

void draw(){
  fill(255, 100);
  rect(0,0,width, height);
  for(int i=0; i<squares.length;i++){
   squares[i].lines();
  } 
  for(int i=0; i<squares.length; i++){
    squares[i].display();
    squares[i].mover();
    }
  
}

class Square{
  float x,y,vx,vy;
  Square[] others;
  Square(float xin, float yin, Square[] oin){
    x = xin;
    y = yin;
    vx = random(-2,2);
    vy = random(-2,2);
    others = oin;
  }
  
  
   void lines(){
    for (int i=0; i<squares.length; i++){
    float lineX = others[i].x - x;
    float lineY = others[i].y - y;
    line(x+12,y+12,others[i].x+12,others[i].y+12);
  }
  }
  
  void display(){
    fill(255, 0, 0);
    rect(x,y, 25,25);
  }
  
  void mover(){
    x += vx;
    y += vy;
   
    if (x> width - 12) {
      x = width - 12;
      vx *= -1;
      
    }
    else if (x < 12) {
      x = 12;
      vx *= -1;
      
    }
    if (y > height - 12) {
      y = height - 12;
      vy *= -1;
     
    } 
    else if (y < 0) {
      y = 12;
      vy *= -1;
     
    }
   
  }
  
 
}
    

