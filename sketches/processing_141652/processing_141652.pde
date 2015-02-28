
class Life{
  float xPos;
  float yPos;
  PImage vita;
  int vidas;
  int resta_vida;
  int total_vidas;
  int vidas_start;
  boolean vida_menos;
  boolean reinicia_vidas;
  
  Life(){
    vita = loadImage("vida.png");
    vidas = 0;
    vida_menos = false;
    vidas_start;
    reinicia_vidas = false;
    vidas_start = 5;
  }
  

  void reinicia(){
  if(reinicia_vidas == true){
  vidas = 0;
  total_vidas = 1;
  vidas_start = 5;
  reinicia_vidas = false;
  }
  
  }
  
  
  void dibuixa(){
  fill(255);
  textSize(30);
  text(int(total_vidas),100, 98);
  
  }
  void calcula(boolean acierto, int puntuacion){

    if (acierto == false && total_vidas != 0){
      vidas --;
      
    }
 
      
     total_vidas = vidas_start + floor(puntuacion/100) + vidas; 
     //println("total vidas "+total_vidas);
  }


}

