
//Candice Ferreira: Problem set 2. Question2
color start = color(255, 255, 255);
color finish;
float amt= 0.5;
 
void setup() {
  size (600, 600);
  background (0);
  finish = color(random(255), random(255), random(255));
  smooth();
  }
 void draw () {
  amt+=.01;
  if (amt >= 1){
   amt= 0.1;
   start=finish;
   finish = color (random(255), random(255), random(255));
 }
    paintbrush (mouseX, mouseY, 50, 20);
   
  }
   void paintbrush(int x, int y, int size, int num) {
    if (mousePressed) {
      float  shape = 245/num;
      for (int i = 0; i<num; i++){
        fill (lerpColor (start, finish, amt));
        rectMode(CENTER);
  ellipse(mouseX, mouseY, 80, mouseY);
  ellipse(mouseX, mouseY, mouseX, 80);
  ellipse(mouseX, mouseY, 100,mouseY); 
      }
    }
    else
    background(0);
  }


