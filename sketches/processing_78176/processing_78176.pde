
float x2;
float y2;
float menge = 10;
float counter =0;

void setup() {
size(375, 550);
smooth();
rect(25, 25, 325, 500);
fill(255);
}

 

void draw() {
  
  int a = max(26, mouseX);
  int b = max(26, mouseY);
  if (mouseX >350){
    a = 349;
  }
   if (mouseY >525){
    b = 525;
  }
  
  y2 = random(30, 525);
  x2 = random(30, 350);
  line(a, b, x2, y2);
  counter = counter+ 1 ;
  
  if (counter == menge) {
    rect(25, 25, 325, 500);
  counter= 0;
  
  }
  
}
