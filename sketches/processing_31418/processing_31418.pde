
class Particulas {
  int x, y, vel, dir, a, iniX, iniY, tam, tInca;
  boolean incapacitada;


  Particulas() {
    x=(int)random(1,width);
    y=(int)random(1,height);
    iniX=x;
    iniY=y;
    vel=(int)random(1,4);
    dir=(int)random(8); // 8 direcciones posibles 4 ortogonales y 4 diagonales
    tam=(int)random(10,20);
    incapacitada = false;
    tInca = 60;
  }

  void pintar() {
    a=(int)dist(iniX, iniY, x, y)+50;
    
    if(incapacitada == true){
      fill(255,255,0, a);
    }else{
      fill(255, a);
    }
   
    
    ellipse(x, y, tam, tam);
    
    if(incapacitada == true){
      tInca --;
      if(tInca < 0){
        incapacitada = false;
        tInca = 60;
      }
    }
    
    
  }

  void mover() {

    switch(dir) {
      case 0:
      x+=vel;
      break;
      
      case 1:
      x+=vel;
      y+=vel;
      break;
      
      case 2:
      y+=vel;
      break;
      
      case 3:
      y+=vel;
      x-=vel;
      break;
      
      case 4:
      x-=vel;
      break;
      
      case 5:
      x-=vel;
      y-=vel;
      break;
      
      case 6:
      y-=vel;
      break;
      
      case 7:
      y-=vel;
      x+=vel;
      break;
    }
    colision();
  }
  
  void colision(){
    if( x < 0 || x > width || y < 0 || y > height) {
      dir=(int)random(8);
    }
  }
 
  
}


