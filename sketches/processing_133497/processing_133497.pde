
void  setup () {
   tamaño (480, 120);
}

void  draw () {
   si ( mousePressed ) {
     llenar (0);
  }  más {
     llenar (255);
  }
  elipse ( mouseX , mouseY , 80, 80);
}
