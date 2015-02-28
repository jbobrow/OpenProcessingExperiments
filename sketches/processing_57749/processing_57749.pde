
Circle[] circles;
import processing.opengl.*;
float x,y,z,angle;

void setup(){
  size(800,800,OPENGL);
  background(255);
  x=0;
  y=0;
  angle=0;
  circles = new Circle[5];
  for(int i=0; i < circles.length; i++){
    circles[i] = new Circle(random(width),random(height), i, 10); 
  }  
}

void draw(){
  for(int i=0; i<circles.length; i++){
    circles[i].move();
    circles[i].display();
    circles[i].intersect();
  }  
}

class Circle{
  
  float x, y, directionx, directiony, ellSize;
  int id;
  Circle(float _x,float _y, int _id, float _ellSize){
      x=_x;
      y=_y;
      id=_id;
      ellSize=_ellSize;
      directionx=random(5);
      directiony=random(5);
  }
  
  void move(){
    x+=directionx;
    y+=directiony;
      if(y > 800){
         directiony = random(-2,2);
      }   
    y += directiony;
      if(y < 0){
         directiony = random(-2,2);
      }  
    x += directionx;
      if(x > 800){
         directionx = random(-2,2);
      }   
    x += directionx;
      if(x < 0){
         directionx = random(-2,2);
      }  
    }
  
  void display(){
    smooth();
    strokeWeight(2);
    stroke(mouseX/3,mouseX/2,mouseY/2);
    drawPoint1();
  }
  
  void drawPoint1(){
    stroke(mouseX/2, mouseY/3, mouseX*3); 
    fill(mouseY/2, mouseX*3, mouseX/3); 
    pushMatrix();
      translate(x,y,z);
      rotateY(y);
      rotate(z);
      sphere(100);
    popMatrix();
    angle+=.1;
  }
  
 void intersect(){
  for(int i=0; i<circles.length; i++){
    line(x,y,circles[i].x, circles[i].y);
    strokeWeight(1);
    fill(mouseX*3,mouseX/2,mouseY/3, .5);
    }
  }
  
  //void collision(){
    //for(int i=0; i<circles.length; i++){
      //if(id! = i){
        //fill(255);
      //}
       //else{
        //if(dist(x,y,circles[i].x, circles[i].y)<circles[i].x + circles[i].ellSize){
          //fill(25,16,243);
        //}
      //}
    //}
  //}
}

