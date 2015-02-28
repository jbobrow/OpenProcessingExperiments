
/****** MODEL DE PROBLEMA DE MATES *******/

void pantalla5(){
  //valors fixes de la pantalla
  background(loadImage("pizarra.jpeg"));
  fill(255,54,85);
  text("Has sacado un "+resultatDau+"."+" Te encuentras en la casilla "+jugador1.posicioTauler,100,60);
  fill(0,0,255);
  textFont(letra,18);
  text(enunciat2, 100, 200);
  text(correcte,100,350);
  text("(Escribe aqui tu respuesta)",100,280);
  text(resposta+(frameCount/10 % 2 == 0 ? "_" : ""),100,250);
  
  
  /*no escriure la d quan tirem el dau*/
  if(key == 'd' || key == 'D'){
    resposta = "";
  }//cierra if
  
  /**************************************EXERCICI 1***************************************/
  if(resultatProblema == 1){
    
    text("Calcula el área de un rectángulo de 6m de base y 4m de altura", 100, 100);
    if(resposta.equals("24") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }  
    if(resposta.equals("24") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
    /*dibuix d'ajuda*
    stroke(100);
      fill(255,255,0);
    rect(600,300,200,350);
    fill(0,0,255);
    //text("4 m",390,95);
    //text("6 m",295,215);*/
  }//***********************************************************************************fi p1
  
  /***************************************EXERCICI 2****************************************/
  if(resultatProblema == 2){
    text("Calcula el área de un triángulo de 4m de base i 7m de altura",100,100);
    if(resposta.equals("14") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("14") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p2***********************************************************************************
  
  /***************************************EXERCICI 3****************************************/
  if(resultatProblema == 3){
    text("Calcula el área de un cuadrado de lado igual a raíz de 2",100,100);
    if(resposta.equals("2") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("2") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p3********************************************************************************
  
  /***************************************EXERCICI 4****************************************/
  if(resultatProblema == 4){
    text("Calcula el área de un cuadrado con un perímetro de 24cm",100,100);
    if(resposta.equals("36") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("36") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p4********************************************************************************
  
    /***************************************EXERCICI 5****************************************/
  if(resultatProblema == 5){
    text("Las diagonales de un rombo valen 18 i 12 cm. Calcula su área",100,100);
    if(resposta.equals("108") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("108") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p5********************************************************************************
  
    /***************************************EXERCICI 6****************************************/
  if(resultatProblema == 6){
    text("Calcula el área de un hexágono regular si uno de sus lados vale 15 cm \n y su apotema vale 13 cm",100,100);
    if(resposta.equals("585") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("585") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p6********************************************************************************
  
    /***************************************EXERCICI 7****************************************/
  if(resultatProblema == 7){
    text("Calcula el área de un trapecio cuyas bases valen 22 i 13 cm. \n Su altura vale 4 cm.",100,100);
    if(resposta.equals("70") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("70") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p7********************************************************************************
  
    /***************************************EXERCICI 8****************************************/
  if(resultatProblema == 8){
    text("Calcula el área de un enneágono cuyo perímetro vale 81cm y su apotema 12cm",100,100);
    if(resposta.equals("486") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("486") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p8********************************************************************************
  
    /***************************************EXERCICI 9****************************************/
  if(resultatProblema == 9){
    text("Calcula el área de un triángulo de base 12cm y una altura 4 veces menor que su base",100,100);
    if(resposta.equals("18") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("18") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p9********************************************************************************
  
    /***************************************EXERCICI 10****************************************/
  if(resultatProblema == 10){
    text("¿Cuál es el perímetro de un decágono de 5,7 cm de lado?",100,100);
    if(resposta.equals("57") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("57") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p10********************************************************************************
  
     /***************************************EXERCICI 11****************************************/
  if(resultatProblema == 11){
    text("Calcula el área de un rombo cuyas diagonales valen 50 y 25 cm.",100,100);
    if(resposta.equals("625") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("625") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p11********************************************************************************
  
     /***************************************EXERCICI 12****************************************/
  if(resultatProblema == 12){
    text("Si una portería mide 7.4 de ancho por 2.5 m de alto,\n ¿qué área defenderá el portero?",100,100);
    if(resposta.equals("18.5") == true || resposta.equals("18,5") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("18.5") == false  || resposta.equals("18,5") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p12********************************************************************************
  
     /***************************************EXERCICI 13****************************************/
  if(resultatProblema == 13){
    text("Calcula el perímetro de un dodecaedro de 12cm de lado",100,100);
    if(resposta.equals("144") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("144") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p13********************************************************************************
  
     /***************************************EXERCICI 14****************************************/
  if(resultatProblema == 14){
    text("¿Qué área tendrá un triángulo de base 46 cm cuya altura equivale \n a la mitad de su base?",100,100);
    if(resposta.equals("529") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("529") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p14********************************************************************************
  
     /***************************************EXERCICI 15****************************************/
  if(resultatProblema == 15){
    text("Calcula el área total de una valla de jardín que esta formada por 120 cuadrados de lado 14 cm",100,100);
    if(resposta.equals("23520") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("23520") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p15********************************************************************************
  
     /***************************************EXERCICI 16****************************************/
  if(resultatProblema == 16){
    text("¿Qué perímetro tendrá un rectángulo de cuyos lados miden 5 i 7 cm?",100,100);
    if(resposta.equals("24") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("24") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p16********************************************************************************
  
     /***************************************EXERCICI 17****************************************/
  if(resultatProblema == 17){
    text("¿Cuánto mide el lado de un cuadrado cuya área vale 225 cm cuadrados?",100,100);
    if(resposta.equals("15") == true){
      fill(0,255,0);
      text("SI",400,350);
      nombrePantalla = 2;
    }
    if(resposta.equals("15") == false){
      fill(255,0,0);
      text("NO",400,350);
    }
  }//fi p17********************************************************************************
  
 //amb teclat
  if( key == 'q' || key == 'Q'){
    
      //assignem clicant la lletra R la pantalla del joc.
      nombrePantalla = 2;
   
  }//cierra if

}//cierra la pantalla5

