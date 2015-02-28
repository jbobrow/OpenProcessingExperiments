
int orangeY;
int velocidade;
PImage tree;
PImage orange;
boolean queda;
 
void setup() {
  size(500, 500);
  orangeY = 40;
  velocidade = 4;
  tree = loadImage("tree.png");
  orange=loadImage("orange.png");
  queda = false;
}
 
void draw() 
{
  image(tree, 0, 0, 500, 500);
  image(orange, 150, orangeY, 30, 30);
  
  if (queda == true) 
  {
    orangeY = orangeY + velocidade;
    if(orangeY == 500)
    {
      queda = false;
      orangeY = 40;
    }
  }
  
  if (queda == false) {
   
  }
}
 
void mouseClicked() {
  queda = true;
}
