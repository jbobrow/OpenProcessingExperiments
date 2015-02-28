
float var = 5;
int verifica = 0, x_pos = 0;
 
void setup() {
  size(800,400);
  stroke(5);
  fill(255, 242, 0);
  smooth();
  frameRate(30);
}
void draw() {
  background(0);
  arc(x_pos,200,200,200,0,(var*PI)/3);
  if(verifica == 1) {
    var -= 0.1;
    if(var == 5.0)
      verifica = 0;
  }
  if(verifica == 0) {
    var += 0.1;
    if(parseInt(var) == 6)
      verifica = 1;
  }
   
  if(x_pos >= 850)
    x_pos = -70;
  x_pos += 7;
}
