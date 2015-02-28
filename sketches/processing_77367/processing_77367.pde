
/**
 * Inheritance
 * 
 * A class can be defined using another class as a foundation. In object-oriented
 * programming terminology, one class can inherit fi elds and methods from another. 
 * An object that inherits from another is called a subclass, and the object it 
 * inherits from is called a superclass. A subclass extends the superclass.
 */



SpinSpots spots;
SpinArm arm;

SpinSpots[] le_fond = new SpinSpots [100];

void setup() 
{
  size(400, 400);
  smooth();
  
    
  for(int i=0; i<le_fond.length; i++) {
    le_fond[i]=new SpinSpots(random(width),random(height),50,50);
  }
  
  arm = new SpinArm(width/2, height/2, -0.02);
  spots = new SpinSpots(width/2, height/2, -0.02, 200);

}

void draw() 
{
  //background(204,5);
   fill(map(mouseX,0,400,150,255),0,map(mouseY,0,400,150,200),50);
  rect(0,0,400,400);
  
   for(int i=0; i<le_fond.length; i++) {
    le_fond[i].update();
    le_fond[i].display2();
  }
  
  arm.update();
  arm.display();
  spots.update();
  spots.display();
  
 
}



