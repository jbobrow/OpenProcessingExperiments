
//establish variables
int a = 25;
int b = 25;
float followerX;
float followerY;
float easing = 0.01;

void setup(){
  size(400, 400);
  background(60, 80, 100);
  //procedural drawing initializes in setup
  //so as to allow it to be drawn over
   for(int i = 8; i <= 400; i += 40){
    for(int j = 8; j <= 400; j += 40){
      fill(201, 101, 203);
      rect(i, j, a, b);
    }
  }
  for(int k = -2; k <= 400; k += 20){
    for(int l = -2; l <= 400; l += 20){
      fill(124, 124, 124, 65);
      rect(k, l, a, b);
    }
  }
}

void draw(){
  //complete setup for easing
  float targetX = mouseX;
  float targetY = mouseY;
  followerX += (targetX - followerX) * easing;
  followerY += (targetY - followerY) * easing;
  if(mousePressed){
    if(mouseButton == LEFT){
      fill(0);
      ellipse(mouseX, mouseY, a, b); //ellipse at cursor
    }else if(mouseButton == RIGHT){
      fill(255);
      rect(pmouseX, pmouseY, a, b); //rectangle at last cursor spot
    }else if(mouseButton == CENTER){
      //ellipse using easing
      fill(124, 124, 124, 65);
      ellipse(followerX, followerY, a, b);
    }
  }
}


