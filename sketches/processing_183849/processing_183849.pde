
/* @pjs font="Ubuntu-R.ttf, ubuntu-L.ttf"; 
preload="ub1.png,ub2.png,ub3.png"; 
 */

//Variables
PFont fuente;
int pantalla = 1;
PImage[] fondo  = new PImage[3];
Botones[] boton = new Botones[3];
Input entrada;
String hours, minutes;
boolean isPing = false;
int icmp = new int[24];
int ttl = new int[24];
int ms = new int[24];
int textLenght = 25;

void setup(){
 
 //Tamaño
 size(690,439);
 
 //Cargamos los fondos
 fondo[0] = loadImage("ub1.png");
 fondo[1] = loadImage("ub2.png");
 fondo[2] = loadImage("ub3.png");
 
 //Cargamos los botones
 boton[0] = new Botones(6,28,53,53,2);
 boton[1] = new Botones(135,140,60,50,3);
 boton[2] = new Botones(6,3,15,16,1);
 
 //Cargamos las fuentes
 fuenteR = loadFont("Ubuntu-R.ttf");
 fuente = loadFont("Ubuntu-L.ttf");
 
 //Creamos el input
 entrada = new Input();

  //Establecemos valores random para cada respuesta del ping
  for(int j = 0; j < 24; j++){
    
    icmp[j] = (int)random(1,8);
    ttl[j] = (int)random(30,90);
    ms[j] = (int)random(20,130);
    
  }
  
}

void draw(){
  
    //Hora del sistema, añadimos un 0 cuando sea menor de 10
    minutes = minute() <= 9 ? "0"+str(minute()) : str(minute());
    hours = hour() <= 9 ? "0"+str(hour()) : str(hour()); 
 
   //Pantallas 1 = Escritorio, 2 = Menu, 3 = Terminal
   switch(pantalla){
  
    case 1: escritorio(); break;
    case 2: menu(); break;
    case 3: terminal(); break;
 
   }  
  
}

//Funcion para escribir, detectar enter y suprimir
void keyReleased(){
 if (keyCode == ENTER || keyCode == RETURN) {
   
   //Al pulsar enter.. si.. la palabra cortada[0] es ping, ejecutamos el gatillo "isPing";
   String[] returnedText = split(entrada.getText(),' ');
   if(returnedText[0].toLowerCase() == "ping"){
     isPing = true;
   } else {
       //En caso contrario, limpiamos el input
      entrada.clean(); 
   }
   
    
 }else if(keyCode == DELETE){
   //Si pulsamos la tecla suprimir, borramos un carácter
    entrada.eraser();
  } else if (key != CODED){
     
     // Al pulsar cualquier otra tecla, si no supera el tamaño máximo, concatenamos el texto
      if(entrada.getSize() < textLenght){
      entrada.addText(key);
      }
      
  } 

  
}  



class Botones{
  
  int posX, posY, sizeX, sizeY, go;
  
  Botones(){
    
    posX = 30;
    posY = 30;
    sizeX = 30;
    sizeY = 30;
    go = 2;
    
  }
  
  Botones(int px, int py, int sx, int sy, int g){
    
    posX = px;
    posY = py;
    sizeX = sx;
    sizeY = sy;
    go = g;
    
  }
  
  void button(){
    
 
     
      if(mousePressed){
       
         if(mouseX > posX && mouseX < (posX+sizeX) && mouseY > posY && mouseY < (posY+sizeY)){
         
           pantalla = go;
           
         } 
        
      }
      
    
  }
  
  
}
class Input{
  
  int posX, posY, size, sizeX, sizeY, ventana;
  String textin;
  float tw;
 
 //Como solo hay un input, uso directamente el constructor por defecto
 Input(){
  
   posX = 205;
   posY = 43;
   size = 16;
   sizeX = 300;
   sizeY = 30;
   textin = ""; 
   tw = textWidth(textin);
   ventana = 3;
 } 
  

  //Función para mostrasr el input
  void show(){
  
      text(textin,posX,posY);
       
      //Mostrar el rectángulo cada 0.5 segundos mientras que no se esté haciendo ping
      if( (floor((millis()/500)%60))%2 == 0 && !isPing){
      noStroke(); 
      rect(  textWidth(textin) + posX +2  ,posY-15,8,20);
      }
  
  }
  
  //Función para añadir nuevas letras
  void addText(char ks){
      if(ventana == pantalla && !isPing){
       textin = textin.concat(new String(ks));       
      }
  }
  
  //Función para eliminar una letra
  void eraser(){
    if(pantalla == ventana && !isPing){
    textin = textin.substring(0,max(0,textin.length()-1));
    }
    
  }
  
  //Función para vaciar el input
  void clean(){
    textin = "";
  }
  
  //Función para obener el texto
  String getText(){
    return textin;
  }
  
  //Función para obtener el tamaño del texto
  int getSize(){
    return textin.length;
  }
  
  
}
void escritorio(){
  
  //Pantalla de escritorio
  
  image(fondo[0],0,0);
  boton[0].button();
  
   //TIME//
  textFont(fuente,13);
  fill(220);
  text(hours+":"+minutes,620, 16);
  
  
}
void menu(){
  
  //Pantalla menu
  image(fondo[1],0,0);
   boton[1].button();
   boton[2].button();
   
  //TIME//
  textFont(fuente,13);
  fill(255);

  text(hours+":"+minutes,620, 16);
  
}
String texte = "sergio@ubuntu:~$";
int newMillis = millis();
int lineNumber = 0;
String textDest;

void terminal(){
  
  image(fondo[2],0,0);
  boton[0].button();
  
  //TIME//
  textFont(fuente,13);
  fill(220);
  text(hours+":"+minutes,620, 18);
  
  //Mostramos el mensaje por defecto del terminal de Ubuntu
  textFont(fuenteR,15);
  fill(255);
  text(texte, 70, 43); 
  
  //Mostramos el input
  entrada.show();
  
  //Obtenemos el destino del ping, con SPLIT
  String[] c = split(entrada.getText(),' ');
  textDest = c[1];
  
  //Si se está haciendo ping...
  if(isPing){
    
        //Augmentamos cada segundo una lineNumber para añadir una nueva línea de pìng
        if(newMillis < millis() && lineNumber < 24){ 
            newMillis = millis()+1000;
            lineNumber ++;
        }    
        
        //Recorremos el total de lineas de ping.
        for(int i = 0; i < lineNumber; i++){
          text("64  bytes  from "+textDest+":  icmp_seq="+icmp[i]+"  ttl="+ttl[i]+ "  time=" +ms[i] + " ms", 70, i*17+61);
                 
        }
   
  }
  
}


