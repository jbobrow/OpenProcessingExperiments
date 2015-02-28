


Ball [] balls = new Ball[100];
float gravity = 0.1;
color shade;

float rectX = 430;
float rectY = 50;
float rectW = 40;
float rectH = 20;

float sliderX = 450;
float sliderY = 50;
float sliderZ = 550;

float offsetY = 0;

boolean dragged;

void setup() {
  size(500, 600);

  for (int i = 0; i < balls.length; i++) {
    shade = color(random(0, 255), random(0, 255), random(0, 255));
    balls[i] = new Ball(random(0, width), shade, random(1, 30), random(0, 5));
  }
  
  dragged = false;
}

void draw() {
  background(255);
  
  //Is the slider being dragged?
  if(dragged) {
    rectY = mouseY + offsetY;
  }
  
  rectY = constrain(rectY,sliderY,sliderZ);
  
  //draw rectangle
  stroke(236,0,140);
  fill(236,0,140);
  rect(rectX,rectY,rectW,rectH);
  line(450,50,450,550);
  
   //float b = map(rectY,sliderY,sliderZ-rectW,0,600);

  for (int i = 0; i < balls.length; i++) { 
    //balls[i].s = random(10);
    balls[i].display();
    balls[i].move();
    
   
    if (dragged == true) {
      balls[i].s += 0.2;
    }
    
    if(balls[i].y < 0 || balls[i].y > height) {
      balls[i].s = balls[i].s * -0.9;
    }
  }
  
 
  
}

void mousePressed() {
  
  dragged = true;
  
}

void mouseReleased() {
  //Stop dragging
  dragged = false;
}



class Ball {
  
  float x; //x coordinate
  float y; //y coordinate
  color c; //color
  float d; //diameter
  float s; //speed
  
  Ball (float tempX, color tempC, float tempD, float tempS) {
    x = tempX;
    c = tempC;
    d = tempD;
    s = tempS;
    y = 0;
  }
  
  void display() {
    
    noStroke();
    fill(c);
    ellipse(x, y, d, d);   
  }
  
  void move() {
    y = y+s;
    
 
  }
}
  
  


