
class Letter
{
  float x, y;
  char ch;
  
  void display() {
    fill(220, 220, 0);
    textAlign(CENTER);
    text(ch, x, y);
  }
  
  void shake() {
    x += random(-5, 5);
    y += random(-5, 5);
  }
  
  void home(float homeX, float homeY) {
 x = lerp(x, homeX, .02); 
 y = lerp(y, homeY, .02);  
  }
}



