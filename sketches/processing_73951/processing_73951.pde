

PFont LETRA;

void setup(){
  
  size (600,400);
}

void draw (){
  
  frameRate(5);
  
  background(255);
  println(PFont.list());
  
  String[] TIPO = PFont.list();
  
  println(TIPO);
  LETRA = createFont(TIPO[int(random(1,633))],150);
  
  fill(0);
  textFont(LETRA);
  text(" LUIS ",100,250);
}

