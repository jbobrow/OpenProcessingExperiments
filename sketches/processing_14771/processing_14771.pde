
int diminue;
int augmente;
void setup () {
  diminue = 0;
augmente = 0;
  size (800,800);
  background  (255);
}
void draw() 
{
  diminue = diminue - 1;
  augmente = augmente + 1;
  fill (0, 359, 395, 1) ;
  triangle (mouseX, mouseY -50 + diminue, mouseX - 50 + diminue, mouseY + 50 + augmente, mouseX + 50 + augmente, mouseY + 50 + augmente);
}

