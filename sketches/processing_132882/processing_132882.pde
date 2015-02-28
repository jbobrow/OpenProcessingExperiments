
//HW 4, Arthur Siebesian
// Doodle with for and while
// February 9, 2014
void setup() {
size (500,500);
background(0);
smooth(10);
strokeWeight(5);
frameRate(10);

}

void draw() {
  while(mouseX >450);
  background(random(255),0,0);
  for (int i = 25; i < 500; i = i+50) {
for (int j = 25; j < 500; j = j+50) {
ellipse(i, j, 25, 25);
}
  }
}

 void mousePressed() {  
    background(random(255),random(255),random(255));
 }
