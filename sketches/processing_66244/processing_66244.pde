
boolean direction = false;  //false means it is going down, true going up
int h = int(random(380));

int r = int(random(256));
int g = int(random(256));
int b = int(random(256));
int rUD;
int gUD;
int bUD;


void setup(){
  size(400,400);
  background(255);
  smooth();
}


void draw(){
  background(255);

  fill(r, g, b);
  ellipse(200, h, 20, 20);
 
  if (direction == false && h < 380){
    h++;
  }

  if (direction == true && h > 20){
    h--;
  }

  if(h >= 380){
    direction = true;
  }
  
  if(h <= 20){
    direction = false;
  }
  
  rUD = int(random(-20,20));
  gUD = int(random(-20,20));
  bUD = int(random(-20,20));
  
  r = r + rUD;
  g = g + gUD;
  b = b + bUD;
}


