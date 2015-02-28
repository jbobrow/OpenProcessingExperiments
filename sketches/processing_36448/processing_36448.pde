
//Methods	
//set()	          Sets the x, y, z component of the vector
//get()	          Gets the x, y, z component of the vector
//mag()	          Calculate the magnitude (length) of the vector
//add()	          Adds one vector to another
//sub()	          Subtracts one vector from another
//mult()	  Multiplies the vector by a scalar
//div()	          Divides the vector by a scalar
//dist()	  Calculate the Euclidean distance between two points
//dot()	          Calculates the dot product
//cross()	  Calculates the cross product
//normalize()	  Normalizes the vector
//limit()	  Limits the magnitude of the vector
//angleBetween()  Calculates the angle between two vectors
//array()	  Return a representation of the vector as an array

class Circle{
  
   //location vector
   PVector location; 
   
   //circles variables
   int $ize;
   
   
 //-------------------------------------
 
    //Constructor
    Circle(PVector cLocation, int cSize){
      //returns position of the circle
      location = cLocation.get();
      $ize = cSize;
      
      }

 //-------------------------------------
      
      //displays the circles on screen
      void show(){
        //ellipseMode(CENTER);
        fill(255);
        ellipse(location.x, location.y, $ize, $ize);
      }

 //-------------------------------------
      
     
        

 
 
      
}

