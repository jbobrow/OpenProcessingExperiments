
/* @pjs preload="resumen2.txt"; */

String[] stuff = loadStrings("resumen2.txt");
String[] cx;
String[] cy;
String gprmc= "$GPRMC";
String gpgga= "$GPGGA";
// Variables necesarias para dibujar el objeto
int ancho   = 800;
int alto    = 600;
float X     = 0;
float Y     = 0;
float X2    = 0;
float Y2    = 0;
// Variables necesarias para trasladar el objeto
int despx   = 0;
int despy   = 0;
int difx    = 0;
int dify    = 0; 
int dispx   = 0; 
int dispy   = 0;  
int actualx = 0;
int actualy = 0;
// Variables necesarias para hacer Zoom
float count = 0;
float zoom  = 0;
// Variables necesarias para filtrar lineas 
boolean wc = true;
float X3    = 0;
float Y3    = 0;
float filtro= 4000;  // 4000
// Variables de texto 
float kilometraje_final;
float kilometraje = 0;
// Variables para dibujar puntos
int speed= 1; 
float pX = 0;
float pY = 0;
int j    = 0;
// Variable para obtener tiempo en pantalla
String tiempo;

void setup() {
  size(ancho,alto,P3D);
}

void draw() {
  background(0);
  stroke(255,255,255);
  strokeWeight(2);
  texto();
  translate(dispx,dispy);
  zoom = count*2000;
  if(wc)dibujar_ruta(-33090000 - zoom ,  -70450000 + zoom , -33330000 + zoom , -70210000 - zoom, filtro);
  j = dibujar_punto(-33090000 - zoom ,  -70450000 + zoom , -33330000 + zoom , -70210000 - zoom, j);
}

int dibujar_punto(float x1, float y1, float x2, float y2, int i){

    String[] data = split(stuff[i],','); 

    if(data[0].equals("$GPRMC") && data.length == 13){                // Extraer coordenadas del string GPRMC
         cx = split(data[3],'.');
         cy = split(data[5],'.');
         tiempo = data[1];
         
         if(cx.length > 1 && cy.length >1){                             // Convertir coordenadas del string a un entero
            pX = (int(cx[0])*10000 + int(cx[1])) * -1; 
            pY = (int(cy[0])*10000 + int(cy[1])) * -1;
         }
         pX = map(pX,x1,x2,0,ancho);
         pY = map(pY,y1,y2,0,alto) ;
         noStroke();  
         fill(0,0,255);
         ellipse(pY,pX,10,10);
      }
    if(data[0].equals("$GPGGA") && data.length == 15){                // Extraer coordenadas del string GPGGA
         cx = split(data[2],'.');
         cy = split(data[4],'.');
         tiempo = data[1];
         
         if(cx.length > 1 && cy.length >1){                               // Convertir coordenadas del string a un entero
            pX = (int(cx[0])*10000 + int(cx[1])) * -1; 
            pY = (int(cy[0])*10000 + int(cy[1])) * -1;
         }
         pX = map(pX,x1,x2,0,ancho);
         pY = map(pY,y1,y2,0,alto) ;
         noStroke();  
         fill(0,0,255);
         ellipse(pY,pX,10,10);               
      }  
      
     
     i = i + speed;
     if(i >= stuff.length) i = 0;
     
     return i;
  
}

void dibujar_ruta(float x1, float y1, float x2, float y2, float filtro){
    
  for (int i = 0; i < stuff.length; i++) { 
    
      X2 = X;
      Y2 = Y;    
    
      String[] data = split(stuff[i],',');  
    
      if(data[0].equals("$GPRMC") && data.length == 13){                // Extraer coordenadas del string GPRMC
         cx = split(data[3],'.');
         cy = split(data[5],'.');
         
         if(cx.length > 1 && cy.length >1){                             // Convertir coordenadas del string a un entero
            X = (int(cx[0])*10000 + int(cx[1])) * -1; 
            Y = (int(cy[0])*10000 + int(cy[1])) * -1;
         }
         
         boolean largo_maximo = modulo(X,Y,X3,Y3,filtro);
         if(largo_maximo) kilometraje = kilometraje + sqrt((X3-X)*(X3-X)+(Y3-Y)*(Y3-Y)); 
         X3 = X;
         Y3 = Y;
         X = map(X,x1,x2,0,ancho);
         Y = map(Y,y1,y2,0,alto) ;
         if(largo_maximo)line(Y,X,Y2,X2);
       
      }    
      
        if(data[0].equals("$GPGGA") && data.length == 15){                // Extraer coordenadas del string GPGGA
         cx = split(data[2],'.');
         cy = split(data[4],'.');
         
         if(cx.length > 1 && cy.length >1){                               // Convertir coordenadas del string a un entero
            X = (int(cx[0])*10000 + int(cx[1])) * -1; 
            Y = (int(cy[0])*10000 + int(cy[1])) * -1;
         }
         
         boolean largo_maximo = modulo(X,Y,X3,Y3,filtro);
         if(largo_maximo) kilometraje = kilometraje + sqrt((X3-X)*(X3-X)+(Y3-Y)*(Y3-Y)); 
         X3 = X;
         Y3 = Y;
         X = map(X,x1,x2,0,ancho);
         Y = map(Y,y1,y2,0,alto) ;
         if(largo_maximo)line(Y,X,Y2,X2);
       
      }  
   }
 
 kilometraje_final = kilometraje * 60 * 30.82/10000000; 
 kilometraje = 0;  
}


void mouseDragged() {
     difx    = mouseX - actualx;
     dify    = mouseY - actualy; 
     dispx   = dispx + difx; 
     dispy   = dispy + dify;  
     actualx = mouseX;
     actualy = mouseY;    
}

void mousePressed(){
     actualx = mouseX;
     actualy = mouseY;
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  count = count - e;
  if(count >= 56) count = 56;
  if(count <=-66) count = -66;
}

 boolean modulo(float X1, float Y1, float X2, float Y2, float filtro){
   float longitud = sqrt((X2-X1)*(X2-X1) + (Y2-Y1)*(Y2-Y1));
   if (longitud >= filtro) return false;
   else return true;
}

void texto(){
    fill(255,255,255);
    text("Hora: " + tiempo,10, 570);
    text("Usuarios: 14",10, 580);  
    text("Km Recorridos:", 10, 590);
    text(str(int(kilometraje_final)), 105 , 590);
    text("Instrucciones",680, 530);
    text("Cursor: Arrastar",    680, 560);
    text("Zoom:  Mouse Wheel", 680, 570);
    text("z: Zoom Out", 680, 580);
    text("x: Zoom In",  680, 590);
}

void keyPressed(){
  if(key == '0') speed = 0;
  if(key == '1') speed = 1; 
  if(key == '2') speed = 4;
  if(key == '3') speed = 8;
  if(key == '4') speed = 16;
  if(key == '5') speed = 32;
  if(key == 'w')  wc = false; 
  if(key == 'q')  wc = true;  
  if(key == 'r'){ dispx=0; dispy=0; count = 0;}
  if(key == 'x')  count = count + 1;
  if(key == 'z')  count = count - 1;
  if(count >= 56) count = 56;
  if(count <=-66) count = -66;
}
