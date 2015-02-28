
class Apple{
  PImage apple;
  float s, x, y;

  //contructor
  Apple(float ypos){
    y = ypos;
    x = int(random(width));
  //  s = random(2, 3);

    noStroke();
    smooth();

    apple = loadImage("apple.png");
  }

  void eaten(){
    int r = int(random(width/2));
    y = 0; 
    if(x>100){
      x=x-r;
    } 
    else{
      x=x+r;
    }
  }

  void path(){
    y = y + 1.5;

    if (y>height){
      int r = int(random(width));
      y=0;
      x=r;
    }
        pushMatrix();
  }
  

  void display(){
    fill(0);
    image(apple, x, y);
        popMatrix();
  }



}



