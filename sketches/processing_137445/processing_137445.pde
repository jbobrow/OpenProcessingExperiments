
PImage [] secuencia=new PImage[10];
void setup () {
  size (800, 800);
  for (int i=0; i<secuencia.length;i++) {
    secuencia [i]=loadImage(i+".jpg");
    println(i+".jpg");
  }
}
void draw () {
  for (int i=0; i<secuencia.length; i++) {
    image (secuencia [i], i*80,0, 80, 80);
  }
}

