
int[] estrellaX = new int[1000];
int[] estrellaY = new int[1000];
boolean nave=false;
int x = 0;
int posicionnave = 500;
color[] colorestrella = new color[1000];
 
void setup() {
  size(500,500);
  for (int i = 0; i < 1000; i++) {
    estrellaX[i] =(int)random(width);
    estrellaY[i] = (int)random(height);
    colorestrella[i] = color(random(100,255));
  }
}
 
void draw() {
  background(0,0,50);
  for (int i = 0; i < 1000; i++) {
    if (random(10) < 1) {
      colorestrella[i] = (int)random(100,255);
    }
    fill(colorestrella[i]);
    ellipse(estrellaX[i], estrellaY[i], 3, 3);
  }
  if(mousePressed){
  fill(#C40202);
  ellipse(posicionnave - 2,105,40,20);
  fill(#99CC00);
  bezier(posicionnave - 50,113,posicionnave,99,posicionnave,99,posicionnave + 41,113);
  bezier(posicionnave - 50,113,posicionnave,127,posicionnave,127,posicionnave + 41,113);
  posicionnave = posicionnave - 2;
  }

}




