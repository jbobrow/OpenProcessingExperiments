
void setup (){
size(500, 500);
}

void draw(){
  background(38,250,230);
  int r = mouseX;
  
  if(r>100) r = 100;
  
point(170, 120);
ellipse(mouseX *2, 120, r, 55);
point(250, 120);
ellipse(mouseX, 120, r *2, 55);
point(170, 250);
ellipse(mouseX, 250, r *4, 55);
}

