
class Ball {
  float x;
  float y;
  float speedy;
  float speedx;
  float w;
  
  Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY-50;
    w = tempW;
    speedy = random(-7,-4);
    speedx= random(-2,2);
  }
  
  void gravity() {
    // Add gravity to speed
    speedy = speedy + gravity;
  }
  
  void move() {
    x = x + speedx;
    // Add speed to y location
    y = y + speedy;
    // If square reaches the bottom
    // Reverse speed
  }
  
  void display() {
    // Display the circle
    noStroke();
     fill(255,random(100,255),random(15,255));
     
beginShape();

vertex(x,y);               //1
vertex(x+24/w,y+70/w);     //2
vertex(x+94/w,y+70/w);     //3
vertex(x+40/w,y+115/w);    //4
vertex(x+64/w,y+187/w);    //5
vertex(x,y+142/w);         //6
vertex(x-64/w,y+187/w);    //7
vertex(x-40/w,y+115/w);    //8
vertex(x-94/w,y+70/w);     //9
vertex(x-24/w,y+70/w);     //10

endShape(CLOSE);
  }
}  

