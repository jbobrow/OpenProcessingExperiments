
float xcenter;
float ycenter;   
float rad = 10;  
float angle = 0;  
float angleStart = 0; 

void setup(){
  size(400, 400);
  smooth();
  xcenter = width / 2;
  ycenter = height / 2;
  angle = angleStart;
}


void draw(){
  fill (255, 10);
  rect (0, 0, width, height);
  
  angle += 0.04;
  
  if (angle > PI*2) {
  } 
  
  float x = xcenter + cos (angle) * rad;
  float y = ycenter + sin (angle) * rad;
  
  fill(255);
for (int i = 20; i < 200; i = i + 30 ) {
  for (int j = 20; j < 400; j = j + 30 ) {
    ellipse(i, j, 30, 30);
  }
}

fill(255);
for (int i2 = 20; i2 < 200; i2 = i2 + 30 ) {
  for (int j2 = 20; j2 < 400; j2 = j2 + 30 ) {
     if ((dist(i2, j2, mouseX, mouseY)) <= 15){
       ellipse(i2+x, j2+y-200, 30, 30); 
     }
   
  }
}

}

