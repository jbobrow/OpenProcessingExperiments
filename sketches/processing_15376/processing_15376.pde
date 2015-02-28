
Circle[] circles = new Circle[30];
 
 
void setup(){
  size(300,300);
  smooth();
  frameRate(30);
   
  for (int i = 0; i < circles.length; i++){
    circles[i] = new Circle(0,0,0);
  }
}
 
 
void draw(){
  background(255);
  for(int i = 0; i < circles.length-1; i++){
  circles[i].display();
  circles[i].move();
  circles[i].centro();
}
}
 
 
class Circle{
   
  float xpos;
  float ypos;
  float speed;
  float inner;
   
  Circle(float xpos_, float ypos_, float inner_) {
    xpos = xpos_;
    ypos = ypos_;
    inner = inner_;
    speed = random(1);
  }
   
  void display(){
   
   
  fill(inner);
  noStroke();
  ellipseMode(CENTER);
  ellipse(xpos,ypos,30,30);
}
 
void move(){
  xpos += speed;
  ypos = ypos + random(1);
   
  if(xpos > width)
  xpos = 0;
   
  if(ypos > 150)
  ypos = 0;
   
}
void centro(){
  inner= inner + speed;
  if(inner > 255 || inner < 0)
  inner = inner *-0.95;

}
}

