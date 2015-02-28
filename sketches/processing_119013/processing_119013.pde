
/* @pjs preload="itunes.png"; */

ArrayList<Ball> balls = new ArrayList<Ball>();
PImage img;

void setup(){
  size(600,400);
//  b = new Ball();
  img=loadImage("itunes.png");
}


void draw(){
  background(100);
  for(Ball b:balls){
    b.draw();
  } 
}

void keyPressed(){
  if(key == ' '){
    Ball b = new Ball();
    b.x = b.radius;
    b.y = height - b.radius;
    b.sx = 8;
    b.sy = -20;
    b.ay = 1;
    balls.add(b);
  }
  /*
  if(key == 'a'){
    b.x -= 10;
  } else if(key == 's'){
    b.y -= 10;
  } else if(key == 'd'){
    b.y += 10;
  } else if(key == 'f'){
    b.x += 10;
  }
  */
  /*
  if(key == CODED){
    if(keyCode == LEFT){
      b.ax -= .01;
    } else if(keyCode == UP){
      b.ay -= .01;
    } else if(keyCode == DOWN){
      b.ay += .01;
    } else if(keyCode == RIGHT){
      b.ax += .01;
    }
  }
  */
  
}



class Ball{
  float x = width / 2;
  float y = height / 2;
  float sx = 2;
  float sy = 0;
  float ax = 0;
  float ay = .1;
  float radius = 32; 
  void draw(){
    sx += ax;
    sy += ay;
    if(sx*sx+sy*sy > 600){
      sx *= .95;
      sy *= .95;
    }
    if(x+radius > width && sx > 0){
      sx = -sx;
    }
    if(y+radius > height && sy > 0){
      sy = -sy;
    }
    if(x-radius < 0 && sx < 0){
      sx = -sx;
    }
    if(y-radius < 0 && sy < 0){
      sy = -sy;
    }
    x += sx;
    y += sy;
      
    //rect(x-radius,y-radius,radius*2,radius*2); 
    image(img, x-radius, y-radius, radius*2, radius*2);
  }
}


