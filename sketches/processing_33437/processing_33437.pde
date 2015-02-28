
/**
 * Bussola Class
 * by Gerardo Coppola.
 * 
 * Created as an helper for maintaining orientation on every rotation.
*/

class Bussola{
  
  char[] asse = {' ','x','y','z'}; 
  int ruotaAsse = 0;
  int x=1;
  int y=1;
  int z=0;
  char avanti='y';
  String posizione="";

  void Bussola(){
    init();
  }
  
  void init(){
    avanti='y';
    x=1;
    y=1;
    z=0;
  }

  String posiziona(String sequenza){
    String buffer="";
    
    posizione=sequenza;  //Memorizzo la posizione iniziale
    
    for (int i = 0; i< sequenza.length();i++){
      buffer+=orienta(sequenza.charAt(i));
    }    
    return buffer;
  }

  //Funzione che traduce i movimenti orientati in assi di rotazione (spero)
  String traduci(String sequenza){
    String buffer="";
    
//    if (sequenza==""){
      init();
      posiziona(posizione);
      
//    } else {
      for (int i = 0; i< sequenza.length();i++){
        buffer+=orienta(sequenza.charAt(i));
      }    
//    }
    
    return buffer;
  }
  
  //La parte + difficile: ruotare e mantenere la coerenza con gli assi di rotazione  
  char orienta(char verso){
    
    if (verso == 'x' || verso == 'y' || verso == 'z' || 
        verso == 'X' || verso == 'Y' || verso == 'Z') {
          return verso;
    }
    
    char buffer=' ';

      switch(verso){
        case 'A':
          buffer=frontale(1);
          break;
        case 'I':
          buffer=frontale(-1);
          break;
        case 'S':
          buffer=laterale(1);
          break;
        case 'D':
          buffer=laterale(-1);
          break;
      }          
      return buffer;    
  }


  char frontale(int inverti){
    int verso =1;
    switch(this.avanti){
      case 'x':
        verso = (inverti*x); 
        ruotaAsse = 1;
        break;
      case 'y':
        verso = (inverti*y); 
        ruotaAsse = 2;
        break;
      case 'z':
        verso = (inverti*z); 
        ruotaAsse = 3;
        break;
    }
    
    ruota(ruotaAsse,inverti);
//    println("F:"+ruotaAsse +" " + this.avanti +" "+  + x + " " + y + " " +z);

    if (verso ==1) {
      return asse[ruotaAsse];
    } else {
      return Character.toUpperCase(asse[ruotaAsse]);
    }
  }
  
  //Se inverti = -1 vado a destra, altrimenti a sinistra
  char laterale(int inverti){
    int verso =1;
    switch(this.avanti){
      case 'y':
        if (abs(z)==1){
          verso = (inverti*z); 
          ruotaAsse = 3;
          this.avanti = 'x';
        
        } else {
          verso = (inverti*x); 
          ruotaAsse = 1;
          this.avanti = 'z';
          
        }
        break;
      case 'x':
        if (abs(z)==1){
          verso = (inverti*z); 
          ruotaAsse = 3;
          this.avanti = 'y';
          
        } else {
          verso = (inverti*y); 
          ruotaAsse = 2;
          this.avanti = 'z';
          
        }
        break;
      case 'z':
        if (abs(y)==1){
          verso = (inverti*y); 
          ruotaAsse = 2;
          this.avanti = 'x';

        } else {
          verso = (inverti*x); 
          ruotaAsse = 1;
          this.avanti = 'y';
          
        }
        break;
    }

    ruota(ruotaAsse,verso);
    
    if (verso ==1) {
      return asse[ruotaAsse];
    } else {
      return Character.toUpperCase(asse[ruotaAsse]);
    }
    
  }  
  
  //Ruota gli assi e imposta il parametro di rotazione successivo
  void ruota(int asse,int inverti){
    float x1,y1,z1;
    inverti *= -1;
    //=(COS(PI/2)*$K52)+(SEN($B52)*$J52)
    if (asse==1){   // rotazione asse X
      y1=y*cos(inverti*PI/2)-z*sin(inverti*PI/2);
      z1=y*sin(inverti*PI/2)+z*cos(inverti*PI/2);
      y=int(y1);
      z=int(z1);
    } else if (asse==2){   // rotazione asse Y
      z1=z*cos(inverti*PI/2)-x*sin(inverti*PI/2);
      x1=z*sin(inverti*PI/2)+x*cos(inverti*PI/2);
      z=int(z1);
      x=int(x1);
    } else if (asse==3){   // rotazione asse Z
      x1=x*cos(inverti*PI/2)-y*sin(inverti*PI/2);
      y1=x*sin(inverti*PI/2)+y*cos(inverti*PI/2);
      x=int(x1);
      y=int(y1);
    } 
    if (false){    
    println( "================"+ x +" "+y+" "+z + "====" +asse +"== " + avanti);
    }
  }

} //Fine classe

