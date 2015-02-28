
// 1) declare the hair array variable
Hair[] myHairs;

void setup(){
  size( 800, 400 );
  // 2) declare the length of the hair array
  myHairs = new Hair[1000];
  // 3) fill every index position of the hair array
  //    with a new object
  for( int i=0; i<myHairs.length; i=i+1){
    myHairs[i] = new Hair();
  }
}

void draw(){
  // display
  background(50);
  
  for( int i=0; i<myHairs.length; i=i+1){
    // calculate
    myHairs[i].update();
    // display  
    myHairs[i].display();
  }
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



