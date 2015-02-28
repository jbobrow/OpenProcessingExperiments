
//bouncing ball with dead upper left, wind left
//and black hole
//ethan dale
//math, programming & art


float vy = 0;
float vx = 0;
float x = 300;
float y = 300;
float bounceX = 20;
float bounceY = 20;
float debug = 0; //set to 0 for realtime debug
float friction = 1;//will bounce 60% of first bounce
float gravity = .0;
float hgrav = 1;

void setup() {
  size(600,600);
  smooth();
  fill(0);
  frameRate(10);

}

void draw() {
//  ellipse(400,400, 50,50);
//    ellipse(50,50, 50,50);
  vy += gravity;

  x += vx; // same as x + vx = x
  y += vy;
  if(y > height) {
    y = height;
    vy = -.5*vy ;
  }
  if(debug == 0){
  println("velocityY " + vy);
}
  if(y < 0) {
    vy = -.5*vy ;

  vy *= friction; //same as vy * friction = vy
  }

  if(x>width) {
    x=width;
    vx = -.5*vx;
  }
  if(debug == 0){
  println("velocityX " + vx);
  println("x " + x);
  println("y " + y);
  }
  if(x<0) {
    x=0;
    vx = -.5*vx;
  vx *= friction;
  }
//background(225);
 fill(0,0,255,5);
 rect(0,0,width,height);
 
//  ellipse(400,400, 100,100);
  fill(89);
  ellipse(x,y,20,20);
  blackHole(400,400);
  blackHole(100,100);
  blackHole(350, 150);
//  void blackHole(int bhx, int bhy){
//  ellipse(bhx, bhy, 50,50);
//    if(x > bhx + 25 && y > bhy +25) {
//    vy += -2;
//    vx += -2;
//  }
//   if(x > bhx + 25 && y < bhy +25) {
//    vy += 2;
//    vx += -2;
//  }
//  if(x < bhx + 25 && y > bhy + 25) {
//    vy += -2;
//    vx += 2;
//  }
//  if(x < bhx + 25 && y < bhy + 25) {
//    vy += 2;
//    vx += 2;
//  } 
  
  
////upper left
//   if(x > 75 && y > 75) {
//    vy += -1.5;
//    vx += -1.5;
//  }
//   if(x > 25 && y < 75) {
//    vy += 1.5;
//    vx += -1.5;
//  }
//  if(x < 25 && y > 75) {
//    vy += -1.5;
//    vx += 1.5;
//  }
//  if(x < 25 && y < 25) {
//    vy += 1.5;
//    vx += 1.5;
//  } 
  float hdist = dist(x,y,400,400);
if(debug == 0){
  println("hdist " + hdist);
}
}
//if (hdist < 25) {
//  noLoop();
//    
//  println("GAME OVER, CLICK TO PLAY AGAIN");
// if(mousePressed == true) {
// x = 10;
// y = 10;
// loop();
// }
//}
//}
//senses direction of mouse dragging
void mouseDragged() {
  if (mouseX > pmouseX)
     {vx += 1;}
  if (mouseX < pmouseX)
      {vx += -1;}
  if (mouseY > pmouseY)
      {vy += 1;}
  if (mouseY < pmouseY)
      {vy += -1;} 
//  ellipse(400,400, 50,50);
}
void blackHole(int bhx, int bhy){
  ellipse(bhx, bhy, 50,50);
    if(x > bhx + 25 && y > bhy +25) {
    vy += -2;
    vx += -2;
  }
   if(x > bhx + 25 && y < bhy +25) {
    vy += 2;
    vx += -2;
  }
  if(x < bhx + 25 && y > bhy + 25) {
    vy += -2;
    vx += 2;
  }
  if(x < bhx + 25 && y < bhy + 25) {
    vy += 2;
    vx += 2;
  } 
}

//void mousePressed() {
//if(hdist < 60){
//  x = 10;
//  y = 10;
//  loop();
//}
//}

