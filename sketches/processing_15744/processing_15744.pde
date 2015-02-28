
/*
  Background class used in phase 2.  It is an array of Shape objects and each one has its own direction and color.
*/
class BGShapes{
  Shape[] s; // array of shapes
  int arrayLength = 50; // number of shapes in the arrau
  
  /*
    Constructor.
  */
  BGShapes(int tmps){
    s = getShapeList(tmps);
  }
  
  /*
    Display Method. This will display the entire animation one frame at a time.
  */
  void display(){
    stroke(255,0);
    for(int i = 0; i < s.length; i++){
      if(s[i].hasEnded()){
          s[i].resetLocation();
        s[i].display();
      } else {
        s[i].display();
      }
    }
    stroke(0); 
  }
  
  /*
    Getter method for shapes bassed on type.
  */
  Shape getShape(int tmp){
    Shape tmps;
    switch(tmp){
      case 1:
        tmps = new Circle();
        break;
      case 2:
        tmps = new Triangle();
        break;
      default:
        tmps = new Square();
        break;
     
    }
    return tmps;
  }
  
  /*
    Setter method that changes each shape's type within the array.
  */
  void setType(int tmpt){
    for(int i = 0; i < s.length; i++){
      s[i] = s[i].getShape(tmpt); 
    }
  }
  
  /*
    Getter methode that creates the array of shapes 
  */
  Shape[] getShapeList(int tmp){
    Shape[] tmps = new Shape[arrayLength];
    for(int i = 0; i < tmps.length; i++){
      tmps[i] = getShape(tmp);
    } 
    return tmps;
  }
  
  /*
    Private class Shape is the super class for the three shapes.
  */
  private class Shape{
    int x;  // X location of the shape
    int y;  // Y location of the shape
    int d;  // direction of the shape
    int t;  // type of the shape
    int f;  // how fast the shape is moveing
    int origX;  // original X value
    int origY;  // original Y value
    int s = 100; // Constant: size of the shape
    color c;  // color object for the shape
    ColorFader cf;  // ColorFader object for this shape
    
    /*
      Constructor.
    */
    Shape(int tmpt){
      t = tmpt;  
      x = int(random(width));
      y = int(random(height));
      d = int(random(4));
      f = 2;
    }
    
    /*
      Display Method.
    */
    void display(){
      if(!this.hasEnded()){
        this.step();
        cf.step();
        this.setColor(cf.getColor());
        fill(c,96);
      }
    }
    
    /*
      Sets the color for this shape.
    */
    void setColor(color tmpc){
      c = tmpc;
    }
    
    /*
      Sets the color fader for this shape.
    */
    void setColorFader(ColorFader tmpcf){
      cf = tmpcf;
      cf.randomStep(); 
    }
    
    /*
      Steps this shapes animation.
    */
    void step(){
      switch(d){
        case 0:
          x+=f;
          break;
        case 1:
          x-=f;
          break;
        case 2:
          y+=f;
          break;
        default:
          y-=f;
          break;
      }
    }
    
    /*
      Get the type of this shape.
    */
    int getType(){
      return t; 
    }
    
    /*
      Gets shape from int.
    */
    Shape getShape(int tmpt){
      if (tmpt == 3){
        return new Square();
      } else if (tmpt == 2){
        return new Triangle();    
      } else {
        return new Circle();
      }
    }
    
    /*
      Randomly resets the location of the shape.  Also resets the CF object.
    */
    void resetLocation(){
      cf.reset();
      x = int(random(width));
      y = int(random(height));
    }
    
    /*
      Changes the direction of the shape
    */
    void changeDirection(){
      d = int(random(4));
    }
    
    /*
      Based on location in the window, checks to see if shape animation has ended.
    */
    boolean hasEnded(){
      if(x-s > width || x+s < 0)
        return true;
      else if(y-s > height || y+s < 0)
        return true;
      else  
        return false;
    }
  }
  
  /*
    Circle subclass of Shape 
  */
  private class Circle extends Shape{
    ColorFader cf = new ColorFader(#F0ED44,color(255,255,255));
    
    Circle(){
      super(1); 
      setColorFader(cf);
    }
    
    void display(){
      super.display();
      ellipse(x, y, s, s); 
    }
  }
  
  /*
    Square subclass of Shape
  */
  private class Square extends Shape{
    ColorFader cf = new ColorFader(#C47712,color(255,255,255));
    
    Square(){
      super(3); 
      setColorFader(cf);
    }
    
    void display(){
      super.display();
      rect(x, y, s, s); 
    }
  }
  
  /*
    Triangle subclass of Shape
  */
  private class Triangle extends Shape{
    ColorFader cf = new ColorFader(#9FD62B,color(255,255,255));
    
    Triangle(){
      super(2); 
      setColorFader(cf);
    }
    
    void display(){
      super.display();
      triangle(x, y, x-(s/2), y+s, x+(s/2), y+s); 
    }
  }

}

