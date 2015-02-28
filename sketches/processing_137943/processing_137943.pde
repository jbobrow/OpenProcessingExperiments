
myRect red; 
myRect green; 
myRect blue; 
myRect white; 


  

void setup() { 
  size(400, 200);
  line(0,50,400,50);
  line(0,100,400,100);
  line(0,150,400,150); 
  red = new myRect(0, 100); 
  green = new myRect(0,40); 
  blue = new myRect(0, 90); 
  white = new myRect(0, 10); 
} 

void draw() {
  red.display(); 
  fill(random(255),0,0); 
  green.display(); 
  fill(0,random(255),0); 
  blue.display(); 
  fill(0,0,random(255)); 
  white.display(); 
  fill(255); 

} 


class myRect {
  float x, y;


  myRect(float _x, float _y) {
    x=_x;
    y=_y;
  }

  void display() {
    rect(x, y, 30, 30);
  }
  
  

}
