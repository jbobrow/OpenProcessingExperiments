
Circle myCircle;

void setup() {

  size(600, 600);

  myCircle = new Circle();

}

void draw() {

 if (myCircle.r < 80) {

    myCircle.grow();

    myCircle.display();

 }

 else {

    myCircle.reset();

 } 

}

class Circle {
  color c;
  float xpos;
  float ypos;
  int r;
  
  Circle () {
  }
  
  void display(){
    fill(255);
   
    ellipse(xpos,ypos,r,r);
  }
  
  void grow() {
    r = r+4;
  }
  
  void reset(){
    //keeps xpos and ypos the same until they reset at r > 80
     xpos = random(0,width);
    ypos = random(0,height);
    r = 3; 
}
}


