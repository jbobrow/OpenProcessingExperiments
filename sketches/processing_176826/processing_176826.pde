
//VARIALES DE TIPO ENTERO PARA LAS POSICIONES "y" 
  int y1, y2, y3, y4, y5, y6, y7, y8, y9, y10;
  int y11 = 40; 
  int y44 = 80;
  int y99 = 40;
  int ygm = 1;
  
/*VARIABLES BOOLEAN PARA INDICAR QUE CUANDO 
ACABE DE BAJAR UNA PIEZA BAJE LA SIGUIENTE*/
  boolean baja2 = false;
  boolean baja3 = false;
  boolean baja4 = false;
  boolean baja5 = false;
  boolean baja6 = false;
  boolean baja7 = false;
  boolean baja8 = false;
  boolean baja9 = false;
  boolean baja10 = false;
  
/*VARIABLE BOOLEAN PARA INDICAR QUE CUANDO ACABE
DE BAJAR LA ÚLTIMA PIEZA, SALGA EL GAME OVER*/
  boolean gameover = false;

 void setup(){
   smooth();
   size(240,700); //Tamaño de la pantalla
   
   
 }
 
 void draw(){
   frameRate(5); //Velocidad. Especifica el número de fotogramas que se refrescará cada segundo. 
  background(0);
  //Llamamos a todos los elementos que he creado justo abajo para que se vaya ejecutando uno a uno de forma ordenada
  pieza1();
  pieza2();
  pieza3();
  pieza4();
  pieza5();
  pieza6();
  pieza7();
  pieza8();
  pieza9();
  pieza10();
  fin();
  
  
  
 }
 
//ELEMENTOS:

///PRIMERA PIEZA "L" 
 void pieza1(){
   //Bucle
   for (int i=0; i <20; i++){
     //creamos la pieza
     fill(0, 0, 255);     
     rect(0,y1,80,120);
     fill(0);     
     rect(40,y11,40,80);     
     /*Que la posición y de la pieza vaya bajando una posición hasta que llegue el final(height) menos 120,
     de este modo si modificamos el largo de la pantalla la pieza seguirá quedandose en el mismo sitio.*/
     if(y1<height-120){         
       y1 = y1+1;
       y11 = y11 + 1;
     }
     /*Si la posición y de l pieza es mas grande que el tope del largo menos 121 (120), que la variable boolean
     baja2 sea true, y así dara paso a la siguiente pieza*/
     if(y1>height-121){
       baja2 = true;
     }
     
     }
   
 }
 
//SEGUNDA PIEZA "-"
  void pieza2 (){
     //Bucle. Este bucle solo se iniciará cuando baja2 sea true.    
     for (int i=0; i<20 && baja2 == true; i++){
       fill(0, 240, 239);
       rect(80,y2,160,40);
       if(y2<height-40){
         
         y2 = y2+1;       
       }
       //Cuando llega, baja2 pasa a ser false, y baja 3 se convierte en true.
       if(y2>height-41){
         baja2 = false;
         baja3 = true;
       }
     }
  }
  
  //el resto de piezas siguen el mismo funcionamiento
  
//TERCERA PIEZA "cuadrado"
  void pieza3 (){
     for (int i=0; i<20 && baja3 == true; i++){
       fill(241, 240, 0);
       rect(80,y3,80,80); 
       if(y3<height-120){
         
         y3 = y3+1;       
       }
       if(y3>height-121){
         baja3 = false;
         baja4 = true;
         
       }
     }
  }
//CUARTA PIEZA "'-,"
  void pieza4 () {    
      for (int i=0; i<20 && baja4 == true; i++){
       fill(1, 240, 0);
       rect(40,y4,80,120);
       fill(0);
       rect(80,y4,40,40); 
       rect(40,y44,40,40);
       if(y4<height-240){
         
         y4 = y4+1;
         y44 = y44 + 1;       
       }
       if(y4>height-241){
         baja4 = false;
         baja5 = true;
         
       }
     }
  }
  
//QUINTA PIEZA
  void pieza5 (){
      for (int i=0; i<20 && baja5 == true; i++){
       fill(240, 161, 0);
       rect(40,y5,120,80);
       fill(0);
       rect(40,y5,80,40);
       if(y5<height-320){
         
         y5 = y5+1;
                
       }
       if(y5>height-321){
         baja5 = false;
         baja6 = true;
         
       }
     }
  }
  
//SEXTA PIEZA
  void pieza6(){
      for (int i=0; i<20 && baja6 == true; i++){
       fill(159, 0, 240);
       rect(120,y6,120,80);
       fill(0);
       rect(120,y6,40,40);
       rect(200,y6,40,40);
       if(y6<height-400){
         
         y6 = y6+1;
                
       }
       if(y6>height-401){
         baja6 = false;
         baja7 = true;
         
       }
     }
  }
  
//SEPTIMA PIEZA
  void pieza7 (){
     for (int i=0; i<20 && baja7 == true; i++){
       fill(241, 240, 0);
       rect(120,y7,80,80); 
       if(y7<height-480){
         
         y7 = y7+1;       
       }
       if(y7>height-481){
         baja7 = false;
         baja8 = true;
         
       }
     }
  }
  
//OCTAVA PIEZA
  void pieza8 (){
       for (int i=0; i<20 && baja8 == true; i++){
         fill(0, 240, 239);
         rect(0,y8,160,40);
         if(y8<height-520){
           
           y8= y8+1;       
         }
         if(y8>height-521){
           baja8 = false;
           baja9 = true;
         }
       }
  }
  
//NOVENA PIEZA 
  void pieza9(){
     for (int i=0; i<20 && baja9 == true; i++){
       fill(236, 2, 1);
       rect(40,y9,120,80);
       fill(0);
       rect(120,y9,40,40);
       rect(40,y99,40,40);
       
       if(y9<height-600){
         
         y9 = y9+1;
         y99 = y99+1;       
       }
       if(y9>height-601){
         baja9 = false;
         baja10 = true;
       }
     }
  }
   
//DÉCIMA PIEZA 
  void pieza10 (){
     for (int i=0; i<20 && baja10 == true; i++){
       fill(0, 0, 255);     
       rect(40,y10,80,100);
       fill(0);     
       rect(40,y10,40,60);  
       
       if(y10<height-700){
         
         y10 = y10+1;      
       }
       if(y10>height-701){
         baja10 = false;
         gameover = true;
        
       }
     }
  }
//GAME OVER
  void fin (){
      //cuando llega la ultima pieza, gameover pasa a ser true y se ejecuta este bucle final:
      for (int i=0; i<20 && gameover == true; i++) {
      frameRate(20);//aumento la velocidad
      fill(255);
      textSize(38);
      text("GAME OVER",5, ygm);
      //si la y del texto es mayor que 1, aumentara una posicion, asi bajará(simepre)
       if (ygm>0) {
       ygm++;
       }
       //cuando la y del texto llege al final de la pantalla, que su valor vuelva a ser 1
       if (ygm == height) {
         ygm =1;
       }
         
    }
  }

