
int    ascii=65; 
int    Tamx=800,Tamy=400;
int    coorx=0,coory=Tamy/2;
int    tam=32,tiempo=0;
int    velocidad=12;
float  tam_carac;
char   caracter;

void setup()
{
 size(Tamx,Tamy);
 background(0);
 frameRate(velocidad);
} 

void draw()
{ 
 PFont tipo_letra1,tipo_letra2;        //declaramos tipo de variable tipo letra
 tipo_letra1=loadFont("SansSerif.bolditalic-48.vlw"); //cargamos el tipo de letra en la variable
 tipo_letra2=loadFont("LMRoman9-Italic-48.vlw");  //cargamos el tipo de letra en la variable
 
 if(ascii<91)
   {
    textFont(tipo_letra1,tam);  //damos tamaño al tipo de la letra   
    caracter=char(ascii);      //cambiamos el ascii a caracter
    tam_carac=textWidth(caracter);  //obtenemos el tamaño del caracter
    text(caracter,coorx,coory-40);               //desplegamos el texto que queremos en la posicion deseada    
   }
 
 if(ascii==91)
    {
      coorx=0;
      ascii=96;
    }
 
 if(ascii>96 && ascii<123)
   {
    textFont(tipo_letra2,tam); //damos tamaño al tipo de la letra   
    caracter=char(ascii);
    tam_carac=textWidth(caracter);   
    text(caracter,coorx,coory+40);
   }  
   
 ascii++;  
 coorx=int(coorx+tam_carac); 
 
 if(ascii==130)
   {
     coorx=0;
     ascii=65;
     background(0);
   }

}

