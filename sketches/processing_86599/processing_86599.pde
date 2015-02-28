

/*Comportamiento emergente
 *creado por Oscar Martinez
 */
 
 /*Al ejecutarlo con processing, version 2.0(6 o 7),
  *en modo "java" puede que salga algun mensaje de error.
  *Recomiendo ejecutarlo como "javaScript" o utilizar versiones
  *del programa anteriores.
  */
  
redondas[] r;

void setup(){
  size(600,600);
  frameRate(2);
  stroke(#1CFF00);
  r =new redondas[150];
  for(int i=0;i<100;i++){
    r[i]=new redondas();
    r[i].x=int(random(0,600));
    r[i].y=int(random(0,600));
    r[i].g=int(random(10,70));
  }
}

void draw(){
  background(0);
  for(int i=0;i<100;i++){
    r[i].redonda();
    r[i].pequeno();
  }
}

class redondas{
  int x, y , g;
  
  void redonda(){
    ellipse(x,y,g,g);
  }
  void pequeno(){
    x=x;
    y=y;
    g=int(random(10,70))-g;
    g--;
    if(g==50)
    g=int(random(10,40));
  }
}


