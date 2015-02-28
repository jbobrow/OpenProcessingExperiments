
float timer = 0.0;
float s = 0.0;
float speed = 0.0;
float angle = 0.0;
float a = 0.0;
float increment = PI/50.0;
float prev_x = 0, prev_y = 50, x, y;
float amplitude = 50.0;
int frequency = 1;

void setup(){
  size(500,500);
  frameRate(30);
}

void draw(){
  background(225, 225, 45);
  timer = timer + (1.0/30.0);
  noStroke();
  fill(random(200),random(200),random(200),150);
  
  if(timer >= 2.0 && timer < 3.0){
    rect(width/2, height/2, 100, 100); 
  }
  else if(timer >= 3.0 && timer < 4.0){
    ellipse(200, 200, 200, 200);
  }
  else if(timer >= 4.0 && timer < 5.0){
    triangle(150, 70, 300, 300, 40, 300); 
  }
  else if(timer >= 5.0 && timer < 10.0){
    pushMatrix();
    translate(width/2,height/2);
    s = s + speed;
    speed = speed + .001;
    if(s >= 1.0){
       speed = -speed; 
    }
    if(s < 0.0){
       speed = -speed; 
    }
    scale(s);
    rectMode(CENTER);
    rect(0, 0, 400, 400);
    popMatrix();
  }
  else{
    pushMatrix();
    angle = angle + 0.1;
    translate(width/2, height/2);
    rectMode(CENTER);
    rotate(PI + angle);
    rect(0, 0, 500, 500);
    popMatrix();
  }
  
  stroke(255);
  fill(random(255),random(255),random(255));
  for(int i=0; i<500; i= i + frequency){
    x = i;
    y = 400 + sin(a) * amplitude;
    ellipse(prev_x, prev_y, 50, 50);
    prev_x = x;
    prev_y = y;
    a = a + increment;
  }
  
}


