
int diam = 200;
circle  mycircle;


void setup(){
  size(600 ,600);
  background(255);
  stroke(0);
  //constructing the circle
  mycircle = new circle(0, 0, 30, color(0, 255, 0), 5);
 

}
void draw(){
  fill(random(255));
  rect(random(mycircle.x), random(mycircle.y), random(mycircle.diam), random(mycircle.diam));
  mycircle.x = mycircle.x + mycircle.velocity;
  //when circle gets to the end, reverse direction
  if (mycircle.x>width){
    mycircle.velocity = -5;
  }
  if (mycircle.x<0){
    mycircle.velocity = 5;
  }
  
  //go to right side and then go down 15
  if (mycircle.x == width){
    //background(0);
    mycircle.y = mycircle.y + 15;
  }
  //once at bottom, go to top
  if (mycircle.y == height){
    background(255);
    mycircle.y = mycircle.y -600;
  }
  //go to left side and then go down 15
  if (mycircle.x == 0){
    //background(0);
    mycircle.y = mycircle.y +15;
  }
}
void drawacircle(int centx, int centy, int circlesize){
  fill(0, 0, 255);
  ellipse(mouseX, mouseY, diam, diam);
}
//object oriented - explains the characteristics of the object
class circle {
  //properties
  int x;
  int y;
  int diam;
  color circlecolor;
  int velocity;
  
  //constructor - designates these things in the above.
  circle(int arg1, int arg2, int arg3, color arg4, int arg5){
    x = arg1;
    y = arg2;
    diam = arg3;
    circlecolor = arg4;
    velocity = arg5;
    
    
  }
}


