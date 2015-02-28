
int dots = 45;

void setup() {
  size(600,550);
  background(255);
}

void draw() {
    noStroke();
    fill(0);
    if(keyPressed)  
    if (key == 'r' || key == 'r')
      fill(255,0,0);
    if (key == 'b' || key == 'b')
      fill(5,3,255);
    if (key == 'o' || key == 'o')
      fill(255,125,3);
    if (key == 'y' || key == 'y')
      fill(-255);
    if (key == 'G' || key == 'G')
      fill(22,255,3);
    if (key == 'g' || key == 'g')
      fill(42,134,34);
    if (key == 'B' || key == 'B')
      fill(0,255,249);
    if (key == '^' || key == '^')
      fill(3,2,149);
    if (key == 'p' || key == 'p')
      fill(254,0,255);
    if (key == 'P' || key == 'P')
      fill(178,0,255);
    if (key == '<' || key == '<')
      fill(142,142,142);
    if (key == '>' || key == '>')
      fill(0);
    if (key == 'k' || key == 'k')
      fill(255);
    if (key == ' ' || key == ' ')
      background(255);
    if(mousePressed) {
    ellipse(mouseX, mouseY, dots, dots);
    
    if(key == '+' || key == '+') {
    dots = dots+1;
    } else
    if(key == '-' || key == '-') {
      dots = dots-1;
 }
    }
  }

