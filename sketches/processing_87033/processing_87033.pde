
float x, y, xSpeed, ySpeed;

void setup(){
  size(480,480);
  background(255);
  x = 0;
  y = 0;
  xSpeed = 7;
  ySpeed = 2;
}

void draw(){
 // background(255);
  noStroke();
  fill(x, y, 100, 50);
  ellipse(x,y,40,40);
 
  x = x + xSpeed;
  y = y + ySpeed;

  if ( (x > width) || (x < 0) ){
    xSpeed = xSpeed * -1;
  }
  
  if ( (y > height) || (y < 0) ){
    ySpeed = ySpeed * -1;
  }
}

void keyPressed(){
  if (key == 's'){
    save("picture.png");
  }
}
