
//DOG

void setup(){
  size(200,200);
}


void draw(){
background(255); //cor de fundo - preto 0 branco 255
smooth(); //suavizar formas curvas

//cabeça
fill(102, 51, 0); //color code RGB - pesquisa na internet
triangle(mouseX-30, mouseY-10, mouseX, mouseY-40, mouseX, mouseY+20); //cabeça
triangle(mouseX, mouseY-40, mouseX, mouseY-50, pmouseX-10, pmouseY-45); //orelhas
line(mouseX-20, mouseY, mouseX-10, mouseY); //boca (traço 1 - horizontal)
line(mouseX-10, mouseY, pmouseX-5, pmouseY-8); //boca (traço 2 - obliquo)

fill(mouseX, 0, mouseY); //preenchimento olhos
ellipse(pmouseX-8, pmouseY-20, 10, 10); //olhos


//corpo
fill(102, 51, 0); //color code RGB - pesquisa na internet
rect(mouseX, mouseY, 80, 50); //corpo
rect(mouseX, mouseY+50, 15, 20); //pernas frente
rect(mouseX+65, mouseY+50, 15, 20); //pernas trás
line(pmouseX+100, pmouseY, mouseX+60, mouseY); //cauda

}

void mousePressed(){
  //Texto na janela de mensagens do Processing
  println("Olá! Sou o DOG.");
}

