
int x = 210;
int y = 100;
 
 
void setup() {
  size(500, 500);
background(191, 44, 232);
}

void draw () {
  if (mousePressed) {
    background (240, 245, 10);
  } else {
    background (91, 15, 147);
  }
noStroke (); 
fill(44, 232, 221);
rect(210,100, 60, 60);
fill(44, 136, 232);
rect(190, 160, 100, 50);
fill(44, 232, 143);
rect(170, 160, 20, 100);
fill(44, 232, 143);
rect(290, 160, 20, 100);
fill(141, 232, 44);
rect(200, 210, 80, 80);
fill(232, 204, 44);
rect(210, 290, 20, 100);
fill(232, 204, 44);
rect(250, 290, 20, 100);
fill(232, 65, 9);
rect(190, 390, 40, 20);
fill(232, 65, 9);
rect(250, 390, 40, 20);
fill(0);                   // colo ojo
rect(220, 120, 5, 5);      // ojo 1
fill(0);
rect(250, 120, 5, 5);
}
                
                
