
//Pacman
int a = 60;
int b = 320;
void setup() {
  size(400, 250);
  smooth();
  fill(255,255,0);
 
}
void draw() {
 background(0);
     if(a>=10) {
    a--;
    b++;
     }      
 float x = radians(a);
 float y = radians(b); 
 arc(100, 100, 200, 200, x, y);
  
}
