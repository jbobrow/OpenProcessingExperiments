
// CH:
int turn = 0;
float radius = 0;
float Jeremy = random(220);
int cenX,cenY = 0;

   
void setup() {
  size(600,600);
  background(0);
  noFill();
  colorMode(HSB,255); // set hue saturation  & brightness
  strokeWeight(.5);
  smooth();
}
 
void draw() {
  //background(0);
  radius = (width / 2) * sqrt(250);
  cenX = mouseX;
  cenY = mouseY;
  
 
  for (int d = 0; d <= 320; d+=5) {
    float r = radians(d + turn);
    stroke(d, Jeremy,random (6000),10);  
    rectMode (CENTER);
    bezier(cenX, cenY, cenX + radius / 2 * cos(r), cenY + radius / 2 * sin(r) , cenX + radius * cos(r + HALF_PI), cenY + radius * sin(r + HALF_PI), cenX + radius * cos(r + PI), cenY + radius * sin(r + PI));  

 
}
  
 turn++;
}               
