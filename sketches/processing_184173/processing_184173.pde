
String URLSERVIDOR="http://creaciodigital.upf.edu/~i116665/redes/processing/php/"; //cambiar por la URL y ruta correcta en tu caso 

color colorActual=#000000;
String tipoFormaActual="rectangulo";

ArrayList<Forma> formas;
Forma ultimaForma=null;
boolean creandoforma=false;

void setup() {
  size(400,400); 

  formas=new ArrayList<Forma>();
  background(255);
  leePHP();
  

}

void draw() {
  if (creandoforma) {
    ultimaForma.x2=mouseX;
    ultimaForma.y2=mouseY;
    dibujaFormas();
  }
  
}

void mousePressed() {
  ultimaForma=new Forma(tipoFormaActual, mouseX,mouseY,mouseX,mouseY,colorActual);
  formas.add(ultimaForma);
  creandoforma=true;
}

void mouseReleased() {
  creandoforma=false;
  enviaPHP(ultimaForma);
}

void leePHP() {
  formas=new ArrayList<Forma>();
  String[] lineas_texto=loadStrings(URLSERVIDOR+"cargaformas.php");
  
  for (int i=0;i<lineas_texto.length;i++) {
    String lineatexto=lineas_texto[i];
    println(lineatexto);
    String[] valores=split(lineatexto," ");
    String tipoforma=valores[0];
    int x1=int(valores[1]);
    int y1=int(valores[2]);
    int x2=int(valores[3]);
    int y2=int(valores[4]);
    color col=unhex(valores[5]);
    Forma nuevaForma=new Forma(tipoforma,x1,y1,x2,y2,col);
    formas.add(nuevaForma);
  }
  dibujaFormas();
}

void enviaPHP(Forma forma) {
  
  String parametros="tipo="+forma.tipo+"&x1="+forma.x1+"&y1="+forma.y1+"&x2="+forma.x2+"&y2="+forma.y2+"&col="+hex(forma.col);
  String url=URLSERVIDOR+"creaforma.php?"+parametros;
  println("Enviando: "+url);
  String[] respuesta=loadStrings(url);
  println("Respuesta: "+respuesta[0]);
}
void borraTodo() {
  String url=URLSERVIDOR+"borratodo.php";
  println("Enviando: "+url);
  String[] respuesta=loadStrings(url);
  println("Respuesta: "+respuesta[0]);
  leePHP();
}

void dibujaFormas() {
  background(255);
  for (int i=0;i<formas.size();i++) {
    formas.get(i).dibuja();
  }
} 

void keyPressed() {
  switch (key) {
    case '1': colorActual=#000000; break;
    case '2': colorActual=#ff0000; break;
    case '3': colorActual=#ffff00; break;
    case '4': colorActual=#00ff00; break;
    case '5': colorActual=#00ffff; break;
    case '6': colorActual=#ff00ff; break;
    case 'q': tipoFormaActual="rectangulo"; break;
    case 'w': tipoFormaActual="elipse"; break;
    case 'e': tipoFormaActual="linea"; break;
    case ' ': leePHP(); break;
    case 'z': borraTodo(); break;
    
  }
  
} 



class Forma {
  String tipo;
  int x1;
  int y1;
  int x2;
  int y2;
  color col;
  
  Forma (String tipo, int x1, int y1, int x2, int y2, color col) {
    this.x1=x1;
    this.y1=y1;
    this.x2=x2;
    this.y2=y2;
    this.tipo=tipo;
    this.col=col;
  }
  
  void dibuja() {
    fill(col, 60);
    stroke(col, 255);
    rectMode(CORNER);
    ellipseMode(CORNER);
    if (tipo.equals("rectangulo")) rect(x1,y1,x2-x1,y2-y1);
    else if (tipo.equals("elipse")) ellipse(x1,y1,x2-x1,y2-y1);
    else if (tipo.equals("linea")) line(x1,y1,x2,y2); 
      
  }
}



