
import processing.video.*; //importa librería de video
Capture fideo; //captura el video


void setup() {
  size(800,600);
  fideo = new Capture(this,800,600,30);//(este video,ancho,alto,frameRate)
  smooth();
}
    
void draw() {
  
  color colCursor; //genera una variable de color
  colCursor=get(mouseX,mouseY); //recoge el color del puntero del ratón
background(colCursor); //asigna el color de la variable al fondo
  
 fideo.read(); //lee la captura de la cámara

  for (int a = 0; a < 266; a++) {//genera bucle horizontal de escaneo pixel
     for (int b = 0; b <200; b++){//genera bucle vertical de escaneo pixel
      color c=fideo.pixels[a+b*fideo.width]; //crea variable color con escanmeo
     if (mouseX>=0 & mouseX<=266 & mouseY >=0 & mouseY <=200
     & mousePressed==true){ //condiciona la creación del rect a la zona donde
    // se encuentra el raton y si su boton está presionado
      fill(c); //asigna el color de la variable al pixel a dibujar
      noStroke(); //quita el contorno de los pixels
      rect(a,b,1,1);}}} //contruye un rectángulo con los pixels
      
       for (int d = 267; d < 532; d++) {
     for (int e = 0; e <200; e++){
     color f=fideo.pixels[d+e*fideo.width];
     if (mouseX>=267 & mouseX<=532 & mouseY >=0 & mouseY <=200
     & mousePressed==true){
     fill(f);
      noStroke();
      rect(d,e,1,1);}}}
 
   for (int a = 533; a < 800; a++) {
     for (int b = 0; b <200; b++){
     color c=fideo.pixels[a+b*fideo.width];
     if (mouseX>=533 & mouseX<=800 & mouseY >=0 & mouseY <=200
     & mousePressed==true){ 
     fill(c);
      noStroke();
      rect(a,b,1,1);}}}
      
      
       for (int d = 0; d < 266; d++) {
     for (int e = 201; e <400; e++){
     color f=fideo.pixels[d+e*fideo.width];
     if (mouseX>=0 & mouseX<=266 & mouseY >=201 & mouseY <=400
     & mousePressed==true){
     fill(f);
      noStroke();
      rect(d,e,1,1);}}}
      
         for (int d = 267; d < 532; d++) {
     for (int e = 201; e <400; e++){
     color f=fideo.pixels[d+e*fideo.width];
     if (mouseX>=267 & mouseX<=532 & mouseY >=201 & mouseY <=400
     & mousePressed==true){
     fill(f);
      noStroke();
      rect(d,e,1,1);}}}
          
           for (int d = 533; d < 800; d++) {
     for (int e = 201; e <400; e++){
     color f=fideo.pixels[d+e*fideo.width];
     if (mouseX>=533 & mouseX<=800 & mouseY >=201 & mouseY <=400
     & mousePressed==true){
     fill(f);
      noStroke();
      rect(d,e,1,1);}}}
      
             for (int d = 0; d < 266; d++) {
     for (int e = 401; e <600; e++){
     color f=fideo.pixels[d+e*fideo.width];
     if (mouseX>=0 & mouseX<=266 & mouseY >=401 & mouseY <=600
     & mousePressed==true){
     fill(f);
      noStroke();
      rect(d,e,1,1);}}}
      
                   for (int d = 267; d < 532; d++) {
     for (int e = 401; e <600; e++){
     color f=fideo.pixels[d+e*fideo.width];
     if (mouseX>=267 & mouseX<=532 & mouseY >=401 & mouseY <=600
     & mousePressed==true){
     fill(f);
      noStroke();
      rect(d,e,1,1);}}}
      
                   for (int d = 533; d < 800; d++) {
     for (int e = 401; e <600; e++){
     color f=fideo.pixels[d+e*fideo.width];
     if (mouseX>=533 & mouseX<=800 & mouseY >=401 & mouseY <=600
     & mousePressed==true){
     fill(f);
      noStroke();
      rect(d,e,1,1);}}}
 
 
}


  
  
     

  

