

ArrayList<Circle> circles = new ArrayList(); 
int index = 0;


void setup(){
  size(500,500);
  background(0);
}

void draw(){
  
  if(mousePressed == true){
    Circle c = new Circle();
    circles.add(c);
  
}
 if(index % 2 == 0){
  for (Circle c : circles) {
    c.move();
  }
 }
 index++;
}






public class Circle{
  
  int r = (int)random(255);
  int g = (int)random(255);
  int b = (int)random(255);
  int x = (int)random(width);
  int y = (int)random(height);
  float yold;
  int d = (int)random(100);
  
  
 int t = 1;
 float G = 9.81;
  
 public Circle(){
   stroke(255);
    fill(r,g,b);
    ellipse(x,y,d,d);
    yold = y;
  }
  
   void move() {
    fill(0);
    ellipse(x,yold,d+1,d+1);
     
   t += 1;
   //translate(0.0, -G*t*t/2 + y);
    fill(r,g,b);
    yold = -(-G*t*t/2+y);
    ellipse( x,yold,d,d);
   
 }
}
