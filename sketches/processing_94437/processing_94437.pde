
//Wictor Hugo da Cruz - Exercicio diagonal
  
void setup (){
  size(200,200);
  background (#3CBF41);
}
  void draw (){
    fill (255);
    stroke(255);
    strokeWeight (6);{
       for (int mouseX=0; mouseX<200; mouseX=mouseX+20)
       for (int mouseY=0; mouseY<200; mouseY=mouseY+20)
  point (mouseX+mouseY, mouseY+mouseX);
  }
    
  }
