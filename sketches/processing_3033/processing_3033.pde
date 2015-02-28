
void setup(){
  size(600,500); //tamaño de la tela
  background(255);//fondo blanco
  smooth();//suavizante
}

void draw(){
  float centro=(250);
  float medio=(300);
  float tiempo= (10*(second()));
  float azar=(random(600));
  
  
  stroke(255);
  for(float x = 30; x<=30;x+=2){/*el ciclo for lo uso 
                            solo para que funcione como ciclo*/
    line(x,0,x,0);
    if( x>=30){
      
      stroke (0); // lineas negras
      line(tiempo,azar,(medio-40),centro);
      // se alargan a medida del tiempo
      stroke (255);// lineas blancas
      line(tiempo,azar,medio,centro);
      // y salen en direccion de azar

    }
  }
}




