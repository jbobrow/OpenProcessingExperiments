

class Plotter {
  
  float x;
  float y;
  float speed =5.0;
  
  float q;
  float w;
  float e;
  
  
  Plotter(float tempX, float tempY){  
    x = tempX;
    y = tempY;

  }
  
  void move(){
    x += random(-speed, speed);
    y += random(-speed, speed);
    println("x " + x + " : " + "y " + y + " : " + frameCount);
    //if((y > height || y < 0 || x > width || x < 0) && mousePressed){
      //saveFrame("speck.jpg");
      //exit();
        //}
       if (mousePressed){
         background(0);
           x = random(0,width);
           y = random(0,height);
       }
  }
  
  void display(){
    point(x, y);
  }
  
  void colour(){
    q = random(0.0,255.0);
    w = random(0.0,255.0);
    e = random(0.0,255.0);
    stroke(q,w,e);
  }
 }

