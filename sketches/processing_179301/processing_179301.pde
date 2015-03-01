
String[] stuff = loadStrings("resumen.txt");
int xe = 0;
int ye = 0;
int xd = 0;
int yd = 0;
String[] cx;
String[] cy;
String gprmc= "$GPRMC";
String gpgga= "$GPGGA";
int ancho = 800;
int largo = 600;
int centrox = ancho/2;
int centroy = largo/2;
int divisor = 10;
int multi = 1;
float sval = 1.0;
float nmx, nmy;
int x = 0;
int speed = 1;
int escala = 0;
boolean hacer_linea;
int filtro = 20;
int actualx = 0;
int actualy = 0;
int difx = 0;
int dify = 0;

void setup() {
  size(ancho,largo,P3D);
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Inicio del loop

void draw() {
  
  background(0);
  texto();
  stroke(255,255,255);
  strokeWeight(4);
  translate(width/2, height/2);
  float zoom = map(escala, 0, width, 0.1, 4.5);
  scale(zoom);
  dibujar_ruta();
  
  int X=0;
  int Y=0;
  int x = centrox;
  int y = centroy;
 
   
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// Termino del loop

void keyPressed(){
  if(key == CODED){
  if(keyCode == UP)   centrox = centrox + 50;
  if(keyCode == DOWN) centrox = centrox - 50;
  if(keyCode == RIGHT)centroy = centroy - 50;
  if(keyCode == LEFT) centroy = centroy + 50;
  }
  if(key == 'x')  escala = escala + 2;
  if(key == 'z')  escala = escala - 2;
  if(escala < 0)   escala = 0;
}




void dibujar_ruta(){

  int X=0;
  int Y=0;
  int x = centrox;
  int y = centroy;
  boolean inicio = true;
  
  for (int i = 0; i < stuff.length; i++) {    
      String[] data = split(stuff[i],',');     
      if(data[0].equals("$GPRMC") && data.length == 13){                // Si la coordenada viene en GPRMC
         cx = split(data[3],'.');
         cy = split(data[5],'.');
         
         if(cx.length > 1 && cy.length >1){       
         xe = int(cx[0]);
         xd = int(cx[1]);      
         ye = int(cy[0]);
         yd = int(cy[1]);          
         if(!inicio){
         int difx = X - (xe*10000 + xd);
         int dify = Y - (ye*10000 + yd); 
         X =  xe*10000 + xd;      
         Y =  ye*10000 + yd;                                          
         hacer_linea = modulo(y, x , y + dify*multi/divisor , x - difx*multi/divisor, filtro);
         if(hacer_linea) line(y, x , y + dify*multi/divisor , x - difx*multi/divisor);  // CUIDADO: la coordenada x e y están cambiadas
         x = x - difx*multi/divisor;                                    // CUIDADO: el plano se define hacia abajo positivamente (eje y)
         y = y + dify*multi/divisor;       
           }
         } 
         if(inicio){
         X =  xe*10000 + xd;      
         Y =  ye*10000 + yd;
         inicio = false;
         }       
   }
       if(data[0].equals("$GPGGA") && data.length == 15){                // Si la coordenada viene en GPGGA
         cx = split(data[2],'.');
         cy = split(data[4],'.');
         if(cx.length > 1 && cy.length >1){
         if(!inicio){
         int difx = X - (xe*10000 + xd);
         int dify = Y - (ye*10000 + yd); 
         X =  xe*10000 + xd;      
         Y =  ye*10000 + yd;  
         hacer_linea = modulo(y, x , y + dify*multi/divisor , x - difx*multi/divisor, filtro);
         if(hacer_linea) line(y, x , y + dify*multi/divisor , x - difx*multi/divisor);  // CUIDADO: la coordenada x e y están cambiadas


         x = x - difx*multi/divisor;
         y = y + dify*multi/divisor;       
           }
         } 
         if(inicio){
         X =  xe*10000 + xd;      
         Y =  ye*10000 + yd;
         inicio = false;
        }   
     }  
  }
}


boolean modulo(int x1,int y1,int x2,int y2, int filtro){  // util para filtrar lineas con un largo mayor a variable filtro
  boolean respuesta = false ;
  if( abs(y2-y1)  > filtro  )  respuesta = false;   
  if( abs(y2-y1)  <= filtro )  respuesta = true;   
  return respuesta;
}


void mouseDragged() {
     difx    = mouseX - actualx;
     dify    = mouseY - actualy; 
     centroy = centroy + difx*2; 
     centrox = centrox + dify*2;  
     actualx = mouseX;
     actualy = mouseY;
    
     
}

void mousePressed(){
     actualx = mouseX;
     actualy = mouseY;
}

void texto(){
    fill(255,255,255);
    text("Usuarios: 14",10, 580);  
    text("Km Totales: 120", 10, 590);
    text("Instrucciones",700, 540);
    text("Arrastar",    700, 570);
    text("z: Zoom Out", 700, 580);
    text("z: Zoom In",  700, 590);
}

