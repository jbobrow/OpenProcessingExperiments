

int segmentCount = 360;
int radius = 300;

void setup(){
  size(800, 800);  
}

void draw(){

  //noStroke();
  colorMode(HSB, 360, width, height);
  background(360);
  float angleStep = 360/ segmentCount;

  for (float angle= 0; angle<= 360; angle+= angleStep){
    float vx = width/ 2+ cos(radians(angle))* radius;
    float vy = height/ 2+ sin(radians(angle))* radius;
    stroke(angle,mouseX, mouseY);
    line(width/2, height/2, vx, vy);   
    noStroke();
    fill(angle, mouseX, mouseY);    
    ellipse(vx, vy, 20, 20);
  }
}

void keyReleased(){
  switch(key){
  case '1':
    segmentCount = 360;
    break;
  case '2':
    segmentCount = 45;
    break;
  case '3':
    segmentCount = 24;
    break;
  case '4':
    segmentCount = 12;
    break;
  case '5':
    segmentCount = 6;
    break;
  }
}




