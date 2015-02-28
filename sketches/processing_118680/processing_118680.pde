
Stick One;
 
void setup(){
  size(800, 800);
  One = new Stick(color(255, 255, 20));
  
}
 
void draw(){
  background(50);
  noStroke();
  One.move();
  One.display();
}

class Stick{
  float x;
  float y;
  int fillC;
  float angle;
  float xOff;
  float yOff;
  float y1;
  float x1;
   
  Stick(int tempC){
    fillC = tempC;
    angle = 0;
  }
   
  void display(){
    float c = cos(angle) * 50;
    
    float x2 = x1 + 90;
    float x3 = x1 + 70;
    
    float y2 = y1 + 90;
    float y3 = y1 + 20;
    
    fill(fillC);
    translate(x, y);
    rotate(c);
    beginShape();
    vertex(x1, y1);
    vertex(x2, y1);
    vertex(x2, y2);
    vertex(x3, y3);
    endShape();
    
  }
   
  void move(){
    angle += .01;
    
    
    if (mousePressed){
      x = width/4;
      y = height/4;
      xOff = (cos(angle*10)*30) * 10;
      yOff = (sin(angle*8)*20) * 10;
      x1 = x + xOff;
      y1 = y + yOff;
      
    }
    else {
      x = mouseX;
      y = mouseY;
      x1 = 0;
      y1 = 0;
      xOff = 0;
      yOff = 0;
    }
    
    
  }
   
}

