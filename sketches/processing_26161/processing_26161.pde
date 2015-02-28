
Circle[] circles;

void setup (){
  size(500,500);
  background(0);
  smooth();
 
  fill(177,232,0);
  circles = new Circle[1000];
  frameRate(23);
 
  for(int i =0; i < circles. length; i++){
    circles[i] = new Circle(random(width), random(height), random(5), random(-2), random(3));
   
  }
}
void draw(){
  for(int i = 0; i < circles.length; i ++){
    circles[i]. display();
    circles[i].move();
   
  }
}

void mousePressed() {
  stroke(0);
   fill(mouseX, mouseY, 22,33);
  

}


void keyPressed() {
  background(255);
}

class Circle{
  float x, y, d, xsp, ysp, gravity, friction;
  //contructor
  Circle(float xpos, float ypos, float dia, float xspeed, float yspeed){
    x = xpos;
    y = ypos;
    d = dia;
    friction = -.6;
    gravity = .04;
   
    xsp = xspeed;
    ysp= yspeed;
   
  
  }
  //method
  void display(){
    ellipse(x,y,20,20);
  }
  void move (){
    x+=xsp;
    y+=ysp;
    
       ysp += gravity;
   x += xsp;
   y += ysp;
   if(y>height){
     y=height;
     ysp*=friction;
   }
   if(x>width){
     x=width;
     xsp*=friction;

   }
   
   
}

}

