
ArrayList puntosY;
ArrayList puntosX;
int i=0;


void setup () {
  puntosX=new ArrayList();
  puntosY=new ArrayList();
}

void draw () {
  smooth();
  puntosX.add(i);
  puntosY.add(cos(i));
  i++;
  translate(0,height/2);
  scale(2);
  if (i>0) {
   for (int pos=1;pos < puntosX.size();pos++) {
     line((Integer) puntosX.get(pos-1),(Float) puntosY.get(pos-1),(Integer) puntosX.get(pos),(Float) puntosY.get(pos));
   }
  }

}
