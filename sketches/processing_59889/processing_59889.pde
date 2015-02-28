

// Array Function:
// Append()
// shorten(), concat(), subset(), append(), splice(), expand()
// changing the order of array: sort(), reverse()

Ball[] balls = new Ball[1];
float gravity = 1.0;
MyLine[] myline = new MyLine[3];

PImage dude;
PImage cat;

float xoff = 0.0;

 
void setup() {
    
  size(512, 512);
  smooth();
  dude = loadImage("dude.png");
  cat = loadImage("cat.png");
  // Initialize ball index to 0
  balls[0] = new Ball(250, 6, 15, color(255, 255, 100));
  for(int i=0; i < myline.length; i++){
    myline[i] = new MyLine(mouseX,mouseY, balls[balls.length-1].x, balls[balls.length-1].y,i);
  }
  
}
 
void draw() {
background(20);
   println(balls);
   xoff = xoff + .01;
  float n = noise(xoff) * width;
  float m = noise(xoff+100)*height;
  ellipse(n,m,5,5);
  image(cat,n,m);

  // update the display all ball
  for(int i = 2; i < balls.length; i++) {
    balls[i].gravity();
    balls[i].move();
    balls[i].display();
 stroke(255);
   line(mouseX,mouseY, balls[balls.length-1].x, balls[balls.length-1].y);
 }
  }


 
void mouseReleased() {
  // A new ball object
  float cr = mouseX*1;
  float cg = mouseY*1;
  float cb = dist(0, 0, mouseX, mouseY);
  float change = dist(0, 0, mouseX/30, mouseY/30);
  Ball b = new Ball(mouseX, mouseY, 10 + change, color(cr, cg, cb)); // 1) make new object at the mouse location
   
  // Append the array
  //if(balls.length < 3){
  balls = (Ball[]) append (balls, b); 
}
 


  

 
class Ball {
  float x;
  float y;
  float speed;
  float w;
  color c;
  float targetx;
  float targety;
  float easing = 0.08;
  float x1, y1,x2, y2;
  
  Ball(float xpos, float ypos, float tempW, color cc) {
    x = xpos;
    y = ypos;
    speed = 0;
    w = tempW;
    c = cc;
    x2 = mouseX;
    y2 = mouseY;
    
  }
  
    void gravity() {
    
   
    // add gravity to speed
    speed = speed - gravity/20;
    
    

    targetx = mouseX;
    float dx = targetx - x2;
    if(abs(dx) > 5) {
    x2 += dx * easing;
    }

    targety = mouseY;
    float dy = targety - y2;
    if(abs(dy) > 0) {
      y2 += dy *= easing;
}

  balls[balls.length-1].x = x2;

if(mousePressed) {
  balls[balls.length-1].y = y2;
    balls[balls.length-1].x = mouseX;
}

  }
   
  void move() {
    // add speed to y location
    y = y + speed;
    // if square reach the buttom
    // reverse speed
    if (y > 480 ) {
      speed = speed * -0.75;
      y = 480;
    }
  }
   
  void display() {
    // display the circle
    fill(c);
    noStroke();
    image(cat,x,y+10);
  }
}
  

class MyLine {
  float x;
  float y;
  float xcirc;
  float ycirc;
  int id;
  
  MyLine(float xpos, float ypos, float xc, float yc, int _id){
    id = _id;
    x = xpos;
    y = ypos;
    xcirc = xc;
    ycirc = yc;
}
/*void collision(){
  for (int i = 0; i < myline.length; i++){
    if( id != i){
      if(dist(x,y,myline[i].x,myline[i].y) < 10)
      myline[i] = new MyLine(mouseX,mouseY, balls[balls.length-2].x, balls[balls.length-2].y,i);
}
  }
}
*/}

  


