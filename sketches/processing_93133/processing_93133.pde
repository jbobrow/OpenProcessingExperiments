
//Emanuele S. Reis - Exercicio diagonal e linha

void setup (){
  size(200,200);
  background (150);
} 
  void draw (){
    fill (0);
    strokeWeight (4);{
       for (int mouseX=0; mouseX<200; mouseX=mouseX+20)
       for (int mouseY=0; mouseY<200; mouseY=mouseY+20)
  point (mouseX+mouseY, mouseY+mouseX);
  for (int mouseZ=6; mouseZ<200; mouseZ= mouseZ+30)
  point (mouseZ, 6);

  }
  
  }
