
float angle = 0;
float offset = 60;
float scalar = 2;
float speed = 10;

void setup(){
  size(600,400);
  smooth();
  background(0);
  noFill();
}

void draw(){
  //background(0);
        float x = offset+140 + sin(angle)*scalar;
          float y = offset+140 + cos(angle)*scalar; 
           

stroke(0,x,y);/////////change color//

   ellipse(x,y,x/10,x/10);
    angle += speed;
  scalar += 0.5;
}


