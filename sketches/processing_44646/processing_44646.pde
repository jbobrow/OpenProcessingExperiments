
class Rectangle {
  
  int x;
  int y;
  int c;
  
  Rectangle (int _c,int _x, int _y)
  {
    x = _x;
    y = _y;
    c = _c;
  }
  
  void display()
  {
    fill(c);
    noStroke();
    ellipse(x,y,6,6);
  }
}

// whenever I create an instance of this class, 
//it will take these cvharacteristics (constructor) 
//and I can call a method inside the object 

//class instatiates objects -- cookie cutter
//when an object is created using this class, it will have these characteristics =  constructor
//these characterics are properties that are ed\

//methods are functions that deal with the object -- performs actions on the object according to the constructor

//to access info stored in an object use the dot. 


