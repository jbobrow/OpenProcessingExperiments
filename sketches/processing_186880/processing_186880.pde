
PImage ImgStart;
PImage Img100;
PImage Img10;
PImage Img1;
PImage ImgSeguir;
PImage ImgBart;
int dividendo;
int divisor;
int dividendoCentenas;
int dividendoDecenas;
int dividendoUnidades;
int cocienteDecenas = 0;
int cocienteUnidades;
int cocienteCentenas;
int ancho = 50;
int anchoBart = 70;
int paso = 0;
boolean nueva = true;
boolean nueva2 = true;
boolean nueva3;
boolean nueva4;
boolean nueva5;
boolean nueva6;
boolean propuesta;

void setup(){
  
  size(1000,800);
  ImgStart = loadImage("start.png");
  Img100 = loadImage("euro100.png");
  Img10 = loadImage("euro10.png");
  Img1 = loadImage("euro1.png");
  ImgSeguir = loadImage("seguir.png");
  ImgBart = loadImage("bart.png");
}
void draw(){
  background(155);
  //BOTON START
  image(ImgStart, 30,30,60,60);
  //BOTON SEGUIR
  image(ImgSeguir, 100, 30, 120, 60);
  //NUEVA DIVISIÓN
  switch(paso){
    case 1 ://MUESTRA DIVISIÓN
    text("DIVIDIMOS LAS CENTENAS", 30, 200);
      if (nueva){
        dividendo = int (random(10)*100);
        divisor = int (random(9)+1);
        nueva = false;
      }
        dividendoCentenas = int(dividendo/100);
        dividendoDecenas = int((dividendo - 100 * dividendoCentenas)/10);
        dividendoUnidades = dividendo - 100* dividendoCentenas - 10 * dividendoDecenas;    
        nueva = false;       
      //ESCRIBE DIVISIÓN
        text(str(dividendo), 300, 30);
        text( str(divisor), 340, 30);
      //DIBUJA DINERO DIVIDENDO
        dibujaDividendo();
        dibujaBart();
             
      break;      
      
      case 2://DIVIDIMOS LAS CENTENAS
      
      text(str(dividendo), 300, 30);
      text( str(divisor), 340, 30);
      text("PASAMOS EL RESTO DE CENTENAS A DECENAS", 30, 200);
          if (nueva2){
            cocienteCentenas = int (dividendoCentenas/divisor);
            dividendoCentenas = dividendoCentenas - cocienteCentenas * divisor;
            nueva2 = false;
          }     
          //DIBUJA DINERO DADO A BART
          reparte();
          dibujaBart();          
          dibujaDividendo();          
      break;
      case 3://CONVERTIMOS EL RESTO DE CENTENAS EN DECENAS      
      text(str(dividendo), 300, 30);
      text( str(divisor), 340, 30);
      text("DIVIDIMOS LAS DECENAS", 30, 200);
        if (nueva3){        
          dividendoDecenas = dividendoDecenas + 10 * dividendoCentenas;
          dividendoCentenas = 0;
          nueva3 = false;
        }
        
        //DIBUJA DINERO DIVIDENDO
        
        if (dividendoDecenas < 10){
          for(int i = 0; i < dividendoDecenas; i ++){       
              image(Img10, 500+ i * ancho * 1.1, 10 + ancho * 600/328 *1.1 , ancho, ancho * 600/328);            
          }
        }
        else{
          if(dividendoDecenas < 20){
            for(int i = 0; i < 10; i ++){       
              image(Img10, 400+ i * ancho * 1.1, 10 + ancho * 600/328 *1.1 , ancho, ancho * 600/328);            
            }
            for(int i = 10; i < dividendoDecenas; i ++){       
              image(Img10, 400+ (i - 10) * ancho * 1.1, 10 , ancho, ancho * 600/328);            
            }
          }
          else{
            if (dividendoDecenas < 40){
              for(int i = 0; i < 20; i ++){       
                image(Img10, 400+ i * ancho *0.5 * 1.1, 10 + ancho * 600/328 *1.1 * 0.5 , ancho * 0.5, ancho * 0.5 *600/328);            
              }
              for(int i = 20; i < dividendoDecenas; i ++){       
                image(Img10, 400+ (i-20) * ancho * 1.1 * 0.5, 10 , ancho * 0.5 , ancho * 0.5 * 600/328);            
              }
            }
            else{
              if (dividendoDecenas < 60){
                for(int i = 0; i < 30; i ++){       
                  image(Img10, 400+ i * ancho *0.3 * 1.3, 10  , ancho * 0.3, ancho * 0.3 *600/328);            
                }
                for(int i = 30; i < dividendoDecenas; i ++){       
                  image(Img10, 400+ (i-30) * ancho * 1.3 * 0.3, 10 + ancho * 600/328 *1.3 * 0.3 , ancho * 0.3 , ancho * 0.3 * 600/328);            
                }
              }
              else{
                for(int i = 0; i < 30; i ++){       
                  image(Img10, 400+ i * ancho *0.3 * 1.3, 10  , ancho * 0.3, ancho * 0.3 *600/328);            
                }
                for(int i = 30; i < 60; i ++){       
                  image(Img10, 400+ (i-30) * ancho * 1.3 * 0.3, 10 + ancho * 600/328 *1.3 * 0.3 , ancho * 0.3 , ancho * 0.3 * 600/328);            
                }
                for(int i = 60; i < dividendoDecenas; i ++){       
                  image(Img10, 400+ (i-60) * ancho * 1.3 * 0.3, 10 + ancho * 600/328 *1.3 *0.6 , ancho * 0.3 , ancho * 0.3 * 600/328);
                } 
              }              
            }           
          }
        } 
        
          for(int i = 0; i < dividendoUnidades; i ++){
            image(Img1, 500+ i * ancho * 1.1, 10 + 2 * ancho * 600/328 *1.1 , ancho  *0.5, ancho * 0.5);
          }
          /*if (cocienteCentenas > 0){
            for (int i = 0; i < divisor; i++){
              for (int j = 0; j < cocienteCentenas; j++){
                image(Img100, 100 + anchoBart  * i * 1.1, 600 - (j+1) * ancho * 600/328 * 0.6, ancho * 0.5, ancho * 0.5 * 600/328);  
              }       
            }
          }*/
      reparte();
      dibujaBart();
      break;
    case 4://DIVIDIMOS DECENAS
    
    text(str(dividendo), 300, 30);
    text(str(divisor), 340, 30);
    text("PASAMOS EL RESTO DE DECENAS A UNIDADES", 30, 200);
        if (nueva4){
          cocienteDecenas = int(dividendoDecenas/divisor);
          dividendoDecenas = dividendoDecenas - cocienteDecenas * divisor;
          nueva4 = false;
        }
        
        //DIBUJA DINERO DIVIDENDO
        
          for(int i = 0; i < dividendoDecenas; i ++){ 
                   
              image(Img10, 500+ i * ancho * 1.1, 10 + ancho * 600/328 *1.1 , ancho, ancho * 600/328);            
          }
         
        
          for(int i = 0; i < dividendoUnidades; i ++){
            image(Img1, 500+ i * ancho * 1.1, 10 + 2 * ancho * 600/328 *1.1 , ancho  *0.5, ancho * 0.5);
          }
          /*if (cocienteCentenas > 0){
            for (int i = 0; i < divisor; i++){
              for (int j = 0; j < cocienteCentenas; j++){
                image(Img100, 100 + anchoBart  * i * 1.1, 600 - (j+1) * ancho * 600/328 * 0.6, ancho * 0.5, ancho * 0.5 * 600/328);  
              }       
            }
          }*/
          //dibujaBart();    
    reparte();
    dibujaBart();
    break;
  case 5:
      text(str(dividendo), 300, 30);
      text(str(divisor), 340, 30);
      text("DIVIDIMOS UNIDADES", 30, 200);
        if (nueva5){        
          dividendoUnidades = dividendoUnidades + 10 * dividendoDecenas;
          dividendoDecenas = 0;
          nueva5 = false;
        }
        
        //DIBUJA DINERO DIVIDENDO
        
        if (dividendoUnidades < 10){
          for(int i = 0; i < dividendoUnidades; i ++){       
              image(Img1, 500+ i * ancho * 1.1, 10 + ancho * 600/328 *1.1 , ancho, ancho * 600/328);            
          }
        }
        else{
          if(dividendoUnidades < 20){
            for(int i = 0; i < 10; i ++){       
              image(Img1, 400+ i * ancho * 1.1, 10 + ancho * 600/328 *1.1 , ancho, ancho * 600/328);            
            }
            for(int i = 10; i < dividendoUnidades; i ++){       
              image(Img1, 400+ (i - 10) * ancho * 1.1, 10 , ancho, ancho * 600/328);            
            }
          }
          else{
            if (dividendoUnidades < 40){
              for(int i = 0; i < 20; i ++){       
                image(Img1, 400+ i * ancho *0.5 * 1.1, 10 + ancho * 600/328 *1.1 * 0.5 , ancho * 0.5, ancho * 0.5 *600/328);            
              }
              for(int i = 20; i < dividendoUnidades; i ++){       
                image(Img1, 400+ (i-20) * ancho * 1.1 * 0.5, 10 , ancho * 0.5 , ancho * 0.5 * 600/328);            
              }
            }
            else{
              if (dividendoUnidades < 60){
                for(int i = 0; i < 30; i ++){       
                  image(Img1, 400+ i * ancho *0.3 * 1.3, 10  , ancho * 0.3, ancho * 0.3 *600/328);            
                }
                for(int i = 30; i < dividendoUnidades; i ++){       
                  image(Img1, 400+ (i-30) * ancho * 1.3 * 0.3, 10 + ancho * 600/328 *1.3 * 0.3 , ancho * 0.3 , ancho * 0.3 * 600/328);            
                }
              }
              else{
                for(int i = 0; i < 30; i ++){       
                  image(Img1, 400+ i * ancho *0.3 * 1.3, 10  , ancho * 0.3, ancho * 0.3 *600/328);            
                }
                for(int i = 30; i < 60; i ++){       
                  image(Img1, 400+ (i-30) * ancho * 1.3 * 0.3, 10 + ancho * 600/328 *1.3 * 0.3 , ancho * 0.3 , ancho * 0.3 * 600/328);            
                }
                for(int i = 60; i < dividendoUnidades; i ++){       
                  image(Img1, 400+ (i-60) * ancho * 1.3 * 0.3, 10 + ancho * 600/328 *1.3 *0.6 , ancho * 0.3 , ancho * 0.3 * 600/328);
                } 
              }              
            }           
          }
        }
  reparte();        
  dibujaBart();     
  break;
  case 6:
  if ( nueva6){
    cocienteUnidades = int (dividendoUnidades/divisor);
    dividendoUnidades = dividendoUnidades - cocienteUnidades * divisor;
    nueva6 = false;
  }
  dibujaResto();
  reparte();        
  dibujaBart();
  break;
    
  }  
}
void mouseClicked(){
  //START
  if ((abs(mouseX - 30)<50) && (abs(mouseY - 30)<50)){
    cocienteCentenas = 0;
    cocienteDecenas = 0;
    cocienteCentenas = 0;
    cocienteUnidades = 0;
    nueva2 = true;
    nueva = true;
    nueva3 = true;
    nueva4 = true;
    nueva5 = true;
    nueva6 = true;
    paso = 1;
    cocienteDecenas = 0;
  }
  //SEGUIR
  if((abs(mouseX - 160) < 60) && (abs(mouseY - 30)<50)){
    paso++;
  }
}
void dibujaBart(){
  for(int i = 0; i< divisor; i++){
        image(ImgBart, 100 + anchoBart  * i * 1.1, 600, anchoBart, anchoBart *12/8);
  }
}

void dibujaDividendo(){
  for(int i = 0; i < dividendoCentenas; i ++){
          image(Img100, 500+ i * ancho * 1.1, 10, ancho, ancho * 600/328);
        }
        for(int i = 0; i < dividendoDecenas; i ++){
          image(Img10, 500+ i * ancho * 1.1, 10 + ancho * 600/328 *1.1 , ancho, ancho * 600/328);
        }
        for(int i = 0; i < dividendoUnidades; i ++){
          image(Img1, 500+ i * ancho * 0.6, 10 + 2 * ancho * 600/328 *1.1 , ancho  *0.5, ancho * 0.5);
        }
}
void reparte(){
  if (cocienteCentenas > 0){
    for (int i = 0; i < divisor; i++){
      for (int j = 0; j < cocienteCentenas; j++){
        image(Img100, 100 + anchoBart  * i * 1.1, 600 - (j+1) * ancho*0.4*1.8 * 600/328 * 0.6, ancho * 0.4, ancho * 0.4 * 600/328);  
      }       
    }
  }
  if (cocienteDecenas > 0){      
    for (int i = 0; i < divisor; i++){
      for (int j = 0; j < cocienteDecenas; j++){
        image(Img10, 100+ ancho * 0.4 + 2 + anchoBart  * i * 1.1, 600 - (j+1) * ancho*0.4*1.8 * 600/328 * 0.6, ancho * 0.4, ancho * 0.4 * 600/328);  
      }       
    }
  }
  if (cocienteUnidades > 0){      
    for (int i = 0; i < divisor; i++){
      for (int j = 0; j < cocienteUnidades; j++){
        image(Img1, 100+ ancho * 0.4 *2 + 2 + anchoBart  * i * 1.1, 600 - (j+1) * ancho*0.4*1.8 * 600/328 * 0.6, ancho * 0.4, ancho * 0.4 * 600/328);  
      }       
    }
  }
  
}
void dibujaResto(){
  for(int i = 0; i < dividendoUnidades; i ++){
    image(Img1, 500+ i * ancho * 0.6, 100  , ancho  *0.5, ancho * 0.5);
  }
}


