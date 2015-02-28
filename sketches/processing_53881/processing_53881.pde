
//Kim Sipkens
//PS2 Q2

color start = color(0, 0, 0);
color finish;
float amt= 0.0;

void setup() {
  size(400,400);
  background(83);
  smooth();
  noStroke();
  finish = color(random(255), random(255), random(255));
 
}
 
void draw() {
  
    amt+=.01;
  if (amt >= 1){
   amt= 0.0;
   start=finish;
   finish = color (random(255), random(255), random(255));
}

brush (mouseX, mouseY, 50, 20);

}
void brush(int x, int y, int size, int num) {
    if (mousePressed) {
      float grayval = 255/num;
      for (int i = 0; i<num; i++){
        fill (lerpColor (start, finish, amt));
        rectMode(CENTER);

  fill(mouseX,mouseY,50,mouseY);
  rect(mouseX,mouseY,mouseX,25);
 
ellipse(mouseX, mouseY, 50, mouseY);
ellipse(mouseX,mouseY, mouseX, 50);

translate(45, 45);

ellipse(mouseX,mouseY, 50, mouseY);
ellipse(mouseX,mouseY, mouseX, 50);


}
 


    }
}

                
                
