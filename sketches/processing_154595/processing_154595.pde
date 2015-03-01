
float radius = 15.0;
float []speed = {1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0};
float y = 50.0;
int []x = {30, 60, 90, 120, 150, 180, 210, 240, 270, 300, 330, 360, 390, 420, 450, 480};


void setup(){
  size(500, 1000);
  smooth();
  background(0);
  frameRate(50);
}

void draw(){
  background(0);
  for(int i = 0;i<x.length;i++){
    
  
  for(int j = 0;j<speed.length;j++){
    
     ellipse(x[i], y, radius, radius);
    y = y + speed[j];
  
  if((y > height-radius) || (y < radius)){
    speed[j] = speed[j] * -1;
  }
  }
  }
}


