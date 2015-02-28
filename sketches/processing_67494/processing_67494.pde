
PImage img;

void setup(){
 background(0);
  size(1024,768);
 img = loadImage("datnick.png"); 
}
void draw(){
  image(img,0,0);
  int x = 0;
  int y = 0;
  fill(0);
    stroke(187,255,0);
  for(int i = 0; i<200; i++){
    float a = random(0,2000);
    float b = random(0,2000);
      ellipse(a,b,5,5);
  }
      stroke(0,255,187);
  for(int i = 0; i<200; i++){
    float a = random(0,2000);
    float b = random(0,2000);
      ellipse(a,b,5,5);
  }
      stroke(255,0,0);
  for(int i = 0; i<200; i++){
    float a = random(0,2000);
    float b = random(0,2000);
      ellipse(a,b,5,5);
  }
  stroke(0,0,255);
  for(int i = 0; i<200; i++){
    float a = random(0,2000);
    float b = random(0,2000);
      ellipse(a,b,5,5);
  }
  stroke(0,255,0);
  for(int i = 0; i<200; i++){
    float a = random(0,2000);
    float b = random(0,2000);
      ellipse(a,b,5,5);
  }
  stroke(0,255,0);
  for(int i = 0; i<200; i++){
    float a = random(0,2000);
    float b = random(0,2000);
   rect(a,b,5,5);
  }
  stroke(187,255,0);
  for(int i = 0; i<200; i++){
    float a = random(0,2000);
    float b = random(0,2000);
   rect(a,b,5,5);
  }
  stroke(0,255,187);
  for(int i = 0; i<200; i++){
    float a = random(0,2000);
    float b = random(0,2000);
   rect(a,b,5,5);
  }
  stroke(255,0,0);
  for(int i = 0; i<200; i++){
    float a = random(0,2000);
    float b = random(0,2000);
   rect(a,b,5,5);
  }
  stroke(0,0,255);
  for(int i = 0; i<200; i++){
    float a = random(0,2000);
    float b = random(0,2000);
   rect(a,b,5,5);
  }
}

