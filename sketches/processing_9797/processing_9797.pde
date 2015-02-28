
Riscos riscos;
int sorteio = 5;
void setup(){
  size(800,600);
  background(255);
  frameRate(30);
riscos = new Riscos();
riscos.carrega();
} 

 
void draw(){
riscos.probabilidadeCoisa();
riscos.probabilidadeLugar();
int sorteioCor = int(random(0,4));
if (sorteioCor == 0){
riscos.riscoPreto();
}else if (sorteioCor == 1){
riscos.riscoBranco();
}else if (sorteioCor == 2){
riscos.riscoCinza1();
}else{
riscos.riscoCinza2();
}


if (mousePressed == true){
    background (255);
    sorteio = int(random(0,5));
  }
}





