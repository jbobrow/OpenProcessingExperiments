
//Problem Set 3
//Question 1
//Natalie DeCoste 

float speed = 2;
float gravity = 0.1;

Ball a;
Button b;

//--------------------------------------------------------
void setup() {
  
  size(400, 500);
  smooth(); 
    a = new Ball (250,100,100,50);
    b = new Button (260,50,80,80,0);
}

//--------------------------------------------------------
void draw() {
  background(64); 
    a.display();
     b.display(); 
    if (b.animate()==false) {
      a.drop();
    }
 
  }
void mousePressed() {
  b.click();
}
class Ball {
  float x;
  float y;
  float dia;
  float c;
  

Ball(float x,float y,float dia,color c) {
    
  this.x = x;
  this.y = y;
  this.dia = dia;
  this.c = c; 
  
}

void display() {
  fill (31,155,219);
  ellipse(x, y, dia, dia);
    
}

void drop() { 
    y = y + (int)speed;
    speed = speed + gravity;
    if (y >= height) {
    speed =-0.9 * speed;
}

    speed = speed + gravity;  
    }

}
class Button {
  int btnx;
  int btny;
  int btnw;
  int btnh;
  color c;
  boolean animate;
  boolean pressed;
  
  Button(int btnx, int btny, int btnw, int btnh, color c) {
    this.btnx = btnx;
    this.btny = btny;
    this.btnw = btnw;
    this.btnh = btnh;
    this.c = c;
  
  }
void display() {
  fill (c);
  rect(btnx, btny, btnw, btnh);
}
//--------------------------------------------------------
void click() {
  if ( mouseX > b.btnx && mouseX < b.btnx+btnw && mouseY > b.btny && mouseY < b.btny+btnh) {
    animate = !animate;    
}
  if (animate == true) {
    pressed = true;
  }
  else { 
    pressed = false;
  }
}
boolean animate () {
  if (pressed==true){
    return true;
}
else { 
  return false;
} 
}
}

