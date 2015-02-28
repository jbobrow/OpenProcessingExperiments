
class Cat  {   
  PImage cat; 
  float x, y;  
  float rot;

  Cat(String filename, float x_, float y_) { 

    cat = loadImage(filename);
    x = x_;
    y = y_;
    rot = 0.0;
  }   

  void display()  {   
    // Translate and rotate
    translate(x,y);
    rotate(rot);

    // Images can be animated just like regular shapes using variables, translate(), rotate(), and so on.
    image(cat,0,0); 

  }   

  void move()  {   

    x += 1.0;
    rot += 0.02;
    if (x > width+cat.width) {
      x = -cat.width;
    }

  }   
} 

