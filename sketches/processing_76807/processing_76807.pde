
//Autor: Adrian Díaz López
//Heisenberg de Breaking Bad

int valor1=80;
int valor2=140;
void setup(){
size(400,500);
background(255);
}

void draw(){
  background(255);
  //sombrero
  fill (0);
  rect (70,valor2,250,5);
  rect(120,valor1,150,80);
  //cara
  fill(#F7CFB6);
  rect (120,145,150,170);
  //ojos
  fill(255);
  ellipse (155,180,35,15);
  ellipse(235,180,35,15);
  fill(0);
  ellipse(mouseX-225,180,10,10);
  ellipse(mouseX-150,180,10,10);
  //gafas
  fill(0);
  rect (115,mouseY,70,40);
  rect (175,mouseY,40,5);
  rect (205,mouseY,70,40);
  //orejas
  fill(#F7CFB6);
  bezier (120,180,110,160,70,190,120,230);
  bezier(274,180,270,160,330,190,270,230);
  //nariz
  fill(0);
  line(185,170,183,230);
  line(205,170,207,230);
  ellipse(182,232,5,5);
  ellipse(209,232,5,5);
  //bigote
  fill(#F7CFB6);
  beginShape();
  vertex(155,270);
  vertex(160,240);
  vertex(165,260);
  vertex(170,240);
  vertex(175,260);
  vertex(180,240);
  vertex(185,260);
  vertex(190,240);
  vertex(195,260);
  vertex(200,240);
  vertex(205,260);
  vertex(210,240);
  vertex(215,260);
  vertex(220,240);
  vertex(225,260);
  vertex(230,240);
  vertex(235,270);
  endShape();
    //boca
  fill(0);
  rect(170,270,50,5);
  
  if(mousePressed){
    fill(#F7CFB6);
    rect (170,270,50,20);
  }
}
  
void mouseReleased() {
if (valor1 == 80 && valor2==140) {
  valor1=40;
  valor2=115;
}else{
  valor1=80;
  valor2=140;
}
}



