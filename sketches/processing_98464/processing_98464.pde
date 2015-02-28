
//*fachada representando variação de luz.

void setup () {
  size (200, 200);
  background (0);
}
void draw () {
  background (30, mouseX, 240);
  if (  mouseX<100) {

    fill(245, 232, 84);
  }
  else {   
    fill(41, 99, 220);
  }
  rect(60, 60, 110, 80); //*vidro,fundo do reticulado.
  for (int y=30; y<=160; y=y+5)
  { 
    fill(155, 69, 27, 60);
    rect(120, 165, 40, 50); //*porta.


    fill(150, 120, 142, 40);//*reticulado
    stroke(0);

    rect (30, y, 145, 170); //*dimensão da'casa;

    quad(175, 30, 175, 200, 195, 170, 195, 20);//*planoparedelateral

    quad(30, 30, 175, 30, 195, 20, 55, 20);//*palnoteto
  }
}                                      //*Viviane Fogaço 2S 2012 computação1
