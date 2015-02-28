

class Pelota{
    int posx_in, posy_in, radio_in;
    int bandera_rebote;
    int Col;
    int velocidad;
    Pelota(int posx,int posy,int radio){           
      ellipse(posx,posy,radio,radio);
      bandera_rebote=0;
      posx_in=posx;
      posy_in=posy;
      radio_in=radio;
      
    }
    void colorear(int Col){     
      fill(0,Col,0);
      ellipse(posx_in,posy_in,radio_in,radio_in);
    };
    void Mover(int velocidad,int dir){
      bandera_rebote=1;
      switch (dir){
        case 0:
          posx_in+=velocidad;
          posy_in+=0;
          break;
        case 1:
          posx_in-=velocidad;
          posy_in+=0;
          break;     
        case 2:
          posx_in+=0;
          posy_in+=velocidad;
          break;          
        case 3:
          posx_in+=0;
          posy_in-=velocidad;
          break;          
        case 4:
          posx_in+=velocidad;
          posy_in+=velocidad;
          break;        
        case 5:
          posx_in-=velocidad;
          posy_in+=velocidad;
          break;         
        case 6:
          posx_in-=velocidad;
          posy_in-=velocidad;
          break;  
        case 7:
          posx_in+=velocidad;
          posy_in-=velocidad;
          break;                
      }      
      ellipse(posx_in,posy_in,radio_in,radio_in);
    };
    void Parar(){
      bandera_rebote=0;
    };

}

Pelota Balon1;

void setup(){
  size(500,500);
  background(0);
  Balon1 = new Pelota(100,100,50);
  smooth();
  noStroke();
}

int cc=0,dir,Xneutro,Yneutro,Cuadrante;
float Rads,Theta,Relacion;

void draw(){     
  if (Balon1.bandera_rebote==1){
    Balon1.Mover(1,dir);
  }else{
    Balon1.Parar();
  }

  if (mousePressed==true){    
    if ((mouseX<Balon1.posx_in+Balon1.radio_in)&(mouseX>Balon1.posx_in-Balon1.radio_in)){
      if ((mouseY<Balon1.posy_in+Balon1.radio_in)&(mouseX>Balon1.posy_in-Balon1.radio_in)){
          Xneutro=mouseX - Balon1.posx_in;
          Yneutro=Balon1.posy_in-mouseY;
          
          if (Xneutro>0){
            if(Yneutro>0)
              Cuadrante=1;
            else
              Cuadrante=4;
          }else{
            if(Yneutro>0)
              Cuadrante=2;
            else
              Cuadrante=3;
          }
        
          Relacion = (float) Yneutro/Xneutro;
          Relacion = abs(Relacion);
          Rads = atan(Relacion);
          
          switch (Cuadrante){
            case 1:
              Theta = 0;
              break;
            case 2:
              Theta = 90;
              break;
            case 3:
              Theta = 180;
              break;
            case 4:
              Theta = 270;
              break;
          }          
          
          Theta += (180*Rads)/PI;          
          if ((Theta<=30)    |  (Theta>360-30))   dir=1;
          if ((Theta>30)     &  (Theta<=90-30))   dir=5;
          if ((Theta>90-30)  &  (Theta<=90+30))   dir=2;
          if ((Theta>90+30)  &  (Theta<=180-30))  dir=4;
          if ((Theta>180-30) &  (Theta<=180+30))  dir=0;
          if ((Theta>180+30) &  (Theta<=270-30))  dir=7;
          if ((Theta>270-30) &  (Theta<=270+30))  dir=3;
          if ((Theta>270+30) &  (Theta<=360-30))  dir=6;   
          println(Theta);       

          if (Balon1.bandera_rebote==1)
            Balon1.bandera_rebote=0;
          else
            Balon1.bandera_rebote=1;
            
            delay(200);
      } 
    }else{
      Balon1.colorear(cc);
      cc=cc+10;    
    }
  }
}

