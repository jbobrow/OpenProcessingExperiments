
int x, y;
float mx = 3;
float my = 3;
int p1Score = 0;
int p2Score = 0;
int p1y = height/2;
int p2y = height/2;
int frameSpeed = 60;

void setup(){
  size(600,400);
  background(0);
  x = width/2;
  y = height/2;
  mx = (int)random(3,6);
  my = (int)random(3,6);
}

void draw(){
  frameRate(frameSpeed);
  drawBackground();
  ellipse(x,y,10,10);
  textSize(20);
  textAlign(LEFT);
  text(p1Score, 50, 20);
  textAlign(RIGHT);
  text(p2Score, width-50, 20);
  x += mx;
  y += my;
  if(y > height || y < 0 ){
    my *= -1;
  }
  if (keyPressed && key == ' '){
    x = width/2;
  }
  if(x > width){
    p1Score ++;
    x = width/2;
    y = height/2;
    mx = (int)random(3,6);
    my = (int)random(3,6);
  }
  if(x < 0){
    p2Score ++;
    x = width/2;
    y = height/2;
    mx = (int)random(3,6);
    my = (int)random(3,6);
  }
  player1();
  player2();
  bounce();
}

void player1(){
  rect(15, p1y, 10, 100);
  if(keyPressed){
    if(key == 'w'){
      p1y -= 4;
    }
    if(key == 's'){
      p1y += 4;
    }
  }
}

void player2(){
  rectMode(CENTER);
  p2y = mouseY;
  rect(width-15, p2y, 10, 100);
}

void bounce(){
  player1();
  player2();
  //bounce player1
  if(abs(p1y - y) < 50){
    if(x < 20 && x > 10){
      frameSpeed ++;
      mx *= -1;
    }
  }
  //bounce player2
  if(abs(p2y - y) < 50){
    if((width - x) < 20 && (width - x) > 10){
      frameSpeed ++;
      mx *= -1;
    }
  }
}

void drawBackground(){
  background(0);
  strokeWeight(3);
  stroke(255);
  line(0, 40, width, 40);
  line(0, height-40, width, height-40);
  line(width/2, 40, width/2, height-40);
  noFill();
  ellipse(width/2, height/2, 40, 40);
}
  

  


