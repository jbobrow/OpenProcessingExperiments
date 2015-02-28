
int sTime;
int tTime = 1000;
int time;
int finalTime;
float s;

   
void setup() {
  size(500,500);
  background(0);
  sTime = millis();
  smooth ();
  noStroke ();
  time = 0;
}

void draw() {

  int pTime = millis() - sTime;
  if (pTime > tTime) {
    background(random(255)); 
    sTime = millis(); 
    
    time=millis();
   
 
  float s = map (second(), 0, 60, 40, 100);
 fill(mouseX, mouseY, 255);
  ellipse (width / 2, 100, 100, 100);
  ellipse (width / 2, height/2, 100, 100);
    ellipse (width / 2, 400, 100, 100);

  fill (255, mouseX,mouseY);
  ellipse (s, height/2, 100, 100);
    ellipse (s, 100, 100, 100);
    ellipse (s, 400, 100, 100);

  }
}
