
//Creating a class and using it in setup/draw. The BASICS.
 
//Declare a Smiley object
Smiley guy;
void setup(){
  size(300,300);
  smooth();
  //Initialize Smiley Object (by calling the constructor)
  guy = new Smiley(width/2, height/2); //Note: Passing in starting position
}
void draw(){
  background(0);
   
  //Call methods on the object.
  guy.display();
   
  println(guy.xpos + ", " + guy.ypos); //Cool! You can access class fields with the "dot operator"
}
 
 
class Smiley{
   //Class "Fields" (variables)
   float xpos, ypos;
    
   //Constructor
   Smiley(float x, float y){
      xpos = x;
      ypos = y;
   }
    
   //Class "Methods" (functions)
   void display(){
       pushMatrix();
        
       translate(xpos, ypos);
        
       ellipse(0,0, 100,100);
       ellipse(-10,-10, 5,5);
       ellipse(10, -10, 5,5);
       arc(0,0, 75,75, radians(15), radians(165));
       popMatrix();
   }
}



