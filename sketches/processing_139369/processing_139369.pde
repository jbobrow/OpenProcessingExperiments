
class CarregaBloc{
  int level = 0;
  int colorb;
  float capturat;
  //Declaracio del array de nivells, aquest array conte tota la informació de la disposició dels blocs i color per a cada nivell. Es Posible generar nous nivells simplement afegint dades al array
  int[][][] levels = {{//level1
                      {180,0,#FAFF00},{240,0,#0CE85A},
                      {150,20,#0CE85A},{270,20,#FAFF00},
                      {120,40,#FAFF00},{300,40,#0CE85A},
                      {90,60,#0CE85A},{330,60,#FAFF00},
                      {60,80,#FAFF00},{360,80,#0CE85A},
                      {30,100,#0CE85A},{390,100,#FAFF00},
                      {0,120,#FAFF00},{420,120,#0CE85A},
                      {30,140,#0CE85A},{390,140,#FAFF00},
                      {60,160,#FAFF00},{360,160,#0CE85A},
                      {90,180,#0CE85A},{330,180,#FAFF00},
                      {120,200,#FAFF00},{300,200,#0CE85A},
                      {150,220,#0CE85A},{270,220,#FAFF00},
                      {180,240,#FAFF00},{240,240,#0CE85A}},
                      //level2
                      {{120,20,#00E1E8},{180,20,#0031FF},{240,20,#00E1E8},{300,20,#0031FF},
                       {120,40,#00E1E8},{180,40,#0031FF},{240,40,#00E1E8},{300,40,#0031FF},
                      {60,60,#0031FF},{120,60,#00E1E8},{180,60,#0031FF},{240,60,#00E1E8},{300,60,#0031FF},{360,60,#00E1E8},
                      {60,80,#0031FF},{120,80,#F00707},{180,80,#0031FF},{240,80,#00E1E8},{300,80,#F00707},{360,80,#00E1E8},
                      {60,100,#0031FF},{120,100,#F00707},{180,100,#0031FF},{240,100,#00E1E8},{300,100,#F00707},{360,100,#00E1E8},
                      {60,120,#0031FF},{120,120,#00E1E8},{180,120,#0031FF},{240,120,#00E1E8},{300,120,#0031FF},{360,120,#00E1E8},
                      {60,140,#0031FF},{120,140,#00E1E8},{180,140,#0031FF},{240,140,#00E1E8},{300,140,#0031FF},{360,140,#00E1E8},
                      {60,160,#0031FF},{120,160,#00E1E8},{180,160,#0031FF},{240,160,#00E1E8},{300,160,#0031FF},{360,160,#00E1E8},
                      {0,180,#00E1E8},{60,180,#0031FF},{120,180,#00E1E8},{180,180,#0031FF},{240,180,#00E1E8},{300,180,#0031FF},{360,180,#00E1E8},{420,180,#00E1E8},
                      {0,200,#00E1E8},{120,200,#00E1E8},{180,200,#0031FF},{240,200,#00E1E8},{300,200,#0031FF},{420,200,#00E1E8},
                      //boca
                      {120,220,#00E1E8},{300,220,#0031FF},{120,240,#00E1E8},{300,240,#0031FF},
                      {150,260,#0031FF},{150,280,#0031FF},
                      {270,260,#0031FF},{270,280,#0031FF},
                      {0,220,#00E1E8},{420,220,#00E1E8},
                      {0,240,#00E1E8},{420,240,#00E1E8},
                      {0,260,#00E1E8},{420,260,#00E1E8}},
                                            
                      //level3
                      {{0,0,#FF0300},{420,0,#FAFF00},
                      {60,20,#FF0300},{360,20,#FAFF00},
                      {120,40,#FF0300},{300,40,#FAFF00},
                      {180,60,#FF0300},{240,60,#FAFF00},
                      {240,80,#FF0300},{180,80,#FAFF00},
                      {300,100,#FF0300},{120,100,#FAFF00},
                      {360,120,#FF0300},{60,120,#FAFF00},
                      {420,140,#FF0300},{0,140,#FAFF00},
                      {0,160,#FF0300},{420,160,#FAFF00},
                      {60,180,#FF0300},{360,180,#FAFF00},
                      {120,200,#FF0300},{300,200,#FAFF00},
                      {180,220,#FF0300},{240,220,#FAFF00}},
                      //level4
                      {{0,0,#FAFF00},{60,0,#0CE85A},{120,0,#FAFF00},{180,0,#0CE85A},{240,0,#FAFF00},{300,0,#0CE85A},{360,0,#FAFF00},{420,0,#0CE85A},
                      {0,40,#0CE85A},{0,80,#FAFF00},{0,120,#0CE85A},{0,160,#FAFF00},{0,200,#0CE85A},{0,240,#FAFF00},{0,280,#0CE85A},
                      {60,280,#FAFF00},{120,280,#0CE85A},{180,280,#FAFF00},{240,280,#0CE85A},{300,280,#FAFF00},{360,280,#0CE85A},{420,280,#FAFF00},
                      {420,40,#FAFF00},{420,80,#0CE85A},{420,120,#FAFF00},{420,160,#0CE85A},{420,200,#FAFF00},{420,240,#0CE85A},{420,280,#FAFF00},
                      {120,60,#FAFF00},{300,60,#0CE85A},
                      {210,100,#0CE85A},
                      {120,180,#FAFF00},{180,180,#0CE85A},{240,180,#FAFF00},{300,180,#0CE85A},
                      {180,200,#FAFF00},{240,200,#0CE85A},
                      {210,220,#FAFF00}},     
                      //level 5
                       {{0,0,#00E1E8},{60,0,#0031FF},{120,0,#00E1E8},{180,0,#0031FF},{240,0,#00E1E8},{300,0,#0031FF},{360,0,#00E1E8},{420,0,#0031FF},
                      {0,40,#0031FF},{60,40,#00E1E8},{120,40,#0031FF},{180,40,#00E1E8},{240,40,#0031FF},{300,40,#00E1E8},{360,40,#0031FF},{420,40,#00E1E8},
                      {0,80,#00E1E8},{60,80,#0031FF},{120,80,#00E1E8},{180,80,#0031FF},{240,80,#00E1E8},{300,80,#0031FF},{360,80,#00E1E8},{420,80,#0031FF},
                      {0,120,#0031FF},{60,120,#00E1E8},{120,120,#0031FF},{180,120,#00E1E8},{240,120,#0031FF},{300,120,#00E1E8},{360,120,#0031FF},{420,120,#00E1E8},
                      {0,160,#00E1E8},{60,160,#0031FF},{120,160,#00E1E8},{180,160,#0031FF},{240,160,#00E1E8},{300,160,#0031FF},{360,160,#00E1E8},{420,160,#0031FF},
                      {0,200,#0031FF},{60,200,#00E1E8},{120,200,#0031FF},{180,200,#00E1E8},{240,200,#0031FF},{300,200,#00E1E8},{360,200,#0031FF},{420,200,#00E1E8}},
                      //level6
                      {{0,220,#00E1E8},{60,200,#0031FF},{120,180,#00E1E8},{180,160,#0031FF},{240,160,#00E1E8},{300,180,#0031FF},{360,200,#00E1E8},{420,220,#0031FF},
                      {0,200,#00E1E8},{60,180,#0031FF},{120,160,#00E1E8},{180,140,#0031FF},{240,140,#00E1E8},{300,160,#0031FF},{360,180,#00E1E8},{420,200,#0031FF},
                      {0,180,#00E1E8},{60,160,#0031FF},{120,140,#00E1E8},{180,120,#0031FF},{240,120,#00E1E8},{300,140,#0031FF},{360,160,#00E1E8},{420,180,#0031FF},
                      {0,0,#00E1E8},{60,20,#0031FF},{120,40,#00E1E8},{180,60,#0031FF},{240,60,#00E1E8},{300,40,#0031FF},{360,20,#00E1E8},{420,0,#0031FF},
                      {0,20,#00E1E8},{60,40,#0031FF},{120,60,#00E1E8},{180,80,#0031FF},{240,80,#00E1E8},{300,60,#0031FF},{360,40,#00E1E8},{420,20,#0031FF},
                      {0,40,#00E1E8},{60,60,#0031FF},{120,80,#00E1E8},{180,100,#0031FF},{240,100,#00E1E8},{300,80,#0031FF},{360,60,#00E1E8},{420,40,#0031FF}},
                      //level7
                      {{100,40,#FF0300},{318,40,#0000B9},
                      {100,60,#0000B9},{318,60,#FF0300},
                      {209,100,#0000B9},{209,120,#FF0300},
                      {100,160,#FF0300},{318,160,#0000B9},
                      {100,180,#0000B9},{318,180,#FF0300}},
                      //level8
                       {{0,140,#00E1E8},{60,140,#0031FF},{120,140,#00E1E8},{180,140,#0031FF},{240,140,#00E1E8},{300,140,#0031FF},{360,140,#00E1E8},{420,140,#0031FF},
                           {30,120,#0031FF},{90,120,#00E1E8},{150,120,#0031FF},{210,120,#00E1E8},{270,120,#0031FF},{330,120,#00E1E8},{390,120,#0031FF},
                              {60,100,#00E1E8},{120,100,#0031FF},{180,100,#00E1E8},{240,100,#0031FF},{300,100,#00E1E8},{360,100,#0031FF},
                                       {90,80,#0031FF},{150,80,#00E1E8},{210,80,#0031FF},{270,80,#00E1E8},{330,80,#0031FF},
                                             {120,60,#00E1E8},{180,60,#0031FF},{240,60,#00E1E8},{300,60,#0031FF},
                                                   {150,40,#0031FF},{210,40,#00E1E8},{270,40,#0031FF},
                                                       {180,20,#0031FF},{240,20,#00E1E8},
                                                             {210,0,#0031FF}},
                      //level9
                        {{0,0,#00E1E8},{60,0,#0031FF},{120,0,#00E1E8},{180,0,#0031FF},{240,0,#00E1E8},{300,0,#0031FF},{360,0,#00E1E8},{420,0,#0031FF},
                        /*columna esquerra */{0,20,#00E1E8},{0,40,#00E1E8},{0,60,#00E1E8},{0,80,#00E1E8},{0,100,#00E1E8},{0,120,#00E1E8},{0,140,#00E1E8},{0,160,#00E1E8},{0,180,#00E1E8},{0,200,#00E1E8},{0,220,#00E1E8},{0,240,#00E1E8},{0,260,#00E1E8},{0,280,#00E1E8},
                        /*columna dreta */{420,20,#00E1E8},{420,40,#00E1E8},{420,60,#00E1E8},{420,80,#00E1E8},{420,100,#00E1E8},{420,120,#00E1E8},{420,140,#00E1E8},{420,160,#00E1E8},{420,180,#00E1E8},{420,200,#00E1E8},
                        /*fila abaix*/{0,280,#00E1E8},{60,280,#0031FF},{120,280,#00E1E8},{180,280,#0031FF},{240,280,#00E1E8},{300,280,#0031FF},{360,280,#00E1E8},{420,280,#0031FF}, 
                        /*fila mig*/{120,200,#00E1E8},{180,200,#0031FF},{240,200,#00E1E8},{300,200,#0031FF},{360,200,#00E1E8},{420,200,#0031FF},
                        /*columna 2*/ {120,200,#0031FF},{120,180,#0031FF},{120,160,#0031FF},{120,140,#0031FF},{120,120,#0031FF},{120,100,#0031FF},{120,80,#0031FF},
                         /*fila en mig*/{180,80,#0031FF},{240,80,#0031FF},{300,80,#0031FF},
                                        {300,100,#0031FF},{300,120,#0031FF},{300,140,#0031FF},{300,160,#0031FF},
                                        {240,160,#0031FF},
                                        {200,140,#0031FF}},
                                        //level 10
                                        {{0,160,#00E1E8},{30,140,#0031FF},{60,120,#00E1E8},{90,100,#0031FF},{120,80,#00E1E8},{150,60,#0031FF},{180,40,#00E1E8},{210,20,#0031FF},
                                        {90,140,#0031FF},{150,140,#00E1E8},{210,140,#0031FF},{270,140,#00E1E8},{330,140,#0031FF},
                                        {120,120,#0031FF},{180,120,#00E1E8},{240,120,#0031FF},{300,120,#00E1E8},
                                        {150,100,#0031FF},{210,100,#00E1E8},{270,100,#0031FF},
                                        {180,80,#0031FF},{240,80,#00E1E8},{210,60,#0031FF},
                                        {60,160,#00E1E8},{120,160,#0031FF},{180,160,#00E1E8},{240,160,#0031FF},{300,160,#00E1E8},{360,160,#0031FF},
                                        {420,160,#00E1E8},{390,140,#0031FF},{360,120,#00E1E8},{330,100,#0031FF},{300,80,#00E1E8},{270,60,#0031FF},{240,40,#00E1E8},
                                        {30,180,#0031FF},{60,200,#00E1E8},{90,220,#0031FF},{120,240,#00E1E8},{150,260,#0031FF},{180,280,#00E1E8},{210,300,#0031FF},
                                        {90,180,#0031FF},{150,180,#00E1E8},{210,180,#0031FF},{270,180,#00E1E8},{330,180,#0031FF},{390,180,#0031FF},
                                        {90,180,#0031FF},{150,180,#00E1E8},{210,180,#0031FF},{270,180,#00E1E8},{330,180,#0031FF},
                                        {120,200,#0031FF},{180,200,#00E1E8},{240,200,#0031FF},{300,200,#00E1E8},{360,200,#00E1E8},
                                        {150,220,#0031FF},{210,220,#00E1E8},{270,220,#0031FF},{330,220,#0031FF},
                                         {180,240,#0031FF},{240,240,#00E1E8},{300,240,#00E1E8},{210,260,#0031FF},{270,260,#0031FF},{240,280,#0031FF}},
                                       //level11
                                       {{20,40,#FAFF00},{80,60,#FAFF00},{140,80,#FAFF00},{200,100,#FAFF00},{260,80,#FAFF00},{320,60,#FAFF00},{380,40,#FAFF00},
                                        {20,60,#FAFF00},{80,80,#FAFF00},{140,100,#FAFF00},{200,120,#FAFF00},{260,100,#FAFF00},{320,80,#FAFF00},{380,60,#FAFF00},
                                        {20,80,#FAFF00},{80,100,#FAFF00},{140,120,#FAFF00},{200,140,#FAFF00},{260,120,#FAFF00},{320,100,#FAFF00},{380,80,#FAFF00},
                                        {140,160,#FAFF00},{200,160,#FAFF00},{260,160,#FAFF00},
                                        {80,180,#FAFF00},{140,180,#FAFF00},{200,180,#FAFF00},{260,180,#FAFF00},{320,180,#FAFF00},
                                        {20,200,#FAFF00},{80,200,#FAFF00},{140,200,#FAFF00},{260,200,#FAFF00},{320,200,#FAFF00},{380,200,#FAFF00},
                                        {20,220,#FAFF00},{80,220,#FAFF00},{320,220,#FAFF00},{380,220,#FAFF00},
                                        {20,240,#FAFF00},{380,240,#FAFF00}},
                                          //level12
                                          {{0,0,#FAFF00},{60,00,#FAFF00},{350,00,#0CE85A},{410,0,#0CE85A},
                                          {120,40,#FAFF00},{180,40,#0CE85A},{240,40,#FAFF00},{300,40,#0CE85A},
                                          {0,80,#FAFF00},{60,80,#FAFF00},{350,80,#0CE85A},{410,80,#0CE85A},
                                          {120,120,#FAFF00},{180,120,#0CE85A},{240,120,#FAFF00},{300,120,#0CE85A},
                                          {0,160,#FAFF00},{60,160,#FAFF00},{350,160,#0CE85A},{410,160,#0CE85A},
                                          {120,200,#FAFF00},{180,200,#0CE85A},{240,200,#FAFF00},{300,200,#0CE85A},
                                          {0,240,#FAFF00},{60,240,#FAFF00},{350,240,#0CE85A},{410,240,#0CE85A}

                      
                      
                      
                      
                        
                        
                        
  }};
  Bloc[] blocs;
  Nombres[] nombre;
  
 CarregaBloc(int levl){ //Inicialitzacio dinamica de objectes bloc
   level = levl-1;
   blocs = new Bloc[levels[level].length];
   nombre = new Nombres[levels[level].length];
    for(int i = 0; i < blocs.length; i++){
      
     blocs[i] = new Bloc(); 
     
      
    }
 }
 void reinit(int levl){ //Funcio per a la reinicialitzacio
  level = levl-1;
   blocs = new Bloc[levels[level].length];
   nombre = new Nombres[levels[level].length];
    for(int i = 0; i < blocs.length; i++){
      
     blocs[i] = new Bloc();  
   
   
   
   
 
  }
  
 }
 void execute(){//Funcio que dibuixa cada un dels  blocs en base als parametres rebuts
  for(int i = 0;i<levels[level].length;i++){
     
       
         blocs[i].dibuixa(levels[level][i][0],levels[level][i][1],levels[level][i][2]);
        
         
          
   }
  
 } 
 void initvalors(){//Inicialitzacio array dinamic de tipus nombres
   
   for(int i = 0;i<levels[level].length;i++){
  
   nombre[i] = new Nombres(blocs[i].magickey,levels[level][i][0], levels[level][i][1]);
   //println(blocs[i].xPos);
   }
 }
 
 void callvalor(){ //Funcio que dibuixa el valor un cop s'ha colisionat amb el bloc
   
   for(int i = 0; i < nombre.length; i++){
     
     
    nombre[i].dibuixa(); //Dibuixa el nombre corresponent al bloc colisionat en concret
    
    if(nombre[i].active == true){
     
     nombre[i].moure();
     
    } 
     
   }
   
   
   
 }
 
 void checkvoid(){ //Comprava si el nivell es buit i el reinicialitza en tal cas
   int cont = 0;
   
  for(int i = 0; i < blocs.length;i++){
   if(blocs[i].enabled == true){
     cont++;
     } 
     
  } 
   if(cont <= 0){
     for(int i = 0; i < this.nombre.length;i++){
       if(this.nombre[i].active == true && this.nombre[i].valor == ops.res){
     cont++;
     } }}  
     if(cont <= 0){
     ball.ypos = random(450,530);
      ball.xpos = width/2;
     ball.active =false;
      ball.xSpeed =basespeed;
      ball.ySpeed = basespeed;
       bara.xPos = width/2-35;
       
       
       this.reinit(levelj);
       
       for(int i = 0;i<this.blocs.length;i++){
     
       
         this.blocs[i].enabled = true;

   }
   ops.generaoperacio();
  this.initvalors();
  vidp.treurevida(30);
     
   }
 }
 
 void captura(Barra barr,CarregaBloc crg,BarraOp opps){//Funcio permet la captura dels nombres mitjançant la barra. Això es fa mitjançant la comprovacio continua de les coredenades dels mateixos respecte la barra
   
  for(int i = 0; i <nombre.length;i++){
   
   if(nombre[i].active == true){
    if(nombre[i].xpos >= barr.xPos || (nombre[i].xpos+textWidth(nombre[i].texto) >= barr.xPos)){
     if(nombre[i].xpos <= (barr.xPos+80) || (nombre[i].xpos+textWidth(nombre[i].texto) <= (barr.xPos+80))){
      if(nombre[i].ypos >= barr.yPos || (nombre[i].ypos+18) >= barr.yPos){
       if(nombre[i].ypos <= (barr.yPos+18) || (nombre[i].ypos+18) <= (barr.yPos+18)){

         
         if(nombre[i].valor == opps.res){//Si el nombre es el resultat de la operacio pasem al nivell seguent
           puntu.suma();
           if(levelj < crg.levels.length){
           levelj++;}
           opps.generaoperacio();
           crg.reinit(levelj);
           vidp.vida += 5;
           
           opps.generaoperacio();
           crg.initvalors();
           ball.ypos = random(450,530);
           ball.xpos = width/2;
           ball.active =false;
           ball.xSpeed =basespeed;
           ball.ySpeed = basespeed;
         }
         else{//Si no, treiem vida
           
           vidp.treurevida(2);
           nombre[i].active = false;
           
           
         }
         
         
       }
       
       
      } 
       
       
     }
    
     
     
    } 
     
     
     
   }
   
   
  } 
   
   
   
 }
  
 void destruir(int bl){ //Destruim(dehabilitem) el bloc colisionat
    
     blocs[bl].destroy(); 
  }
  
  
void detectacolisio(Bola bool){ //Deteccio de colisions mitjançant la posicio de la bola respecta a la dels blocs
  boolean temp = true;
 int w = 0;
 while(w < levels[level].length){
    
    if(ball.xpos >= levels[level][w][0]){
      if(ball.xpos <= (levels[level][w][0]+60)){
        if(ball.ypos >= levels[level][w][1]){
          if(ball.ypos <= (levels[level][w][1]+20)){
            
          
          if(temp == true && blocs[w].enabled == true){
          this.nombre[w].cambiar();
        
          temp = false;
          }
          if(this.blocs[w].enabled==true){ 
          
          bool.ySpeed*= -1;
          this.destruir(w);
          }
          //println("bloc "+w+" bola x"+ball.xpos+" y "+ball.ypos+" "+levels[level].length);
          }
       }
    }
  }
  w++;
  }
 }
 
}

