
// RECAP! 

// Arrays : 

// Make an array of integers and populate it with numbers :
int[] ages = {22, 23, 21, 20, 39};

// Create an empty array of integers 
int[] ages2 = new int[10]; 

// Make an array of Strings
String[] ourNames = {"George", "Matt", "Harry", "Marie", "Kirsty", "Marcella"}; 

// define and instantiate a variable of type Circle
Circle myCircle = new Circle(); 


void setup() { 
  
  size(300,300); 
  smooth(); 
  
  // add a new item to an array :
  ourNames = append(ourNames, "Adrian"); 
  println(ourNames); 
  
  // set properties of an object : 
  myCircle.x = 100;  
  myCircle.y = 120;
  
}

void draw() { 

  // call a method (function) of an object :   
  myCircle.drawCircle(); 
  
}


// define a function that takes two integer arguments 
// and returns an integer

int addNumbers(int num1, int num2) { 
   return num1+num2; 
}


// define a custom class of type Circle : 
class Circle {
  
  // declare properties (variables) that belong to the object :
  int x; 
  int y; 
  int circleSize; 
  
  // define the constructor - a special function that is called
  // when an object is instantiated (with the 'new' keyword)
  Circle() { 
    
    // set the objects default properties (could be done
    // at the same time as declaration above if preferred)
    x = 0; 
    y = 0; 
    circleSize = 20; 
  
  }  
  
  // define a method (function) that belongs to this object
  // and can be called using dot syntax (see above in the draw function). 
  void drawCircle() {
    
    ellipse(x,y, circleSize, circleSize);   
    
  }
  
  
}

