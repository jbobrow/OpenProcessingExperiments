

Hair myHair;

void setup(){
  size( 800, 400 );
  myHair = new Hair();
}

void draw(){
  // calculate
  myHair.update();
  
  // display
  background(50);
  myHair.display();
}

class Hair {
  float x;
  float y;
  
  // constructor
  Hair(){
    println( "I'm alive!" );
    x = random(width);
    y = random(height);
  }
  
  void update(){
    x = x + random(-1,1);
    y = y + random(-1,1);
  }
  
  void display(){
    ellipse( x, y, 4, 4 );
  }
}



