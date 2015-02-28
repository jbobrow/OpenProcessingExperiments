
class Circle{
  float x,y,d; /*you can create multiple variables in one line*/

  Circle(float _x, float _y, float _d){
   x=_x;
   y=_y;
   d=_d;


  } 
  
  void display(){
       fill(random(255),random(255),random(255));
    ellipse(x,y,d,d);
  }

}



