
Cara david;
CaraAnimada belenguer;
BarrejaCares cares;
Boto bbar, bcar, bani, bcotxe, bonda, b6, b7;
Ondas ona;


//arrays amb la posicio i la velocitat dels cotxes
float[] cotxesx = {450, 450, 450, 450, 450, 450, 450, 450};/*{random(150.0,400.0),random(400.0,500.0),random(300.0,400.0),random(500.0,600.0),random(100.0,500.0),random(0.0,600.0),random(150.0,400.0)}; */  //200.0,250.0,400.0,350.0,450.0,300.0
float[] cotxesy = {267.0,350.0,383.0,450.0,300.0,416.0,204.0,234.0};/*205,275,310,400,240,365*/
float[] vel1 = {random(4.0,6.0),random(4.0,6.0),random(4.0,6.0),random(4.0,6.0),random(-1.0,-3.0),random(-2.0,-4.0),random(-4.0,-6.0),random(-4.0,-6.0)}; //1.0,9.0,13.0,12.0,-12.0,-11.0
float[] vel2 = {random(7.0,10.0),random(9.0,12.0),random(12.0,15.0),random(11.0,13.0),random(-11.0,-13.0),random(-10.0,-13.0),random(-10.0,-13.0),random(-10.0,-13.0)};   //8.0,10.0,13.0,12.0,-12.0,-11.0
float[] vel3 = {random(19.0,21.0),random(15.0,18.0),random(21.0,24.0),random(16.0,18.0),random(-22.0,-25.0),random(-15.0,-17.0),random(-15.0,-17.0),random(-15.0,-17.0)};   //19.0,16.0,22.0,17.0,-23.0,-16.0
float[] vel4 = {0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0};
//la posicio de la granota
float gustavox = 300;
float gustavoy = 430;

boolean coli = false;
boolean comprovacio = false;
boolean carretera1 = false;
boolean carretera2 = false; 
boolean fi = false;
Rana gustavo;
Car[] cotxes = new Car[8];

int pantallap = 1; 
int mando = 1;
int dificultat = 2;

int pantalla;
void setup(){
  size(900,600);
  david = new Cara();
  belenguer = new CaraAnimada();
  cares = new BarrejaCares();
  pantalla = 2;
  
  bbar = new Boto(100,100, color(0,0,255), 35, 55, 6, 4, "anterior");
  bcar = new Boto(100,100, color(0,0,255), 35, 55, 4, 5, "anterior");
  bani = new Boto(100,100, color(0,0,255), 35, 55, 5, 3, "anterior");
  bcotxe = new Boto(100,100, color(0,0,255), 35, 55, 3,7, "anterior");
  bonda = new Boto(100,100, color(0,0,255), 35, 55, 7, 6, "anterior");
  b6 = new Boto(100,100, color(0,0,255), 35, 55, 2, 1, "anterior");
  b7 = new Boto(100,100, color(0,0,255), 35, 55, 2, 1, "anterior");
  
  ona = new Ondas();
  for(int i = 0; i<4;i++){
    cotxes[i] = new Car(cotxesx[i], cotxesy[i], vel1[i], color (random(255),random(255), random(255)));
  }
  //Els cotxes que circulen cap a la esquerra
  for(int i = 4; i<8;i++){
    cotxes[i] = new Car(cotxesx[i], cotxesy[i], vel1[i], color (random(255),random(255), random(255)));
  }
  //Rana gustavo
  gustavo = new Rana(gustavox, gustavoy);
 }


void draw(){
  switch(pantalla){
    case 1:
       break; 
    case 2:
    //switch amb els quatre casos, la pantalla del joc (1), la pantalla de game over (2), you win (3) i cheater(4)
    switch(pantallap){
      case 1: 
                    //Crida al metode que conté el fons
                    Fons();
                    strokeWeight(1);
                    stroke(0);
                    fill(255);
                    //crida al metode que dibuixa la granota i al que la mou
                    gustavo.dibuixa();
                    gustavo.moure(gustavox,gustavoy);
                    
                    //Selecció de la dificultat            
                    if(mousePressed&&mouseX>=590-5+300&&mouseX<=590+305&& mouseY>=490-5 &&  mouseY<=490+5){
                    dificultat = 3;
                    }else if(mousePressed&&mouseX>=570-5+300&&mouseX<=570+5+300 && mouseY>=490-5 &&  mouseY<=490+5){
                    dificultat = 2;
                    }else if(mousePressed&&mouseX>=550-5+300&&mouseX<=550+5+300 && mouseY>=490-5 &&  mouseY<=490+5){
                    dificultat = 1;
                    }
                    else if(mousePressed&&mouseX>=510-5+300&&mouseX<=510+5+300 && mouseY>=490-5 &&  mouseY<=490+5){
                    dificultat = 4;
                    }
                    //Seleccio del metode de entrada
                    if(mousePressed&&mouseX>=50-5&&mouseX<=50+5 && mouseY>=490-5 &&  mouseY<=490+5){
                    mando = 1;
                    }else if(mousePressed&&mouseX>=210-5&&mouseX<=210+5 && mouseY>=490-5 &&  mouseY<=490+5){
                    mando = 2;
                    }
                    //switch en el que s'utilitza la variable mando per escollir el metode d'entrada
                    switch(mando){
                      case 1:
                       gustavox = mouseX;
                       gustavoy = mouseY;
                       break;
                      case 2:
                      if(key=='w'||key=='W'){
                            gustavoy--;
                        }
                        if(key=='s'||key=='S'){
                            gustavoy++;
                        }
                        if(key=='a'||key=='A'){
                            gustavox--;
                        }
                        if(key=='d'||key=='D'){
                            gustavox++;
                        }
                        break;
                    }
                    //comprovacio de que la granota esta en posicio i pot començar el joc
                    textSize(32);
                    stroke(255);
                    if(comprovacio == false){
                      textAlign(CENTER);
                      text("Get in Position",width/2,height/2);
                      noFill();
                      rect(width/2,420+100,20,20);
                    }
                    if(gustavox>440&&gustavox<460&&gustavoy>410+100&&gustavoy<430+100){
                      comprovacio = true;
                    }
                    
                    stroke(0);
                    fill(255);
                    //switch que utilitza la variable dificultat per canviar la velocitat dels cotxes. El cas 4 es el 'stop', velocitat 0.
                    switch(dificultat){
                      case 1:
                      for(int i = 0; i<4;i++){
                        cotxes[i].dibuixa();
                        cotxes[i].moure(vel1[i]);
                        cotxesx[i] = (cotxesx[i] + vel1[i])%(width+30);
                      }
                      for(int i = 4; i<8;i++){
                        cotxes[i].dibuixa();
                        cotxes[i].moureinv(vel1[i]);
                        cotxesx[i] = (cotxesx[i] + vel1[i]);
                        if(cotxesx[i]<-30){
                          cotxesx[i] = width+30;
                        }
                      }
                      break;       
                     case 2: 
                      for(int i = 0; i<4;i++){
                        cotxes[i].dibuixa();
                        cotxes[i].moure(vel2[i]);
                        cotxesx[i] = (cotxesx[i] + vel2[i])%(width+30);
                      }
                      for(int i = 4; i<8;i++){
                        cotxes[i].dibuixa();
                        cotxes[i].moureinv(vel2[i]);
                        cotxesx[i] = (cotxesx[i] + vel2[i]);
                        if(cotxesx[i]<-30){
                          cotxesx[i] = width+30;
                        }
                      }     
                      break;
                      case 3: 
                        for(int i = 0; i<4;i++){
                          cotxes[i].dibuixa();
                          cotxes[i].moure(vel3[i]);
                          cotxesx[i] = (cotxesx[i] + vel3[i])%(width+30);
                        }
                        for(int i = 4; i<8;i++){
                          cotxes[i].dibuixa();
                          cotxes[i].moureinv(vel3[i]);
                          cotxesx[i] = (cotxesx[i] + vel3[i]);
                          if(cotxesx[i]<-30){
                            cotxesx[i] = width+30;
                          }
                        }
                        break;
                     case 4:
                       for(int i = 0; i<4;i++){
                              cotxes[i].dibuixa();
                              cotxes[i].moure(vel4[i]);
                              cotxesx[i] = (cotxesx[i] + vel4[i])%(width+30);
                            }
                            for(int i = 4; i<8;i++){
                              cotxes[i].dibuixa();
                              cotxes[i].moureinv(vel4[i]);
                              cotxesx[i] = (cotxesx[i] + vel4[i]);
                              if(cotxesx[i]<-30){
                                cotxesx[i] = width+30;
                              }
                            }
                            break;  
                    }
                    //si despres de comprovar de que la granota esta en posicio, la granota passa per les dues parts de la carretera "carretera1" i "carretera2" 
                    //pasaran a ser (cada una a traves de dos if direrents) true. Aquestes dues variables son antitrampes, si arribes al final sense passar per la carretera (treient el mouse fora del joc), 
                    //no guanyaras, i el joc et portara a la pantalla 'cheater'
                      
                      if(comprovacio){
                        if(gustavox>0&&gustavox<width&&gustavoy>327&&gustavoy<465){
                          carretera1 = true;
                        }
                        if(gustavox>0&&gustavox<width&&gustavoy>190 &&gustavoy<327){
                          carretera2 = true;
                        }
                        //comprovacio de la colisio entre els cotxes i la granota
                        for(int i = 0; i<8 && coli == false; i++){
                          coli = collisio(cotxesx[i], cotxesy[i], gustavox, gustavoy);
                        }
                        //si colisiones, el joc et portara a la pantalla "Game Over"
                        if(coli){
                          pantallap = 2;
                        }
                        //Si es compleix les condicio que he explicat abans (les variables carretera), et portara a la pantalla 'You Win!'. 
                        //Pero si arribes al final sense complir les condicions, et portara a la pantalla 'Cheater'
                        if(carretera1&&carretera2&&gustavoy<160){
                          pantallap = 3;
                        }else if((carretera1 == false || carretera2 == false)&&gustavoy<100){
                          pantallap = 4;
                        }
                        println(carretera1+","+carretera2+","+mouseX+","+mouseY);
                       
                    }
                     bcotxe.dibuixa();
                    break;
                    
            case 2: textAlign(CENTER);
                    GameOver();
                    strokeWeight(1);
                    fill(255);
                    stroke(200);
                    rectMode(CENTER);
        
                    rect(450,350,90,30);
                    textSize(18);
                    fill(0);
                    text("Try Again",450,355);
                    //si cliques en el boto de try again, es reinicialitzaran les variables necessaries i tornaras al joc, des del principi.
                    if(mousePressed&&mouseX>450-45&&mouseX<450+45 && mouseY>350-15 &&  mouseY<350+15){
                      comprovacio = false;
                      coli = false;
                      carretera1 = false;
                      carretera2 = false;
                      pantallap = 1;
                      mando = 1;
                      bcotxe.dibuixa();
                    }
                    break;
            case 3: YouWin();
                    strokeWeight(1);
                    fill(255);
                    stroke(200);
                    rectMode(CENTER);
                    rect(300+150,350,90,30);
                    textSize(18);
                    fill(0);
                    text("Try Again",300+150,355);
                    //si cliques en el boto de try again, es reinicialitzaran les variables necessaries i tornaras al joc, des del principi.
                    if(mousePressed&&mouseX>300-45+150&&mouseX<300+150+45 && mouseY>350-15 &&  mouseY<350+15){
                      comprovacio = false;
                      coli = false;
                      carretera1 = false;
                      carretera2 = false;
                      pantallap = 1;
                      mando = 1;
                      bcotxe.dibuixa();
                    }
                    break;
            case 4: Cheater();
                    bcotxe.dibuixa();
                    break;
                    
          }
        
      break;
    case 3:

      break;
    case 4:
      david.dibuixacara();
      break;
    case 5:
      belenguer.dibuixacaraAnimada();
      break;
    case 6:
      cares.barrejacares();
      break;
    case 7:
      ona.dibuixaOndas();
      break;
    case 8:

       break;
  }  
}

void mousePressed(){
  if(pantalla ==1){
  
  }
  if(pantalla ==2){
    bcotxe.apreta();
  }
  
  if(pantalla ==3){
  
  }
  if(pantalla ==4){
    bcar.apreta();
  }
  
  if(pantalla ==5){
    bani.apreta();
  }
  
  if(pantalla ==6){
    bbar.apreta();
  }
  if(pantalla ==7){
    bonda.apreta();
  }
  if(pantalla ==8){
  
  }
  
  
  
  
  
  
//b6.apreta();
//  b7.apreta();
  
}
class BarrejaCares{

    int[] posicions = {500,300,650,300,600,300,800,300,350,300,350,500,600,200,200,200,400,200,800,500,800,100,100,100,100,200,150,100};
    int[] posicionsreini = {500,300,650,300,600,300,800,300,350,300,350,500,600,200,200,200,400,200,800,500,800,100,100,100,100,200,150,100};
    
    boolean[] comprovacions= {false, false, false, false, false, false, false, false, false, false, false, false, false, false};

  BarrejaCares(){
    
    int[] posicions = {500,300,650,300,600,300,800,300,350,300,350,500,600,200,200,200,400,200,800,500,800,100,100,100,100,200,150,100};
    int[] posicionsreini = {500,300,650,300,600,300,800,300,350,300,350,500,600,200,200,200,400,200,800,500,800,100,100,100,100,200,150,100};
    
    boolean[] comprovacions= {false, false, false, false, false, false, false, false, false, false, false, false, false, false};
    
      
  }
  void barrejacares(){
    textAlign(LEFT);
    strokeWeight(1);
    stroke(0);
    rectMode(CORNER);
     //Advertència! si el centre de dos elements s'aproximen massa passen a tindre el mateix centre i a moures com un sol element i 
  //no poden ser separats, s'ha de clicar a borrar per a poder tornar a utilitzar-los per separat.

  background(200);
  stroke(#000000);
  fill(#FFFFFF);
  //Menú
  rect(0,580,40,20);
  rect(0,559,40,20);
  rect(0,538,40,20);
  rect(0,517,40,20);
  rect(0,496,40,20);
  rect(0,475,40,20);
  rect(0,454,40,20);
  rect(0,433,40,20);
  rect(0,412,40,20);
  rect(0,391,40,20);
  rect(0,370,40,20);
  rect(0,340,40,18);
  rect(0,319,40,20); 
  rect(0,280,40,20);   
  
  rect(860,580,40,20);
  textSize(10);
  fill(0, 102, 153);
  text("borrar", 869, 590); 
  text("ull", 13,593); 
  text("ull", 13, 572); 
  text("cara", 9, 549); 
  text("orella", 8, 529); 
  text("orella", 8, 508); 
  text("Perilla",7, 488); 
  text("Cabell",6, 467); 
  text("Nas", 10, 445); 
  text("Boca", 9, 424); 
  text("cella", 9, 403);
  text("cella", 9, 382);
  text("David B", 5, 369);
  text("cor", 10, 351);
  text("cor", 10, 331);
  text("Dani G", 7, 313);
  text("Boina",8,294);
  text("Xavi G",7,275); 
  


  //clear - boto d'esborrar-ho tot
  if(mousePressed == true && mouseX>=860&&mouseX<=900&&mouseY>=580&&mouseY<=600){
    for(int i = 0; i<posicions.length; i++){
      posicions[i] = posicionsreini[i];
    }
     for(int i = 0; i<comprovacions.length; i++){
      comprovacions[i] = false;
    }
  }
    
  //Orella esquerra
  //click sobre el requadre del menú corresponent a l'orella
   if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=517&&mouseY<=537){
    comprovacions[4] = true;
  }
  //si has clickat en el comprovacions[9] al menú, es dibuixarà l'orella, i si pulses sobre aquest, en un rang determinat, pots moure-la
  if (comprovacions[4] == true){ 
    fill (#FCD0B4);
    ellipse(posicions[8],posicions[9],20,90);
    fill(#000000);    
    ellipse(posicions[8],posicions[9],5,20);
  if(mousePressed == true&&mouseX>posicions[8]-30&&mouseX<posicions[8]+30&&mouseY>posicions[9]-30&&mouseY<posicions[9]+30){
    posicions[8]=mouseX;
    posicions[9]=mouseY;
  } 
  }
  
  
  //Orella dreta
     if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=496&&mouseY<=516){
    comprovacions[3] = true;
  }
  if (comprovacions[3] == true){ 
    fill (#FCD0B4);
    ellipse(posicions[6],posicions[7],20,90);
    fill(#000000);    
    ellipse(posicions[6],posicions[7],5,20);
  if(mousePressed == true&&mouseX>posicions[6]-30&&mouseX<posicions[6]+30&&mouseY>posicions[7]-30&&mouseY<posicions[7]+30){
    posicions[6]=mouseX;
    posicions[7]=mouseY;
  } 
  }


//cara
   if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=538&&mouseY<=558){
    comprovacions[2] = true;
  }
  if (comprovacions[2] == true){ 
      //cara
  fill (#FCD0B4);
  ellipse (posicions[4],posicions[5], 350, 500);
  if(mousePressed == true&&mouseX>posicions[4]-30&&mouseX<posicions[4]+30&&mouseY>posicions[5]-30&&mouseY<posicions[5]+30){
    posicions[4]=mouseX;
    posicions[5]=mouseY;
  } 
  }
 
 //Ull esquerra
  if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=580&&mouseY<=600){
    comprovacions[0] = true;
  }
  if (comprovacions[0] == true){ 
    //ulls
      fill(#FFFFFF);
      stroke(#000000);
      ellipse(posicions[0],posicions[1],70,60);
      fill(#0070B8);
      ellipse(posicions[0],posicions[1],35,30);
      fill(#000000);
      ellipse(posicions[0],posicions[1],23,18);
  if(mousePressed == true&&mouseX>posicions[0]-30&&mouseX<posicions[0]+30&&mouseY>posicions[1]-30&&mouseY<posicions[1]+30){
    posicions[0]=mouseX;
    posicions[1]=mouseY;
  } 
    
  }
  
  //Ull dret
   if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=559&&mouseY<=579){
    comprovacions[1] = true;
  }
  if (comprovacions[1] == true){ 
    //ulls
      fill(#FFFFFF);
      stroke(#000000);
      ellipse(posicions[2],posicions[3],70,60);
      fill(#0070B8);
      ellipse(posicions[2],posicions[3],35,30);
      fill(#000000);
      ellipse(posicions[2],posicions[3],23,18);
  if(mousePressed == true&&mouseX>posicions[2]-30&&mouseX<posicions[2]+30&&mouseY>posicions[3]-30&&mouseY<posicions[3]+30){
    posicions[2]=mouseX;
    posicions[3]=mouseY;
  }
    
  }
//comprovacions[9]
  if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=433&&mouseY<=453){
    comprovacions[9] = true;
  }
  if (comprovacions[9] == true){ 
    //comprovacions[9]
    stroke(#000000);
    line(posicions[18]-10,posicions[19]+(291-340),posicions[18]-15,posicions[19]+(334-340));
    line(posicions[18]+10,posicions[19]+(291-340),posicions[18]+15,posicions[19]+(334-340));
    noFill();
    arc(posicions[18], posicions[19], 60, 60,PI-0.50,PI+QUARTER_PI);
    arc(posicions[18], posicions[19], 60, 60,TWO_PI-0.75,TWO_PI+0.45);
    arc(posicions[18], posicions[19]+3, 40, 30,TWO_PI,TWO_PI+PI);
  if(mousePressed == true&&mouseX>posicions[18]-30&&mouseX<posicions[18]+30&&mouseY>posicions[19]-30&&mouseY<posicions[19]+30){
    posicions[18]=mouseX;
    posicions[19]=mouseY;
  }
    
  }





//comprovacions[10]
     if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=412&&mouseY<=432){
    comprovacions[10] = true;
  }
  if (comprovacions[10] == true){
   //comprovacions[10]
    fill(#FFFFFF);
    arc(posicions[20], posicions[21], 130, 80, 0, PI, OPEN);
    line(posicions[20]+(235-300),posicions[21]+(419-420),posicions[20]+(365-300),posicions[21]+(419-420));
  if(mousePressed == true&&mouseX>posicions[20]-30&&mouseX<posicions[20]+30&&mouseY>posicions[21]-30&&mouseY<posicions[21]+30){
    posicions[20]=mouseX;
    posicions[21]=mouseY;
  }
  

    
  }

  
  
  
  //comprovacions[5]
     if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=475&&mouseY<=495){
    comprovacions[5] = true;
  }
  if (comprovacions[5] == true){
    fill(#480C0C);
    stroke(#480C0C); 
      //comprovacions[5] esquerra
    triangle(posicions[10]-39,posicions[11]-48,posicions[10]-69,posicions[11]+1,posicions[10]-35,posicions[11]+18);
    triangle(posicions[10]-39,posicions[11]-48,posicions[10]-35,posicions[11]+18,posicions[10],posicions[11]-20);
    //comprovacions[5] dreta
    triangle(posicions[10]+39,posicions[11]-48,posicions[10]+69,posicions[11]+1,posicions[10]+35,posicions[11]+18); 
    triangle(posicions[10]+39,posicions[11]-48,posicions[10]+35,posicions[11]+18,posicions[10],posicions[11]-20);
    //comprovacions[5] centre
    triangle(posicions[10],posicions[11]-20,posicions[10]+35,posicions[11]+18,posicions[10]-35,posicions[11]+18);
    triangle(posicions[10],posicions[11]+25,posicions[10]+35,posicions[11]+18,posicions[10]-35,posicions[11]+18);
  if(mousePressed == true&&mouseX>posicions[10]-30&&mouseX<posicions[10]+30&&mouseY>posicions[11]-30&&mouseY<posicions[11]+30){
    posicions[10]=mouseX;
    posicions[11]=mouseY;
  }
    
  }
  
  
  
  
  //comprovacions[6]
       if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=454&&mouseY<=474){
    comprovacions[6] = true;
  }
  if (comprovacions[6] == true){
    fill(#480C0C);
    stroke(#480C0C);
      //Part esquerra
    triangle(posicions[12]+(143-300),posicions[13]+(188-91),posicions[12]+(164-300),posicions[13]+(143-91),posicions[12]+(182-300),posicions[13]+(161-91));
    triangle(posicions[12]+(164-300),posicions[13]+(143-91),posicions[12]+(182-300),posicions[13]+(161-91),posicions[12]+(198-300),posicions[13]+(97-91));
    triangle(posicions[12]+(182-300),posicions[13]+(161-91),posicions[12]+(236-300),posicions[13]+(138-91),posicions[12],posicions[13]);
    triangle(posicions[12]+(182-300),posicions[13]+(161-91),posicions[12]+(198-300),posicions[13]+(97-91),  posicions[12],posicions[13]);
    triangle(posicions[12]+(198-300),posicions[13]+(97-91),  posicions[12],posicions[13],  posicions[12]+(227-300),posicions[13]+(73-91));
    triangle(posicions[12],posicions[13],  posicions[12],posicions[13]+(129-91),  posicions[12]+(236-300),posicions[13]+(138-91));
    triangle(posicions[12]+(262-300),posicions[13]+(56-91),posicions[12]+(227-300),posicions[13]+(73-91),  posicions[12],posicions[13]);
    triangle(posicions[12],posicions[13]+(50-91),posicions[12],posicions[13],posicions[12]+(262-300),posicions[13]+(56-91));
    //part dreta
    triangle(posicions[12],posicions[13]+(50-91),posicions[12],posicions[13],  posicions[12]+(338-300),posicions[13]+(56-91));
    triangle(posicions[12]+(338-300),posicions[13]+(56-91),posicions[12]+(373-300),posicions[13]+(73-91),  posicions[12],posicions[13]); 
    triangle(posicions[12],posicions[13],  posicions[12],posicions[13]+(129-91),  posicions[12]+(364-300),posicions[13]+(138-91));
    triangle(posicions[12]+(402-300),posicions[13]+(97-91),  posicions[12],posicions[13],  posicions[12]+(373-300),posicions[13]+(73-91)); 
    triangle(posicions[12]+(418-300),posicions[13]+(161-91),posicions[12]+(402-300),posicions[13]+(97-91),  posicions[12],posicions[13]);
    triangle(posicions[12]+(418-300),posicions[13]+(161-91),posicions[12]+(364-300),posicions[13]+(138-91),  posicions[12],posicions[13]);
    triangle(posicions[12]+(436-300),posicions[13]+(143-91),  posicions[12]+(418-300),posicions[13]+(161-91),  posicions[12]+(402-300),posicions[13]+(97-91));
    triangle(posicions[12]+(457-300),posicions[13]+(188-91),  posicions[12]+(436-300),posicions[13]+(143-91),  posicions[12]+(418-300),posicions[13]+(161-91));
  if(mousePressed == true&&mouseX>posicions[12]-30&&mouseX<posicions[12]+30&&mouseY>posicions[13]-30&&mouseY<posicions[13]+30){
    posicions[12]=mouseX;
    posicions[13]=mouseY;
  }
    
  }







//cella esquerra
       if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=391&&mouseY<=411){
    comprovacions[8] = true;
  }
  if (comprovacions[8] == true){
        fill(#480C0C);
  stroke(#480C0C);
  //Cella esquerra (de esquerra a dreta)
    triangle(posicions[14]+(187-217),posicions[15]+(205-210),posicions[14]+(205-217),posicions[15]+(218-210),posicions[14]+(161-217),posicions[15]+(238-210));
    triangle(posicions[14]+(187-217),posicions[15]+(205-210),posicions[14]+(205-217),posicions[15]+(218-210),posicions[14]+(234-217),posicions[15]+(205-210));
    triangle(posicions[14]+(205-217),posicions[15]+(218-210),posicions[14]+(234-217),posicions[15]+(205-210),posicions[14]+(254-217),posicions[15]+(212-210));
    triangle(posicions[14]+(230-217),posicions[15]+(215-210),posicions[14]+(254-217),posicions[15]+(212-210),posicions[14]+(260-217),posicions[15]+(223-210));
  if(mousePressed == true&&mouseX>posicions[14]-30&&mouseX<posicions[14]+30&&mouseY>posicions[15]-20&&mouseY<posicions[15]+20){
    posicions[14]=mouseX;
    posicions[15]=mouseY;
  }
    
  }

//cella dreta
  if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=370&&mouseY<=390){
    comprovacions[7] = true;
  }
  if (comprovacions[7] == true){
    fill(#480C0C);
    stroke(#480C0C);
    //cella dreta (de dreta a esquerra
    triangle(posicions[16]+(340-380),posicions[17]+(223-211),posicions[16]+(346-380),posicions[17]+(212-211),posicions[16]+(370-380),posicions[17]+(215-211));
    triangle(posicions[16]+(346-380),posicions[17]+(212-211),posicions[16]+(366-380),posicions[17]+(205-211),posicions[16]+(397-380),posicions[17]+(218-211));
    triangle(posicions[16]+(413-380),posicions[17]+(205-211),posicions[16]+(397-380),posicions[17]+(218-211),posicions[16]+(366-380),posicions[17]+(205-211));
    triangle(posicions[16]+(397-380),posicions[17]+(218-211),posicions[16]+(413-380),posicions[17]+(205-211),posicions[16]+(439-380),posicions[17]+(238-211));
    
  if(mousePressed == true&&mouseX>posicions[16]-30&&mouseX<posicions[16]+30&&mouseY>posicions[17]-20&&mouseY<posicions[17]+20){
    posicions[16]=mouseX;
    posicions[17]=mouseY;
  }
  }
  
 
  
  //comprovacions[13] - Xavi Garcia
   if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=280&&mouseY<=299){
    comprovacions[13] = true;
  }
  //si has clickat en el comprovacions[9] al menú, es dibuixarà l'orella, i si pulses sobre aquest, en un rang determinat, pots moure-la
  if (comprovacions[13] == true){ 
    fill (0,0,0);
    stroke (0,0,0);
    ellipse (posicions[26],posicions[27]+(100-81),405,135);
    fill(255,0,0);
    stroke (255,0,0);
    rect (posicions[26]+(295-300),posicions[27]+(65-81),10,35);
  if(mousePressed == true&&mouseX>posicions[26]-30&&mouseX<posicions[26]+30&&mouseY>posicions[27]-30&&mouseY<posicions[27]+30){
    posicions[26]=mouseX;
    posicions[27]=mouseY;
  } 
  }
  
  //cor esquerra - Dani Gonzalez
   if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=340&&mouseY<=359){
    comprovacions[11] = true;
  }
  if (comprovacions[11] == true){ 
    noStroke();
    fill(0); 
    rect(posicions[22]+(100-135),posicions[23]+(90-105),70,20);
    rect(posicions[22]+(110-135),posicions[23]+(80-105),20,40);
    rect(posicions[22]+(140-135),posicions[23]+(80-105),20,40);
    rect(posicions[22]+(120-135),posicions[23]+(120-105),30,10);
    fill(#FF0000);
    rect(posicions[22]+(110-135),posicions[23]+(90-105),20,20);
    rect(posicions[22]+(140-135),posicions[23]+(90-105),20,20);
    rect(posicions[22]+(120-135),posicions[23]+(100-105),30,20);
    rect(posicions[22]+(130-135),posicions[23]+(120-105),10,20);
    fill(0);
    rect(posicions[22]+(130-135),posicions[23]+(130-105),10,10);
  if(mousePressed == true&&mouseX>posicions[22]-30&&mouseX<posicions[22]+30&&mouseY>posicions[23]-30&&mouseY<posicions[23]+30){
    posicions[22]=mouseX;
    posicions[23]=mouseY;
  } 
  }
 
 
     //cor dret - Dani Gonzalez
   if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=320&&mouseY<=339){
    comprovacions[12] = true;
  }
  if (comprovacions[12] == true){ 
    noStroke();
    fill(0); 
    rect(posicions[24]+(100-135),posicions[25]+(90-105),70,20);
    rect(posicions[24]+(110-135),posicions[25]+(80-105),20,40);
    rect(posicions[24]+(140-135),posicions[25]+(80-105),20,40);
    rect(posicions[24]+(120-135),posicions[25]+(120-105),30,10);
    fill(#FF0000);
    rect(posicions[24]+(110-135),posicions[25]+(90-105),20,20);
    rect(posicions[24]+(140-135),posicions[25]+(90-105),20,20);
    rect(posicions[24]+(120-135),posicions[25]+(100-105),30,20);
    rect(posicions[24]+(130-135),posicions[25]+(120-105),10,20);
    fill(0);
    rect(posicions[24]+(130-135),posicions[25]+(130-105),10,10);
  if(mousePressed == true&&mouseX>posicions[24]-30&&mouseX<posicions[24]+30&&mouseY>posicions[25]-30&&mouseY<posicions[25]+30){
    posicions[24]=mouseX;
    posicions[25]=mouseY;
  }
  }
  bbar.dibuixa();
  }



}
class Cara{
    int[] boca = {130,80,235+150,365+150,420,450};
    //variables ulls per al mapejat
    float[] ullmap = new float[6];
    float posiciodretamapejadaX;
    float posiciodretamapejadaY;
    
    float[] cabelle = {150+143, 150+164, 150+182, 150+198, 150+300,150+262, 150+236, 150+227}; 
    float[] cabelld = {150+300,150+338,150+402,150+418,150+436,150+457,150+373,150+364,150+373};
    //variables nas
    int[] nas = {450,450,343,440,441-150,460,490-150};
    //color aleatori del cabell, les celles i la perilla
    color cabell;
    color ullcolor;
    
    boolean TOT;

  Cara(){
    textAlign(LEFT);
        strokeWeight(1);
    stroke(0);
    rectMode(CORNER);
  //variables boca
    int[] boca = {130,80,235+150,365+150,420,450};
    //variables ulls per al mapejat
    float[] ullmap = {0.0,0.0,0.0,0.0,0.0,0.0};
    posiciodretamapejadaX = map(mouseX, 0, width, ullmap[4] -11, ullmap[4] +11);
    posiciodretamapejadaY = map(mouseY, 0, width, ullmap[5] -9, ullmap[5] +9);
    
    float[] cabelle = {150+143, 150+164, 150+182, 150+198, 150+300,150+262, 150+236, 150+227}; 
    float[] cabelld = {150+300,150+338,150+402,150+418,150+436,150+457,150+373,150+364,150+373};
    //variables nas
    int[] nas = {450,450,343,440,441-150,460,490-150};
 
    //color aleatori del cabell, les celles i la perilla
    cabell = color (random(255),random(255),random(255));
    ullcolor = color (random(255),random(255),255);
    
    TOT = false;
  }
  
  void dibuixacara(){
  background (#000000);
  fill (#000000);
  //introduccio de text, paraula tot en el requadre blanc de l'extrem d'abaix a l'esquerra

   
  fill (#FCD0B4);
  //orelles
  noStroke();
  fill (#FCD0B4);
  ellipse(150+124,310,20,90);
  ellipse(150+476,310,20,90);
  fill(#000000);
  ellipse(150+125,310,5,20);
  ellipse(150+475,310,5,20);
   
  //cara
  fill (#FCD0B4);
  ellipse (150+300,300, 350, 500);
   
  //ulls
  fill(#FFFFFF);
  ullmap[0] = (150+220);
  ullmap[1] = (265);

    //ull dret map
  ullmap[4] = 150+385;
  ullmap[5] = 265;

  //Silueta ull
  stroke(#000000);
    //esuqerra
  ellipse(150+220,265,70,60);
    //dret
  ellipse(150+385,265,70,60);
  
  //Iris
  fill(#0070B8);    
  
    //esquerra
  ellipse(ullmap[0], ullmap[1],35,30);
    //dret
  ellipse(ullmap[4], ullmap[5],35,30);
 
  
 //pupila
  fill(#000000);
    //esquerra
  ellipse(ullmap[0], ullmap[1],23,18);
    // dret
  ellipse(ullmap[4], ullmap[5],23,18);
   
  //boca
  fill(#FFFFFF); 
  arc(150+300, 420, boca[0], boca[1], 0, PI, OPEN);
  line(boca[2],419,boca[3],419);
   
  //condicio per la qual es consegueix fer augmentar la boca amb un límit, arribat al qual tornarà a la posició original
   

  
  //color aleatori pel cabell
  cabell = color (random(255),random(255),random(255));
   
  //Celles
  stroke(#480C0C);
  fill(#480C0C);
  
  //Cella esquerra (de esquerra a dreta)
  triangle(150+187,205,150+205,218,150+161,238);
  triangle(150+187,205,150+205,218,150+234,205);
  triangle(150+205,218,150+234,205,150+254,212);
  triangle(150+230,215,150+254,212,150+260,223);
   
  //cella dreta (de dreta a esquerra
  triangle(150+340,223,150+346,212,150+370,215);
  triangle(150+346,212,150+366,205,150+397,218);
  triangle(150+413,205,150+397,218,150+366,205);
  triangle(150+397,218,150+413,205,150+439,238);
  
  //nas 
  stroke(#000000);
  line(440,291,150+285,334);
  line(460,291,150+315,334);
  noFill();
  arc(nas[0], 340, 60, 60,PI-0.50,PI+QUARTER_PI);
  arc(nas[1], 340, 60, 60,TWO_PI-0.75,TWO_PI+0.45);
 
  stroke(#000000);
  noFill();
  arc(450, nas[2], 40, 30,TWO_PI,TWO_PI+PI);

  
 
  //Cabell
  noFill();
 // arc(300, 400, 500,540,QUARTER_PI,TWO_PI);
  noStroke();
 
  //correccions
  fill(#000000);
  rect(150+100,27,400,100);
  triangle(150+143,188,150+138,113,150+246,121);
  triangle(150+457,188,150+462,113,150+354,121);
  
  fill(#480C0C);
  stroke(#480C0C);
  
  //Part esquerra
  triangle(150+143,188.0,cabelle[1],143.0,cabelle[2],161.0);
  triangle(cabelle[1],143.0,cabelle[2],161.0,cabelle[3],97.0);
  triangle(cabelle[2],161.0,cabelle[6],138.0,cabelle[4],91.0);
  triangle(cabelle[2],161.0,cabelle[3],97.0,cabelle[4],91.0);
  triangle(cabelle[3],97.0,cabelle[4],91.0,cabelle[7],73.0);
  triangle(cabelle[4],91.0,cabelle[4],129.0,cabelle[6],138.0);
  triangle(cabelle[5],56.0,cabelle[7],73.0,cabelle[4],91.0);
  triangle(cabelle[4],50.0,cabelle[4],91.0,cabelle[5],56.0);

  //part dreta
  triangle(cabelld[0],50,cabelld[0],91,cabelld[1],56);
  triangle(cabelld[1],56,cabelld[6],73,cabelld[0],91); 
  triangle(cabelld[0],91,cabelld[0],129,cabelld[7],138);
  triangle(cabelld[2],97,cabelld[0],91,cabelld[6],73); 
  triangle(cabelld[3],161,cabelld[2],97,cabelld[0],91);
  triangle(cabelld[3],161,cabelld[7],138,cabelld[0],91);
  triangle(cabelld[4],143,cabelld[3],161,cabelld[2],97);
  triangle(cabelld[5],188,cabelld[4],143,cabelld[3],161);


  
  //color perilla
  fill(#480C0C);
  stroke(#480C0C);
  //Perilla esquerra
  triangle(150+261,482,150+231,531,150+265,548);
  triangle(150+261,482,150+265,548,150+300,510);
 
  //perilla dreta
  triangle(150+339,482,150+369,531,150+335,548); 
  triangle(150+339,482,150+335,548,150+300,510);
   
  triangle(150+300,510,150+335,548,150+265,548);
  triangle(150+300,555,150+335,548,150+265,548);
  
  
  fill(#000000);
  noStroke();
   bcar.dibuixa();
  
  }

}

class CaraAnimada{
    int[] boca = new int[6];
    //variables ulls per al mapejat
    float[] ullmap = new float[6];
    float posiciodretamapejadaX;
    float posiciodretamapejadaY;
    
    float[] cabelle = new float[8];
    float[] cabelld = new float[9];
    //variables nas
    int[] nas = {450,450,343,440,441-150,460,490-150};
    //color aleatori del cabell, les celles i la perilla
    color cabell;
    color ullcolor;
    
    boolean TOT;

  CaraAnimada(){
        strokeWeight(1);
    stroke(0);
    rectMode(CORNER);
  //variables boca
    int[] boca = {130,80,235+150,365+150,420,450};
    //variables ulls per al mapejat
    float[] ullmap = {0.0,0.0,0.0,0.0,0.0,0.0};
    posiciodretamapejadaX = map(mouseX, 0, width, ullmap[4] -11, ullmap[4] +11);
    posiciodretamapejadaY = map(mouseY, 0, width, ullmap[5] -9, ullmap[5] +9);
    
    float[] cabelle = {150+143, 150+164, 150+182, 150+198, 150+300,150+262, 150+236, 150+227}; 
    float[] cabelld = {150+300,150+338,150+402,150+418,150+436,150+457,150+373,150+364,150+373};
    //variables nas
    int[] nas = {450,450,343,440,441-150,460,490-150};
 
    //color aleatori del cabell, les celles i la perilla
    cabell = color (random(255),random(255),random(255));
    ullcolor = color (random(255),random(255),255);
    
    TOT = false;
  }
  
  void dibuixacaraAnimada(){
  background (#000000);
  fill (#FFFFFF);
  rect (20,550,30,20);
  fill (#000000);
  //introduccio de text, paraula tot en el requadre blanc de l'extrem d'abaix a l'esquerra

  textAlign(CENTER, TOP);
  line(0, 70, width, 70);
  text("tot", 35, 550);
   
  fill (#FCD0B4);
  //orelles
  noStroke();
  fill (#FCD0B4);
  ellipse(150+124,310,20,90);
  ellipse(150+476,310,20,90);
  fill(#000000);
  ellipse(150+125,310,5,20);
  ellipse(150+475,310,5,20);
   
  //cara
  fill (#FCD0B4);
  ellipse (150+300,300, 350, 500);
   
  //ulls
  fill(#FFFFFF);
  //map per a poder fixar el centre de l'ull i el moviment màxim en la x i la y, en relació amb el moviment del mouse
    //ull esquerra map
  ullmap[0] = (150+220);
  ullmap[1] = (265);
  ullmap[2] = map(mouseX, 0, width, ullmap[0] - 11, ullmap[0] + 11);
  ullmap[3] = map(mouseY, 0, width, ullmap[1] - 9, ullmap[1] + 9);
    //ull dret map
  ullmap[4] = 150+385;
  ullmap[5] = 265;
  posiciodretamapejadaX = map(mouseX, 0, width, ullmap[4] -11, ullmap[4] +11);
  posiciodretamapejadaY = map(mouseY, 0, width, ullmap[5] -9, ullmap[5] +9);
  //Silueta ull
  stroke(#000000);
    //esuqerra
  ellipse(150+220,265,70,60);
    //dret
  ellipse(150+385,265,70,60);
  
  //Iris
  fill(#0070B8);
    if (mousePressed&&(mouseX>185&&mouseX<256&&mouseY>242&&mouseY<284)|(mouseX>353&&mouseX<414&&mouseY>242&&mouseY<284)||TOT){
     
       ullcolor = color (random(255),random(255),255);
       fill (ullcolor);
     }
     
  
    //esquerra
  ellipse(ullmap[2], ullmap[3],35,30);
    //dret
  ellipse(posiciodretamapejadaX, posiciodretamapejadaY,35,30);
 
  
 //pupila
  fill(#000000);
    //esquerra
  ellipse(ullmap[2], ullmap[3],23,18);
    // dret
  ellipse(posiciodretamapejadaX, posiciodretamapejadaY,23,18);
   
  //boca
  fill(#FFFFFF); 
  arc(150+300, 420, boca[0], boca[1], 0, PI, OPEN);
  line(boca[2],419,boca[3],419);
   
  //condicio per la qual es consegueix fer augmentar la boca amb un límit, arribat al qual tornarà a la posició original
   
  if (((mouseX>=boca[2]&&mouseX<=boca[3])&&(mouseY>=boca[4]&&mouseY<=boca[5]))|(mouseX>20&&mouseX<50&&mouseY>550&&mouseY<570)) {
  if (mousePressed==true&&boca[2]>360){
   
    boca[0] = (boca[0] + 2);
    boca[1] = (boca[1] + 2);
    boca[2] = (boca[2] -1);
    boca[3] = (boca[3] + 1);
    boca[4] = boca[4];
    boca[5] = boca[5] + 1;
    }
    else{
      boca[0] = 130;
      boca[1] = 80;
      boca[2] = 235+150;
      boca[3] = 365+150;
      boca[4] = 420;
      boca[5] = 450;
       
    }
  }
  
  //color aleatori pel cabell
  cabell = color (random(255),random(255),random(255));
   
  //Celles
  stroke(#480C0C);
  fill(#480C0C);
  
  if (((mouseX>173&&mouseX<427&&mouseY>200&&mouseY<227)&&mousePressed)||TOT){
    fill (cabell);
    stroke (cabell);
  }
  //Cella esquerra (de esquerra a dreta)
  triangle(150+187,205,150+205,218,150+161,238);
  triangle(150+187,205,150+205,218,150+234,205);
  triangle(150+205,218,150+234,205,150+254,212);
  triangle(150+230,215,150+254,212,150+260,223);
   
  //cella dreta (de dreta a esquerra
  triangle(150+340,223,150+346,212,150+370,215);
  triangle(150+346,212,150+366,205,150+397,218);
  triangle(150+413,205,150+397,218,150+366,205);
  triangle(150+397,218,150+413,205,150+439,238);
  
  //nas 
  stroke(#000000);
  line(440,291,150+285,334);
  line(460,291,150+315,334);
  noFill();
  arc(nas[0], 340, 60, 60,PI-0.50,PI+QUARTER_PI);
  arc(nas[1], 340, 60, 60,TWO_PI-0.75,TWO_PI+0.45);
 
  stroke(#000000);
  noFill();
  arc(450, nas[2], 40, 30,TWO_PI,TWO_PI+PI);
  if ((mouseX>nas[3]&&mouseX<nas[5]&&mouseY>nas[4]&&mouseY<nas[6])|(mouseX>20&&mouseX<50&&mouseY>550&&mouseY<570)){
    if (mousePressed==true&&nas[0]>= 445){
      nas[0] = nas[0] - 1;
      nas[1] = nas[1] + 1;
      nas[2] = nas[2] + 2;
      nas[3] = nas[3]-1;
      nas[4] = nas[4]+1;
      nas[5] = nas[5] + 1;
      nas[6] = nas[6] + 1;
    }
    else{
       nas[0] = width/2;
       nas[1] = width/2;
       nas[2] = 343;
       nas[3] =440;
       nas[4] =291;
       nas[5] = 460;
       nas[6] = 340;
  }
  }
 
  
 
  //Cabell
  noFill();
 // arc(300, 400, 500,540,QUARTER_PI,TWO_PI);
  noStroke();
 
  //correccions
  fill(#000000);
  rect(150+100,27,400,100);
  triangle(150+143,188,150+138,113,150+246,121);
  triangle(150+457,188,150+462,113,150+354,121);
  
  fill(#480C0C);
  stroke(#480C0C);
  
  if (((mouseX>150+157&&mouseX<150+439&&mouseY>45&&mouseY<150)&&mousePressed)||TOT){
    fill (cabell);
    stroke (cabell);
  }
  
  
    float[] cabelle = {150+143, 150+164, 150+182, 150+198, 150+300,150+262, 150+236, 150+227}; 
    float[] cabelld = {150+300,150+338,150+402,150+418,150+436,150+457,150+373,150+364,150+373};
    

  //Part esquerra
  triangle(150+143,188.0,cabelle[1],143.0,cabelle[2],161.0);
  triangle(cabelle[1],143.0,cabelle[2],161.0,cabelle[3],97.0);
  triangle(cabelle[2],161.0,cabelle[6],138.0,cabelle[4],91.0);
  triangle(cabelle[2],161.0,cabelle[3],97.0,cabelle[4],91.0);
  triangle(cabelle[3],97.0,cabelle[4],91.0,cabelle[7],73.0);
  triangle(cabelle[4],91.0,cabelle[4],129.0,cabelle[6],138.0);
  triangle(cabelle[5],56.0,cabelle[7],73.0,cabelle[4],91.0);
  triangle(cabelle[4],50.0,cabelle[4],91.0,cabelle[5],56.0);

  //part dreta
  triangle(cabelld[0],50,cabelld[0],91,cabelld[1],56);
  triangle(cabelld[1],56,cabelld[6],73,cabelld[0],91); 
  triangle(cabelld[0],91,cabelld[0],129,cabelld[7],138);
  triangle(cabelld[2],97,cabelld[0],91,cabelld[6],73); 
  triangle(cabelld[3],161,cabelld[2],97,cabelld[0],91);
  triangle(cabelld[3],161,cabelld[7],138,cabelld[0],91);
  triangle(cabelld[4],143,cabelld[3],161,cabelld[2],97);
  triangle(cabelld[5],188,cabelld[4],143,cabelld[3],161);


  
  //color perilla
  fill(#480C0C);
  stroke(#480C0C);
  if (((mouseX>150+230&&mouseX<150+356&&mouseY>476&&mouseY<555)&&mousePressed)||TOT==true){
    fill (cabell);
    stroke (cabell);
  }
  //Perilla esquerra
  triangle(150+261,482,150+231,531,150+265,548);
  triangle(150+261,482,150+265,548,150+300,510);
 
  //perilla dreta
  triangle(150+339,482,150+369,531,150+335,548); 
  triangle(150+339,482,150+335,548,150+300,510);
   
  triangle(150+300,510,150+335,548,150+265,548);
  triangle(150+300,555,150+335,548,150+265,548);
 
  if (mouseX>20&&mouseX<50&&mouseY>550&&mouseY<570&&mousePressed==true){
    TOT = true;
    cabell = color (random(255),random(255),random(255));
    ullcolor = color (random(255),random(255),255);     
  }else{
    TOT = false;
  }
  

  fill(#000000);
  noStroke();
  bani.dibuixa();
   
}

  }

class Car {
  color c;
  float xPos;
  float yPos; 
  float xSpeed;

  Car() {
    c = color(255, 0, 0);
    xPos = width/2;
    yPos = height/2;
    xSpeed = 1;
  }
  Car(float x, float y, float vel, color newC){
    c = newC;
    xPos = x;
    yPos = y;
    xSpeed = vel;
  }

  void dibuixa() {
    rectMode(CENTER);
    fill(c);
    rect(xPos, yPos, 36, 24, 6);
    noFill();
    rect(xPos, yPos, 12, 17, 2);
    rect(xPos, yPos, 20, 17, 2);
    fill(0);
    ellipse(xPos-10, yPos +12, 5, 5);
    ellipse(xPos + 10, yPos +12, 5, 5);
    ellipse(xPos -10, yPos -12, 5, 5);
    ellipse(xPos + 10, yPos -12, 5, 5);
  }

  void moure() {
    xPos = (xPos + xSpeed)%(width+30);
  }
  void moure(float velo) {
    //el metode per moure els cotxes que van cap a la dreta, la velocitat s'introdueix quan es crida, per a que es pugui canviar la dificultat
    xPos = (xPos + velo)%(width+30);
  }
  void moureinv(){
    xPos = (xPos + xSpeed);
    if(xPos<-30){
      xPos = width+30;
    }
  }
  void moureinv(float velo){
    //el metode per moure els cotxes que van en contradireccio.
    xPos = (xPos + velo);
    if(xPos<-30){
      xPos = width+30;
    }
  }
}
class Boto{
  float xPos;
  float yPos;
  color c;
  float widthb;
  float heightb;
  int pantallactual;
  int pantalladesti;
  PFont fonBoto;
  String texte;
  
  Boto(){
  xPos = width/2;
  yPos = height/2;
  c = color(255,0,0);
  widthb = 50;
  heightb = 20;
  pantallactual = 1;
  pantalladesti = 2;
  fonBoto = createFont ("Georgia", 16);
  textFont(fonBoto);
  texte = "Botó";
  }
  
  Boto(float x, float y, color col, float w, float h, int inici, int fi, String t){
  xPos = x;
  yPos = y;
  c = col;
  widthb = w;
  heightb = h;
  pantallactual = inici;
  pantalladesti = fi;
  fonBoto = createFont ("Georgia", 16);
  textFont(fonBoto);
  texte = t;
  }
  void dibuixa(){
        strokeWeight(1);
    stroke(0);
    rectMode(CORNER);
    fill(c);
    rect(xPos, yPos, widthb, heightb);
    text(texte, xPos+10, yPos+5);
  }
  void apreta(){
    if((xPos <= mouseX && mouseX <= xPos + widthb && yPos <= mouseY && mouseY <= yPos + heightb)){
      println("ok");
      pantalla = pantalladesti;
    }
  }
}
  boolean collisio(float x, float y,float ranax, float ranay){
    //comprovacio de colisio: en aquesta funcio, entren les posicions de cada cotxe (d'un en un) i les posicions de la granota
    //si les posicions de la granota, entren dintre dels limits establerts dels cotxes, retornara true, sino retornara false
     return ((ranax>x-18&&ranax<x+18)&&(ranay>y-12&&ranay<y+12));
  }

  void Fons(){
    textAlign(LEFT);
    //metode que dibuixa el fons i els botons
    background(20);
    noStroke();
    rectMode(CENTER);
    fill(1,142,14);
    rect(width/2,height/5+37,width,height/12);
    fill(135,206,250);
    rect(width/2,height/8,width,height/4);
    fill(80);
    rect(width/2,440+100,width,125);
    stroke(90);
    for(int i = 0; i<width; i = i+20){
      line(i,380+100,i,height);
    }
    stroke(130);
    for(int i = 480; i<height; i = i+20){
      line(0,i,width,i);
    }
    stroke(255);
    strokeWeight(3);
    
    
    
    line(0,377+100,width/2-25,377+100);
    line(width/2+25,377+100,width,377+100);
    
    line(0,height/4+30,width,height/4+30);
  
    
    for(int i = -30; i<width; i = i + 100){
      strokeWeight(3);
      line (i+50,(height/2)+25,i+100,(height/2)+25);
    }
    
    
    
    strokeWeight(1);

    
    fill(255);
    rect(590+300,490,10,10);
    rect(570+300,490,10,10);
    rect(550+300,490,10,10);
    rect(510+300,490,10,10);
    rect(50,490,10,10);
    rect(210,490,10,10);
    fill(0);
    textAlign(CENTER);
    textSize(9);
    text("3",590+300,493);
    text("2",570+300,493);
    text("1",550+300,493);
    text("0",510+300,493);
    textSize(12);
    fill(255);
    text("Difficulty",570+300,475);
    text("Stop",510+300,475);
    text("Mouse",50,475);
    textAlign(LEFT);
    text("WASD (experimental)",150,475);
    rect(50,585,80,20);
  }
  
  void GameOver(){
    //metode que dibuixa la pantalla 'game over'
    background(0);
    textSize(40);
    fill(80);
    textAlign(CENTER);
    text("Game Over",width/2,height/2);
    fill(0,255,0);
    noStroke();
    rectMode(CENTER);
    rect(300+150,300+100,16,20);
    rect(300+11+150,300+6+100,5,7);
    rect(300-11+150,300+6+100,5,7);
    rect(300+11+150,300-4+100,5,7);
    rect(300-11+150,300-4+100,5,7);

    noStroke();
    rectMode(CENTER);
 
    fill(0);
    textSize(10);
    stroke(0);
    text("x",302+150,296+100);
    text("x",294+150,296+100);
    fill(255);
    rect(50,585,80,20);
    }
    
  void YouWin(){
    //metode que dibuixa la pantalla 'you win'
    background(135,206,250);
    fill(255);
    textAlign(CENTER);
    textSize(40);
    text("You Win!",width/2,height/2);
    rect(50,585,80,20);
  }
  
  void Cheater(){
    //metode que dibuixa la pantalla 'cheater'
    background(255,0,0);
    fill(0);
    textAlign(CENTER);
    textSize(40);
    text("F*** you, man, don't cheat",width/2,height/2);
    rect(50,585,80,20);
  
  }
class Ondas{

  int y= 600;
  int x = 0;
  //variable per a alternar el color de les linies
  int alternar = 1;
  
  float aleatori = random(100,250)-(mouseY-200);
  float red = random(1,255);
  float green = random(1,255);
  float blue = random(1,255);
  int sliderred = 0;
  int slidergreen = 0;
  int sliderblue = 0;  
  
  Ondas(){
  
    int y= 600;
    int x = 0;
    //variable per a alternar el color de les linies
    int alternar = 1;
    
    float aleatori = random(100,250)-(mouseY-200);
    float red = random(1,255);
    float green = random(1,255);
    float blue = random(1,255);
    int sliderred = 0;
    int slidergreen = 0;
    int sliderblue = 0;
  
  
  
  }
  void dibuixaOndas(){
    background(130);
    textAlign(LEFT);
        strokeWeight(1);
    stroke(0);
    rectMode(CORNER);
  sliderred = (int)red+42;
  slidergreen = (int)green+42;
  sliderblue = (int)blue+42;
  //Escala massiva. "Mentres x sigui menor a 600" = es repetira fins a que s'arribi a la dreta de la pantalla
  while(x<width){
    //"mentres y sigui major o igual que 0 i y sigui major que aleatori" = mentres Y no es passi de la part superior de la pantalla, 
    //i Y sigui major que aleatori (per a que fagi linies d'adalt a abaix fins a que s'arribi al maxim de cada barra, declarat en aquesta variable "aleatori")
    while(y>=0 && y>aleatori){
      
      if((alternar%2)==0){
        strokeWeight(2);
        stroke (red,green,blue);
        y = y-1;
      }
      else{
        strokeWeight(1);
        stroke(255,255,255);
      }
        line(x,y,x+10,y);   
        alternar = alternar+1;
        y= y-1;
    }
    
    //Si pulses el requadre que posa mouseY pot moure les barres cap abaix i cap avall
   /* if(boto==true){
    aleatori = random (100,250)+(mouseY-200);
    }else{*/
    aleatori = random (200,450);    
   // }
    //reinicialització de la variable y i augment de 12 a la x per poder fer la seguent barra
    y = 600;
    x = x+12;
  }
  strokeWeight(1);
  
  x = 0;
  y = 600;
  fill(255,255,255);
  stroke(0,0,0);
//  rect (0,383,40,16);
  fill(0,0,0);
  textSize(9);
 // text("mouseY",3,393);
  
  //Slides, per a poder cambiar el color de les barres. Al moure la posició de cada slide, canvies el color.
  
  if(mousePressed == true && mouseX>584+280 &&mouseX<596+280 && mouseY>sliderred-50 && mouseY<sliderred+25 && mouseY>=40 && mouseY<=300){
    sliderred = mouseY;
    red = sliderred-42;
  } 
   if(mousePressed == true && mouseX>583+280 &&mouseX<599+280 && mouseY>9 && mouseY<25){
    sliderred = 40;
    red = 1;
  } 
  
  if(mousePressed == true && mouseX>564+280 &&mouseX<576+280 && mouseY>slidergreen-25 && mouseY<slidergreen+25 && mouseY>=40 && mouseY<=300){
    slidergreen = mouseY;
    green = slidergreen-42;    
  } 
  if(mousePressed == true && mouseX>564+280 &&mouseX<582+280 && mouseY>9 && mouseY<25){
    slidergreen = 40;
    green = 1;
  } 
  
  if(mousePressed == true && mouseX>544+280 &&mouseX<556+280 && mouseY>sliderblue-25 && mouseY<sliderblue+25 && mouseY>=40 && mouseY<=300){
    sliderblue = mouseY;
    blue = sliderblue-42;    
  } 
  if(mousePressed == true && mouseX>544+280 &&mouseX<563+280 && mouseY>9 && mouseY<25){
    sliderblue = 40;
    blue = 1;
  } 
  
  if(mousePressed == true && mouseX>548+280 &&mouseX<593+280 && mouseY>318 && mouseY<363){
    red = random(1,255);
    green = random(1,255);
    blue = random(1,255);
  }
  //quadrats que formen la zona dels slides, i el text
  fill(255,255,255);
  rect(541+280,7,58,330);
  fill(0,0,0);
  rect(584+280,30,12,285);
  rect(564+280,30,12,285);
  rect(544+280,30,12,285);
  fill(255,255,255);
  rect(585+280,sliderred-5,10,10);
  rect(565+280,slidergreen-5,10,10);
  rect(545+280,sliderblue-5,10,10);
  rect(548+280,318,45,15);  
  fill(0,0,0);
  textSize(9);
  text("R",547+280,20);
  fill(0,0,0);
  text("G",567+280,20);
  fill(0,0,0);
  text("B",587+280,20);
  text("Random",553+280,328);
  
 

  }


}
void Menu(){
  background(0);
  fill(200);
  rect(20,200,20,20);

}
public class Rana{
  float xPos;
  float yPos;
  
  Rana(float x, float y){
    //constructor de la granota
    xPos = x;
    yPos = y;
  }
  
  void dibuixa(){
  //dibuix de la granota
  fill(0,255,0);
  noStroke();
  rectMode(CENTER);
  rect(xPos,yPos,12,15);
  rect(xPos+200-192,yPos+6,3,5);
  rect(xPos+200-208,yPos+6,3,5);
  rect(xPos+200-192,yPos-4,3,5);
  rect(xPos+200-208,yPos-4,3,5);
  fill(255);
  rect(xPos+200-197,yPos-6,2,3);
  rect(xPos+200-202,yPos-6,2,3);
  }

  void moure(float x, float y){
   xPos = x;
   yPos = y;
  }
}


