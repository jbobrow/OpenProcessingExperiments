

int monkeysize = 5;
float x=0;
float y=0;
float a=0;
float b=0;
float O=random(TWO_PI);
float L=3;

boolean moving = false;

void setup() {
  size(400,700);
  background(0);
}

void draw() {
  
  fill(0,0,0,30);
  rect(0,0,width,height);
  
  if(dist(pmouseX, pmouseY, mouseX, mouseY) == 0){
    moving = false;
  }
  
  if(moving ==true){
    x = x + (mouseX - x)/50;
    y = y + (mouseY - y)/50;
    
    strokeWeight(1);
  noStroke();
  fill(255,255,255,80);
    ellipse(x,y,monkeysize,monkeysize);
  } else if(moving == false){
  
  float x2=x+L*cos(O);
  float y2=y+L*sin(O);

  

  strokeWeight(1);
  noStroke();
  fill(255,255,255,80);

  ellipse(x2,y2,monkeysize,monkeysize);

  x=x2;
  y=y2;
  O=O+random(-PI/10.0,PI/10.0);

  if(x<0 || y<0 || y>height ||x>width) {
    x=mouseX;
    y=mouseY;
    O=random(TWO_PI);
  }
}

}

void mouseMoved() {
 moving = true;
  
}

void mouseClicked(){
  
}


