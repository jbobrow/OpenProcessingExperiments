
//Circle's class variable init
class Circle {
  float x,y;
  float perimeter;
  float speed;
  int c;
  
  //Constructor definition
  Circle(float xpos, float ypos, float dim, float spd, int couleur){
    
    //Those variable are link to array "circles[i] = new Circle(x,y,boxsize,rate,col)"
    x = xpos;
    y = ypos;
    perimeter = dim;
    speed = spd;
    c = couleur;
    
  }
  
  void move(){
    
    //negative function make bubble going up
    y -= speed;
    
    //reset with new value when bubble arrive in the upper screen
    if(y < height/perimeter){
      perimeter = (random(numCircle)/width)*random(numCircle,(width/10));
      y = height + perimeter;
      x = random(width);
      c = color(random(220,225),random(150,170),30,random(50,90));
    }
  }
  
  void display(){
    fill(c);
    stroke(150,150,150,random(10,20));
    ellipseMode(CENTER);
    ellipse(x,y,perimeter,perimeter);    
  }
}

