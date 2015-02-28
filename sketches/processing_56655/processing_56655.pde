
import processing.opengl.*;

Cube[] cubes;

void setup(){
    size(1000,1000, OPENGL);
    cubes = new Cube[2000];
    for (int i = 0; i < cubes.length; i++){
   cubes[i] = new Cube(random(width),random(height),random(360)); 
    smooth();

      
    }
}

void draw(){
    lights(); 
    background(50,50,90);
    for(int i = 0; i < cubes.length; i++){
     cubes[i].move();
     cubes[i].display();
    
   
   }
}
  
  
class Cube{
    
    
float x, y, z, angle;
Cube(float _x, float _y, float _angle){
  y= _y;
  x= _x;
  angle= _angle;

   
} 
   
   
  void move(){    
  x = cos(radians(angle*500*height)) * 20 + width/2;
  y = sin(radians(angle*300)) * 100 + height/2;
  z = cos(radians(angle*height-width)) + width/2;
  }
  
  void display(){
    
pushMatrix();
  translate(x,500,y);
  rotateY(z);
  rotateX(z*-45);
  box(100);
popMatrix();
angle++;


  } 
  
  
}





