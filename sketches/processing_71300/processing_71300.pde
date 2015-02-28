
PImage coll;//short for collage//
PImage ill;//short of illustration//
PImage castle;//castle illustration//

float speed = 100;
float speed1 = 150;
float speed2 = 75;
int diameter=30;
float x;
float y;


void setup(){
 
  noStroke();
  size(791,1024);
  coll = loadImage("collage.jpg");
  ill = loadImage("illustration.jpg");
  castle =loadImage("castle.jpg");

x = width/2;
y = height/2;

}

void draw(){
 
  
    image(ill, 0 , 0);
    

if (keyPressed){
  if((key == 'q')){  
 image(coll,0,0);
  
  }
  
  if(keyPressed){
    if((key=='w')){
      image(castle,0,0);
}
  
  }
}

}

//multiple moving dots//

void mouseMoved(){  

  x += random(-speed, speed);
  y += random(-speed1, speed1);
 x = constrain(x, 0, width);
 y = constrain(y, 0, height);
  ellipse(x, y, diameter, diameter);
  fill(255,75,75);
 
  
    x += random(-speed1, speed1);
  y += random(-speed, speed);
   x = constrain(x, 0, width);
 y = constrain(y, 0, height);
  ellipse(x, y, diameter, diameter);
  fill(252,120,235);
  
      x += random(-speed, speed1);
  y += random(-speed2, speed2);
   x = constrain(x, 0, width);
 y = constrain(y, 0, height);
  ellipse(x, y, diameter, diameter);
  fill(255,255,255);
  
    x += random(-speed, speed);
  y += random(-speed1, speed1);
 x = constrain(x, 0, width);
 y = constrain(y, 0, height);
  ellipse(x, 650, diameter, diameter);
  fill(255,75,75);
 
  
    x += random(-speed1, speed1);
  y += random(-speed, speed);
   x = constrain(x, 0, width);
 y = constrain(y, 0, height);
  ellipse(x, 500, diameter, diameter);
  fill(252,120,235);
  
      x += random(-speed, speed1);
  y += random(-speed2, speed2);
   x = constrain(x, 0, width);
 y = constrain(y, 0, height);
  ellipse(x, 50, diameter, diameter);
  fill(8,88,255);
  
    x += random(-speed, speed);
  y += random(-speed1, speed1);
 x = constrain(x, 0, width);
 y = constrain(y, 0, height);
  ellipse(500, y, diameter, diameter);
  fill(255,75,75);
 
  
    x += random(-speed1, speed1);
  y += random(-speed, speed);
   x = constrain(x, 0, width);
 y = constrain(y, 0, height);
  ellipse(300, y, diameter, diameter);
  fill(252,120,235);
  
      x += random(-speed, speed1);
  y += random(-speed2, speed2);
   x = constrain(x, 0, width);
 y = constrain(y, 0, height);
  ellipse(x, 10, diameter, diameter);
  fill(255,255,255);
  
      x += random(-speed, speed);
  y += random(-speed1, speed1);
 x = constrain(x, 0, width);
 y = constrain(y, 0, height);
  ellipse(x, 1000, diameter, diameter);
  fill(8,88,255);
 
  
    x += random(-speed1, speed1);
  y += random(-speed, speed);
   x = constrain(x, 0, width);
 y = constrain(y, 0, height);
  ellipse(700, y, diameter, diameter);
  fill(252,120,235);
  
      x += random(-speed, speed1);
  y += random(-speed2, speed2);
   x = constrain(x, 0, width);
 y = constrain(y, 0, height);
  ellipse(600, 70, diameter, diameter);
  fill(8,88,255);

 

  
  
}





