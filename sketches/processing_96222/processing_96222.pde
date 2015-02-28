
//És un ellipse que es va repetin i es va tapant donant una sensació de moviment, a més a més alhora de realitzar més d'una el·lipse i variar-ne els colors li dona sensació de transparència. He navegat molt per internet per inspirar-me amb algu i vai veure un torial que t'explicava com anar tapant lo que feies, me le mirat molts cops per entendre i he aplicat el que m'interessava, despres he juagat amb els colors amb la funció del mouse i amb el nombre d'el·lipses// 
int[] x,y; //Són els vectors on escarreguen les posicions del mouse//
int cont,i; //Serveix per introduir les la variable a partir de la qual el colrs aniran varian i ugmentant fns a 250.//
int contColor;
void setup() {
  background(0,0,0,10);
  size(600,600);
  smooth();//per inserir la funció pilota//
  colorMode(RGB);
  noCursor();
  x = new int[100000];
  y = new int[100000];
  cont = 0;
  i = 0;
  contColor = 0;
}
void draw() {
  fill(mouseX+10,mouseY+10,50,23);//El color vari quan mogui la pilota//
  pilota1(mouseX, mouseY);//La pilota es mogui amb el cursor//
  pilota2(mouseX, mouseY);
  pilota3(mouseX,mouseY);
  contColor = (contColor+1)+250; //el color de la pilota vagi variant de 0 fins a 250 en l'escala RGB//
  fill(0,0,0,10); //Color negre perque vagit tapant la ellipse i doni la sensació de moviment//
  rect(0,0,width,height);
  fill(mouseX,mouseY, height, width);
  x[cont]=mouseX; 
  y[cont]=mouseY;
  ellipse(x[i],y[i],90,90);
{
}
}  
void pilota1(int x_, int y_)//funció pilota que s'executa a sobre//
{
  noStroke();
  fill(mouseX+10,mouseY+10,50,23);
  ellipse(x_, y_, 90, 90);
}
void pilota2(int x_, int y_)
{
  noStroke();
  fill(mouseX+5,mouseY+5,50,100);
  ellipse(x_, y_, 150, 150);
}
void pilota3(int x_, int y_)
{
  noStroke();
  fill(mouseX+2,mouseY+2,200,100);
  ellipse(x_, y_, 50, 50);
}


