
PImage[] lista = new PImage[10];

void setup () {
  size (800,800);
  for (int i = 0; i<lista. length; i ++){
    
    lista [i] = loadImage(i+".jpg");
  }
}
void draw () {
  for (int i=0; i< lista. length; i++){
    image(lista[i],i*60,0,60,40);
  }
}

