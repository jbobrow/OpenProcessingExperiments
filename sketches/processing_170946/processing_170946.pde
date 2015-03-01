
//seccion OJOSSS derechos
PImage oj1;
PImage oj2;
PImage oj3;
PImage oj4;
PImage oj5;
PImage oj6;
PImage oj7;
PImage oj8;
PImage oj9;
PImage oj10;
PImage oj11;
PImage oj12;
PImage oj13;
PImage oj14;
PImage oj15;
PImage oj16;
PImage oj17;
PImage oj18;
PImage oj19;
PImage oj20;
PImage oj21;
PImage oj22;
PImage oj23;
PImage oj24;
PImage oj25;
//TERMINA OJOOOOS DEREEECHOS


// ejemplo
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
//Termina ejemplo

void setup() {
    size(700,700);
    
    
  //LOADIMAGE   OJOS DERECHOS********///////**********
  oj1 = loadImage("1544600_10202542911207662_924162482_n-001.jpg");
  oj2 = loadImage("c.jpg");
  oj3 = loadImage("df.jpg");
  oj4 = loadImage("d.jpg");
  oj5 = loadImage("dd.jpg");  
  oj6 = loadImage(".jpg");
  oj7 = loadImage(".jpg");
  oj8 = loadImage(".jpg");
  oj9 = loadImage(".jpg");
  oj10 = loadImage(".jpg");
  oj11 = loadImage(".jpg");
  oj12 = loadImage(".jpg");
  oj13 = loadImage(".jpg");
  oj14 = loadImage(".jpg");
  oj15 = loadImage(".jpg");
  oj16 = loadImage(".jpg");
  oj17 = loadImage(".jpg");
  oj18 = loadImage(".jpg");
  oj19 = loadImage(".jpg");
  oj20 = loadImage(".jpg");
  oj21 = loadImage(".jpg");
  oj22 = loadImage(".jpg");
  oj23 = loadImage(".jpg");
  oj24 = loadImage(".jpg");
  oj25 = loadImage(".jpg");
  
  //EJEMPLOOOO LOAD IMAGE
  img1 = loadImage("df.jpg");
  img2 = loadImage("1544600_10202542911207662_924162482_n-001.jpg");
  img3 = loadImage("DSC02110cc-001.jpg");
  img4 = loadImage("DSC02134(2)-001.JPG");
  img5 = loadImage("1623772_10202542910687649_795057151_n-001.jpg");
  img6 = loadImage("la foto 1-001.JPG");
  img7 = loadImage("s n-001.jpg");
//tERMINA EJEMPLO LOAD IMAGE


}
void draw() {
  //Punto de referencia CENTRO ENTRE CEJA Y CEJA, OJO Y OJO
  imageMode(CENTER);
    image(img1, 368,325,height, width);
   ellipse(height/2,width/2,35,35);
   //Termina punto referencia ELLIPSE ENTRE CEJA Y CEJA
   
   //OJOSSSS DERECHOS*****SECCION DRAWW""!!$$$%%%%%%%%%%%
   if (mouseY< height*20/25){ 
    imageMode(CENTER);
    image(oj1, height*5/8, width/2,145,71);
   }
     if (mouseY< height*16/25){
    imageMode(CENTER);
    image(oj2, height*5/8, width/2,145,71);
   }
    if (mouseY< height*8/25){ 
    imageMode(CENTER);
    image(oj3, height*5/8, width/2,145,71);
   }
    if (mouseY< height*4/25){
    imageMode(CENTER);
    image(oj4, height*5/8, width/2,145,71);
   }
    if (mouseY< height*2/25){ 
    imageMode(CENTER);
    image(oj5, height*5/8, width/2,145,71);
   }
    
 //TERMINA OJOSSSS DERECHO*****SECCION DRAWW""!!$$$%%%%%%%%%%%
     
     //EJEMPLOOOO SECCIONES DEL ROSTROOOO
      if (mouseY< height*3/7) {   
   //CEJA izquierdo 
    imageMode(CENTER);
    image(img6, height*3/8, (width/2)-40,82*2,25*2);
      }
      if (mouseY< height*3/7) {   
   //CEJA DERECHA 
    imageMode(CENTER);
    image(img7, height*5/8, (width/2)-40,93*1.8,25*1.8);
      }
     
      if (mouseY< height*3/7) {   
   //OJO izquierdo 
    imageMode(CENTER);
    image(img4, height*3/8, width/2,145,71);
      }
      
       if (mouseY< height*2/5){
      
     //boca
    imageMode(CENTER);
    image(img3, height/2, (width*7/9)-20,570/3,226/3);
       }
       
       if (mouseY< height*4/6){ 
       //nariz
    imageMode(CENTER);
    image(img5, height/2, width*5/8,97*1.3,87*1.3);
    //TERMINA EJEMPLOO SECCIONES DEL ROSTRO
    
}}


