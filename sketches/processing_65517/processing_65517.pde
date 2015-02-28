
class PersonajeP{

  int TotalFarm;
  //PImage FarmA[];
  PImage FotogramasP[][];
  float xa,ya,xr,yr;
  int k,indI,numI;
  PVector Pocicion;
  PVector Velocidad;
  PVector Aceleracion;
  PVector Pivote;
  float Angulo;
  
  PersonajeP(int _x,int _y,PImage _direc[][],PVector _Vel,PVector _Acel,PVector _Pivote,float _Angulo){
    //FarmA = _direc;
    FotogramaCaminar(_direc);
    xa = 0.0;
    ya = 0.0;
    xr = 0.0;
    yr = 0.0;
    indI = 0;
    numI = 0;   
    //TotalFarm = FarmA.length;
    
    Pocicion = new PVector(_x,_y);
    Velocidad = new PVector(0,0);
    Velocidad = _Vel;
    Aceleracion = new PVector(0,0);
    Aceleracion = _Acel;
    Angulo = _Angulo;
    Pivote = new PVector(0,0);
    Pivote = _Pivote;
    //Velocidad = new PVector(random(-1,1),random(-1,0));//la velocidad se escoje alatoriamente
  }
  
  void FotogramaCaminar(PImage _direc[][]){
   
    FotogramasP = _direc;  
  
  }
  
  
  void Mover(){
    
    Velocidad.add(Aceleracion);  
    Pocicion.add(Velocidad);
    
    //dibujar();
  
    
  }
  
  void Rotacion(){
   
    
    translate(Pocicion.x + Pivote.x,Pocicion.y + Pivote.y);
    rotate(Angulo);
    
  }
 
  void dibujar(){
     translate(-Pivote.x,-Pivote.y);
     image(FotogramasP[indI][numI],0,0);
    
    /*if (mousePressed == false){
     //k = (k+1) % CaminarFram.length;
   
     image(CaminarFram[0],Pocicion.x,Pocicion.y);
    
   }else{
      //k = (k+1) % CorrerFram.length;
   
     image(CorrerFram[1],Pocicion.x,Pocicion.y);
   
   }*/
   
   
  }

}

