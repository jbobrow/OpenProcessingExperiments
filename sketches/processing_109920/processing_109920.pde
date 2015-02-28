
int place1 = width/2;
int place2 = height/2;
int speedx = 7;
int speedy = 12;

int place3 = width/2;
int place4 = height/2;
int speedx2 = 6;
int speedy2 = 11;

int place5 = width/2;
int place6 = height/2;
int speedx3 = 5;
int speedy3 = 10;


void setup(){
  size(500,800);
  ellipseMode(CENTER);
}

void draw(){
  background(255);
  fill(0);
  noStroke();
  fill(255, 0,0, 80);
  ellipse(place1, place2, 40, 40);
  fill(0, 0, 255, 80);
  ellipse(place3, place4, 40, 40);
  fill(0, 255, 0, 80);
  ellipse(place5, place6, 40, 40);
  
  if (place1 < 0){
    speedx = -1*speedx;
  }
  if (place2 < 0){
    speedy = -1*speedy;
  }
    
  if (place1 > width){
    speedx = -1*speedx;
  }
  if (place2 > height){
    speedy = -1*speedy;
  }
  
  place1 = place1 + speedx;
  place2 = place2 + speedy; 
  
  if (place3 < 0){
    speedx2 = -1*speedx2;
  }
  if (place4 < 0){
    speedy2 = -1*speedy2;
  }
    
  if (place3 > width){
    speedx2 = -1*speedx2;
  }
  if (place4 > height){
    speedy2 = -1*speedy2;
  }
  
  place3 = place3 + speedx2;
  place4 = place4 + speedy2; 
  
  if (place5 < 0){
    speedx3 = -1*speedx3;
  }
  if (place6 < 0){
    speedy3 = -1*speedy3;
  }
    
  if (place5 > width){
    speedx3 = -1*speedx3;
  }
  if (place6 > height){
    speedy3 = -1*speedy3;
  }
  
  place5 = place5 + speedx3;
  place6 = place6 + speedy3; 
  
}
