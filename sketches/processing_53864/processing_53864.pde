
//Problem Set 2
//Question 3
//Natalie DeCoste

color start = color(0, 0, 0);
color finish;
float amt= 0.0;

void setup() {
  size (400, 400);
  background (255);
  finish = color(random(255), random(255), random(255));
  smooth();
  noStroke();
}


void draw () {
  amt+=.01;
  if (amt >= 1){ 
   amt= 0.0;
   start=finish;
   finish = color (random(255), random(255), random(255));
 }
  
  paintbrush (mouseX, mouseY, 50, 20);
  
  }
  
  void paintbrush(int x, int y, int size, int num) {
    if (mousePressed) {
      float grayval = 255/num;
      for (int i = 0; i<num; i++){
        fill (lerpColor (start, finish, amt));
        rectMode(CENTER);
  rect(mouseX, mouseY, 25, mouseY);
  rect(mouseX, mouseY, mouseX, 25);
      }
    }
    else 
    background(255);
  }
  
        

  



