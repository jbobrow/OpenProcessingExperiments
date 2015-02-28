
//int numLines=100
//int distance;
void setup() {
 size(600, 600); 
 frameRate(15);
 //stroke(random(255),random (255),random(255));
 background(0);
// distance = width/2;
 
}

void draw() {
// for (int 1 = 0; 1<= numLines; 1++){
 /* stroke(255),random (255),random(255));
  strokeWeight (5);*/
 if (mousePressed && mouseButton == LEFT){
  stroke(random(255),random (255),random(255));
  strokeWeight (5); 
   
  line(0,300, mouseX, mouseY);
  line(300, 0, mouseX, mouseY);
  line(300, 600, mouseX, mouseY);
  line(600, 300,mouseX, mouseY);
 }

  else if (mousePressed && mouseButton == RIGHT)
  {
    background(0);
  }
  }


