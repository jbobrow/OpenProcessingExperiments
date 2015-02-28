
class Tiempo{
  int principio;
  Tiempo (){
    principio = millis();
  }
  
  int segundos(){
   return (int) ((millis() - principio) / 1000) %60; 
  }
  
  boolean limiteHora(int seg){
    return segundos() *60 + millis() == seg;
  }
   
void dibujaHora(){
    
  if (segundos()>=21 && segundos()<4){
    background (0);
    fill (0,127,0);
      ellipse(250,450,1000,200);
  }else if (segundos()==4){
    background (0,0,50);
    fill (0,127,0);
      ellipse(250,450,1000,200);
  }else if (segundos()==5){
    background (10,40,110);
    fill (0,127,0);
      ellipse(250,450,1000,200);
  }else if (segundos()==6){
    background (25,60,140);
    fill (0,127,0);
      ellipse(250,450,1000,200);
  }else if (segundos()==7){
    background (40,80,170);
    fill (0,127,0);
      ellipse(250,450,1000,200);
  }else if (segundos()==8){
    background (60,110,200);
    fill (0,127,0);
      ellipse(250,450,1000,200);
  }else if (segundos()>=9 && segundos()<16){
    background (90,140,225);
    fill (0,127,0);
      ellipse(250,450,1000,200);
  }else if (segundos()==16){
    background (60,110,200);
    fill (0,127,0);
      ellipse(250,450,1000,200);
  }else if (segundos()==17){
    background (40,80,170);
    fill (0,127,0);
      ellipse(250,450,1000,200);
  }else if (segundos()==18){
    background (25,60,140);
    fill (0,127,0);
      ellipse(250,450,1000,200);
  }else if (segundos()==19){
    background (10,40,110);
    fill (0,127,0);
      ellipse(250,450,1000,200);
  }else if (segundos()==20){
    background (0,0,50);
    fill (0,127,0);
      ellipse(250,450,1000,200);
  }
  
  fill (255);
  
    if (segundos()!=24){
      text ("Hora = "+segundos()+":00", 40, 40);
    }else{
      hora.reinicio();
    }
  }
  
  void reinicio(){
    principio = millis();
  }
}

