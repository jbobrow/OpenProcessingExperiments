
float angle = 0.0;
float scalar = 20;
float offset = 0;
float easing = 0.01;

void setup(){
  size(400,400);
  smooth();
  background(255);
}

void draw(){
  background(255);
  float speed = mouseX;
  noStroke();
  for(float x = 100; x <=300; x+=10){
    for(float y = 100; y <=300; y +=10){
       fill(x/2,mouseX,mouseY,y/2);
       float i = offset+sin(angle)*scalar;
       float h = offset+cos(angle)*scalar;
      ellipse(x+i,y+h,10,10);
      angle+=speed;

    }
  }
  if (mouseButton == LEFT){
    scalar--;
  } else if(mouseButton == RIGHT) {
    scalar++;
  }
}

                
