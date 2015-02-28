
void setup()
{
  size(600,600);
  smooth();
  background(000);
}

void draw()
{

  rotate(radians(5));
  
  noStroke();
  fill(#00D822, 20);
  translate (300,300);

  
  // float(mouseX) / float(width) est un nombre entre 0 et 1
  float angle = 360.0 * float(mouseX) / float(width); // astuce les float convertissent un entier en relatif pour permettre une division
  rotate(radians(angle));
  
  for (int i =0; i<=60; i++) {
  
  
  rotate(radians(360/50)); //180/3=60 ou rotate(radians(60));
  ellipse(i*2,i*2,i/10,i/10);
  }
}





  void mousePressed() {
   
    background(000);
  }

