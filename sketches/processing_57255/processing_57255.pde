
import processing.opengl.*;

Cube[] cubes;

void setup(){
    size(1000,1000, OPENGL);
   

      
    }


void draw(){
  
   cubes = new Cube[mouseX];
    for (int i = 0; i < cubes.length; i++){
   cubes[i] = new Cube(random(100),mouseX,random(50)); 
    smooth();
    }
    lights(); 
    background(random(30));
    for(int i = 1; i < cubes.length; i++){
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
  x = cos(radians(angle+mouseY-300)) * 20 + width/2;
  y = sin(radians(angle*300)) * 100 + height/2;
  z = cos(radians(angle*height-width*mouseX)) + width/2;
  }
  
  void display(){
 
 
 
 
 pushMatrix();
 strokeWeight(random(mouseX/80));
  translate(x,-mouseY+1000,y);
  rotateY(z);
  rotateX(z*-45);
  box(50);
popMatrix();
angle++;
 
 
 
    
pushMatrix();
strokeWeight(random(mouseX/80));
  translate(x,500,mouseX);
  rotateY(z);
  rotateX(z*-45);
  box(50);
popMatrix();
angle++;



pushMatrix();
strokeWeight(random(mouseX/80));
  translate(x,mouseY,y);
  rotateY(z);
  rotateX(z);
  box(50);
popMatrix();
angle++;


  } 
  
  
}





