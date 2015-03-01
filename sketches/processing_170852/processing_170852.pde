
void setup(){
  size(800,500);
  //TEXTO
  print("Pulsa 1 y 2 para cambiar entre fuego y Kamehameha, este ultimo aumentara de poder si das clicks.");
}

//Definir Variables
float activarFuego  = 9999;
float activarKame   = 9999;
float aumentoKame   = 0;

void draw(){
    background(255,255,255);
  
    //Figura
    //BULTOS CABEZA
    noStroke();
    fill      (25,150,70);
    ellipse   (20,270,100,100);
    ellipse   (100,200,155,125);
    ellipse   (150,140,125,125);
    ellipse   (250,150,125,125);
    
    //BOCA
    triangle  (370,170,300,170,300,145);
    rect      (100,170,300,170);
    fill      (255,255,255);
    ellipse   (350,280,150,60);
    ellipse   (380,250,100,50);
    
    //CUELLO
    fill      (25,150,70);
    triangle  (-100,400,150,180,150,800);  
    triangle  (340,340,80,300,0,500);
    triangle  (300,340,220,420,50,450);
    triangle  (230,300,170,470,50,500);
    
    //OJO
    stroke    (20,30,50);
    fill      (255,255,255);
    triangle  (170,180,180,200,210,180);
    fill      (0,0,0);
    ellipse   (195,185,8,8);
    
    //Nariz
    fill      (0,20,20);
    ellipse   (380,180,5,5);
    
    //Lineas para definir CARA
    //SUPERIOR
    stroke    (20,120,44);
    line      (400,170,200,170);
    line      (305,160,203,107);
    line      (305,160,370,170);
    
    //INFERIOR
    line      (400,340,130,340);
    line      (200,340,90,440);
    
    //Animacion FUEGO
    float fuego1x = random (0,20);
    float fuego1y = random (-20,20);
    
    float fuego2x = random (-40,40);
    float fuego2y = random (-40,40);
    
    float fuego3x = random (-70,70);
    float fuego3y = random (-70,70);
    
    
    //Fuego
    noStroke();
    fill     (255,233,0);
    triangle (400 + activarFuego,250 + activarFuego,800 + activarFuego - fuego3x,0 + activarFuego - fuego3y,800 + activarFuego - fuego3x,500 + activarFuego - fuego3y);
    fill     (255 ,200,0);
    triangle (400 + activarFuego,250 + activarFuego,700 + activarFuego - fuego2x,100 + activarFuego - fuego2y,700  + activarFuego- fuego2x,400 + activarFuego - fuego2y);
    fill     (255,0,0);
    triangle (400 + activarFuego,250 + activarFuego,600 + activarFuego - fuego1x,200 + activarFuego - fuego1y,600  + activarFuego- fuego1x,300 + activarFuego - fuego1y);
    
   
    //KAMEHAMEHA
    fill     (100,100,255);
    triangle (450 + activarKame,250 + activarKame,5000 + activarKame,250 + activarKame + aumentoKame + activarKame,5000 + activarKame,250 + activarKame - aumentoKame); 
    fill     (76,24,255);
    ellipse  (450 + activarKame,250 + activarKame,50 + activarKame,200 + activarKame);
    fill     (0,0,255);
    rect     (450 + activarKame,220 + activarKame,0 + activarKame + aumentoKame,70 + activarKame);
 
 
   
}

   void keyPressed(){
      if (key == '1'){
        activarFuego  = 0;
        activarKame   = 9999;
      } if (key == '2'){
        activarFuego  = 9999;
        activarKame   = 0;
        aumentoKame   = 0;
      }
   }
   
   void mousePressed(){
     aumentoKame = aumentoKame +50;
   }


