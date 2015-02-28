
float rad = 0.0;
float move = 0.0;
float s = 0.0;
float timer = 0.0;
int posY = 0;
float bounce = 0.0;
float a = 0.0;
float inc = 0.0;

void setup(){
  size(500,500); 
  frameRate(30);
}

void draw(){
  colorMode(HSB, 360, 100, 100);
  noStroke();
  background(random(150),130,random(100));
  timer = timer + (1.0/30.0);
  rad++;
  s = s + 0.5;
  if(s >= 5){
     s -=15; 
  }
  
  if(timer >= 0.0 && timer < 4.0){
    move = PI + rad;
    pushMatrix();
    translate(width/2, height/2);
    rotate(move);
    scale(s);
    rectMode(CENTER);
    fill(random(360),100,100);
    rect(0, 0, 100, 100); 
    popMatrix();
  }
  
  else if(timer >= 4.0 && timer < 8.0){
    posY = posY + 5;
    fill(random(360),100,random(100));
    rect(0, posY, width*2, 100);
  } 
  
  else{
    pushMatrix();
    bounce = bounce + sin(a) * 50.0;
    inc++;
    a = a + inc;
    translate(width/2, height/2);
    fill(random(100),random(100),100);
    ellipse(bounce, bounce, 200, 200);
    popMatrix();
  }
}


