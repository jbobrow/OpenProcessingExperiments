
//this is an exercise in creating and using classes

//initialize class instance
Circle circle;

void setup(){
  size(500,500);
  circle = new Circle(height/2,width/2, 50, 50);
}

void draw(){
  background(255);
  circle.display();
  
  if(mousePressed){
    circle.setX(mouseX);
    circle.setY(mouseY);
  }
}
public class Circle extends Thing{

  //properties that belong to this particular class
  //Circle inherits the properties from Thing class 
  //(the "Super Class") but adds it's own.
  
  color colour;
  
  //constructor
  Circle(int x, int y, int thingWidth, int thingHeight){
    super(x,y,thingWidth,thingHeight);
    
    colour = color(255,130,45);
  }
  
  public void display(){
    fill(colour);
    ellipse(this.x, this.y, this.w, this.h);
  }
}
//this is the class description

class Thing{
  int x, y, w, h;
  
  
  Thing(int posX, int posY, int thingWidth, int thingHeight){
    this.x = posX;
    this.y = posY;
    this.w = thingWidth;
    this.h = thingHeight;
  }
  
//  public void display(){
//    ellipse(this.x, this.y, this.w, this.h);
//  }
  
  public void setX(int x){
    this.x = x;
  }
  
  public int getX(){
    return this.x;
  }
  
  public void setY(int y){
    this.y = y;
  }
  
  public int getY(){
    return this.y;
  } 
}


