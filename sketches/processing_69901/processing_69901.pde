
      
      
      

int letra=65, pos=10, col=10;
void setup(){  
  size(1400,300);  
  background(0);  
  frameRate(10); 

}  
void draw(){  
      PFont tipo_letra1;
     tipo_letra1=createFont("LucidaBright",1);
     //tipo_letra1=loadFont("LucidaBright-48.vlw");  
     PFont tipo_letra2;
     //tipo_letra2=createFont("Kalinga",1);  
     tipo_letra2=loadFont("Kokila-Italic-48.vlw");

  
     fill(100,0, col+=10);  
     
    if(letra<=90){
      textFont(tipo_letra1, 32);
      pos+=50;
      text(char(letra++),pos,100);  
    }
    
    else if(letra==91){
     pos=10;
      letra=97;
      col=10;
    }
    
    else if (letra<=122){
           fill(0,col+=10, 100); 
      textFont(tipo_letra2, 32);
      pos+=50;
      text(char(letra++),pos,200);  
    }
      
      else {
        background(0);
     pos=10;
      letra=65;
        col=10;
    }
      

}  
