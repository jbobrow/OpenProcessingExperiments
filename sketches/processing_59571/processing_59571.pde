
float grau= radians(0);
int r=0;
int g=0;
int b=0;
char tamanho;
 
void setup() {
  size(800, 600);
  background(255);
  smooth();
  r = int(random(255));
  g = int(random(255));
  b = int(random(255));
  mouseX=width/2;
  mouseY=height/2;
}
 
void draw() {
  translate(mouseX, mouseY);
  
  if (tamanho == '+'){
    scale(1+random(0,2));
  }else if (tamanho == '-'){
    scale(1-random(0,2));
  }
  
  for (int circulo = 1; circulo < 10; circulo++) {
    fill (r, g, b, 15);
    stroke (r, g, b, 50);
    grau = grau + 50;
    rotate(grau);
    triangle(0, 0, 0, 50, 50, 100);
  }
}
 
void keyPressed(){
  if (key == CODED){
    if (keyCode == UP){
      tamanho = '+'; 
    }else if (keyCode == DOWN){
      tamanho = '-';
    }
  }
  if (key == 'l'){
    background(255);
  }
  if (key == 'r'){
    r = int(random(255));
    g = 0;
    b = 0;
  }
  if (key == 'g'){
    r = 0;
    g = int(random(255));
    b = 0;
  }
  if (key == 'b'){
    r = 0;
    g = 0;
    b = int(random(255));
  }
  if (key == 'c'){
    r = int(random(255));
    g = int(random(255));
    b = int(random(255));
  }
  if (key == 'p'){
  save("t"+pagina+".png");
  pagina++;
  }
}
