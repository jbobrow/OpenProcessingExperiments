
Circle myCircle;

void setup(){  
  size(600,600);
  myCircle = new Circle();
}


void draw(){
  
  myCircle.display();
  myCircle.checkHover();
   
}

// ****************************
//        CLASS: CIRCLE
// ****************************
class Circle{
  float x;
  float y;
  float e_width;
  float e_height;
  float radius;
  float dist;
  
  // CONSTRUCTOR
  //
  Circle(){
    x = width/2;
    y = height/2;
    e_width = 200;
    e_height = 200;
    radius = e_width/2;
  }
 
  // DISPLAY THE CIRCLE
  //
  void display(){
    ellipse(x, y, e_width, e_height);
  }
  

  // CHECK IF THE MOUSE IS OVER THE CIRCLE
  //  
  void checkHover(){
   
    // Use Pythagorus Theorum to check the distance from 
    // mouse pointer to centre of the circle
    dist = (mouseX - x) * (mouseX - x) + (mouseY - y) * (mouseY - y);
    dist = sqrt(dist);
  
    // change the colour of the 'button' if the mouse hovers over it
    if (dist < radius){
      fill(247,77,92);
    }
    else{
      fill(94,64,264);
    }
    
    // display the circle with the chose fill colour
    display();
    
  }


}


