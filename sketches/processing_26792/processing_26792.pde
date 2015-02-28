
class Copia {
  
  void setup() {
  frameRate (30);
  size(300,300);
}


int pos = 0; 
void muestraCopia() {

pos++; 
  line (60,pos, pos, 150);
  if(pos > width) {
     pos = 0;
   } }
}

