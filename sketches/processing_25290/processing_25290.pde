
float gravity = 0.4;
ArrayList balls;

void setup(){
  size(400,400);
  smooth();
  balls =  new ArrayList();
}

void draw(){
 background(255);

 for(int i= balls.size()-1; i>= 0 ; i--){
    Ball ball = (Ball) balls.get(i);
    ball.display();
 }
}

void mousePressed() {
 float dim= random(30,50);
 balls.add(new Ball(mouseX, mouseY, dim));
}

class Ball{
  float x,y;
  float dim;
  float speed = 0.0;
  float r,g,b;

  Ball(float px, float py, float pd){
    x = px;
    y= py;
    dim = pd;
    r = random(0,255);
    g = random(0,255);
    b = random(0,255);
  }
  
  void display(){
      noStroke();
      fill(r, g, b,204);
      ellipse(x, y, dim, dim);
      y = y + speed;
      speed = speed + gravity;
 
      if(y > (height-(dim/2))){
        if(speed <= (gravity)){
             speed = 0;
          }
              
        speed = speed * -0.8;
       // println("post s = " + speed + "  y =" + y );
   }
  }
}
           
                                            
