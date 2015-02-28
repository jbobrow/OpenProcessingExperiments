
float y = 50.0;
float radius = 15.0;
float velocity = 0.0;
float acceleration = 0.01;
float timer = 10;
float e1X = 100;
float e1Y = 100;
float e1Size = 50;
PImage myPic;
float rectTimer = 0;


int numSpots = 17;

Spot[] spots = new Spot[17];


void setup() {
  size(1000, 1000);
  smooth();
  noStroke();
  myPic = requestImage("tomb.jpg");

   
  for (int i = 0; i < spots.length; i++) {
    float x = 10 + i * 16;
    float rate = 0.5 + i*0.05;
    
    spots[i] = new Spot(x, 50, 16, rate);
  }
}

void draw() {
  if (myPic.width > 0)
  {
    imageMode(CENTER);
  }
   //image(myPic, width * 0.5, height * 0.5, width, height);
  
  fill(0, 12);
  rect(0, 0, width, height);
  fill(255);
  for (int i = 0; i < spots.length; i++) {
    spots[i].move();
    spots[i].display();
    fill(234, 169, 2);
    ellipse(e1X, e1Y, e1Size, e1Size);
    fill(88, 70, 70);
    ellipse(150, random(350), 50, 50);
    
   
    
    if (mousePressed && (mouseButton == LEFT)) {
        background(random(0), random(255), random(0));
      fill(0);
      textSize(50);
    text("Yeah playa!!!", 300, 400);
    }
    
    if (key == CODED)
      {
        if (keyCode == DOWN)
     {
        background(random(255), random(0), random(0));
      fill(0);
      textSize(50);
    text("DON'T PRESS THAT", 300, 400);
     }
      }
    
   
    timer -= 0.0167;
    
    if (timer < 0)
    
      timer = 0;
  
    
  rectTimer += 0.0167;
  
  if (rectTimer > 1)
  
  fill(255);
  textSize(40);
  text("TIME: " + (int)timer, 0, 30);

}
}


class Spot {
  float x, y;
  float diameter;
  float speed;
  int direction = 1;
  
  Spot(float xpos, float ypos, float dia, float sp) {
    x = xpos;
    y = ypos;
    diameter= dia;
    speed = sp;
  }
  
  void move() {
    y += (speed * direction);
    if ((y > (height - diameter/2)) || (y < diameter/2)) {
      direction *= -3;
    }
  }
      
      void keyPressed() {
        
       if (key == '2')
       {
           y += (speed * direction);
    if ((y > (height - diameter/2)) || (y < diameter/2)) {
      direction *= -2.5;
    }
        
        
    }
  }
  
  void display() {
    fill(88, 70, 70);
  
    ellipse(x * 10 , y * 10 , diameter * 10, diameter * 10);
      fill(random(255), random(255), random(0));
     ellipse(mouseX, mouseY, radius * 5, radius * 7);
  velocity += acceleration;
  y += velocity;
  if (y > height+radius) {
    y = -radius;
  }
  }

}



