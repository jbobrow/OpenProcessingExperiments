
//Advertència! si el centre de dos elements s'aproximen massa passen a tindre el mateix centre i a moures com un sol element i 
//no poden ser separats, s'ha de clicar a borrar per a poder tornar a utilitzar-los per separat.

int ullesquerraxf = 500;
int ullesquerrayf = 300;
int ulldretxf = 650;
int ulldretyf = 300;
int caraxf = 600;
int carayf = 300;
int orelladretaxf = 800;
int orelladretayf = 300;
int orellaesquerraxf = 350;
int orellaesquerrayf = 300;
int perillaxf = 350;
int perillayf = 500;
int cabellxf = 600;
int cabellyf =200;
int cellaesquerraxf = 200;
int cellaesquerrayf =200;
int celladretaxf =400;
int celladretayf =200;
int nasxf = 800;
int nasyf = 500;
int bocaxf = 800;
int bocayf = 100;
int coresquerraxf = 100;
int coresquerrayf = 100;
int cordretxf = 100;
int cordretyf = 200;
int boinax = 150;
int boinay = 100;


boolean ullesquerrab = false;
boolean ulldretb = false;
boolean carab = false;
boolean orelladretab = false;
boolean orellaesquerrab = false;
boolean perilla = false;
boolean cabell = false;
boolean celladreta = false;
boolean cellaesquerra = false;
boolean nas = false;
boolean boca = false;
boolean coresquerra = false;
boolean cordret = false;
boolean boina = false;


void setup(){
  size(900,600);

}
void draw(){
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
  text("ull", 19,590); 
  text("ull", 9, 569); 
  text("cara", 9, 548); 
  text("orella", 9, 527); 
  text("orella", 9, 506); 
  text("perilla",9, 485); 
  text("cabell",9, 464); 
  text("nas", 9, 443); 
  text("boca", 9, 422); 
  text("cella", 9, 401);
  text("cella", 9, 380);
  text("David B", 5, 369);
  text("cor", 9, 350);
  text("cor", 9, 330);
  text("Dani G", 7, 313);
  text("Boina",9,295);
  text("Xavi G",7,275); 
  


  //clear - boto d'esborrar-ho tot
  if(mousePressed == true && mouseX>=860&&mouseX<=900&&mouseY>=580&&mouseY<=600){
     ullesquerrab = false;
     ulldretb = false;
     carab = false;
     orelladretab = false;
     orellaesquerrab = false;
     perilla = false;
     cabell = false;
     celladreta = false;
     cellaesquerra = false;
     nas = false;
     boca = false;
     coresquerra = false;
     cordret = false;
     boina = false;
     ullesquerraxf = 500;
      ullesquerrayf = 300;
      ulldretxf = 650;
      ulldretyf = 300;
      caraxf = 600;
      carayf = 300;
      orelladretaxf = 800;
      orelladretayf = 300;
      orellaesquerraxf = 350;
      orellaesquerrayf = 300;
      perillaxf = 350;
      perillayf = 500;
      cabellxf = 600;
      cabellyf =200;
      cellaesquerraxf = 200;
      cellaesquerrayf =200;
      celladretaxf =400;
      celladretayf =200;
      nasxf = 800;
      nasyf = 500;
      bocaxf = 800;
      bocayf = 100;
      coresquerraxf = 100;
      coresquerrayf = 100;
      cordretxf = 100;
      cordretyf = 200;
      boinax = 150;
      boinay = 100;
  }
  
  
  //Orella esquerra
  //click sobre el requadre del menú corresponent a l'orella
   if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=517&&mouseY<=537){
    orellaesquerrab = true;
  }
  //si has clickat en el nas al menú, es dibuixarà l'orella, i si pulses sobre aquest, en un rang determinat, pots moure-la
  if (orellaesquerrab == true){ 
    fill (#FCD0B4);
    ellipse(orellaesquerraxf,orellaesquerrayf,20,90);
    fill(#000000);    
    ellipse(orellaesquerraxf,orellaesquerrayf,5,20);
  if(mousePressed == true&&mouseX>orellaesquerraxf-30&&mouseX<orellaesquerraxf+30&&mouseY>orellaesquerrayf-30&&mouseY<orellaesquerrayf+30){
    orellaesquerraxf=mouseX;
    orellaesquerrayf=mouseY;
  } 
  }
  
  
  //Orella dreta
     if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=496&&mouseY<=516){
    orelladretab = true;
  }
  if (orelladretab == true){ 
    fill (#FCD0B4);
    ellipse(orelladretaxf,orelladretayf,20,90);
    fill(#000000);    
    ellipse(orelladretaxf,orelladretayf,5,20);
  if(mousePressed == true&&mouseX>orelladretaxf-30&&mouseX<orelladretaxf+30&&mouseY>orelladretayf-30&&mouseY<orelladretayf+30){
    orelladretaxf=mouseX;
    orelladretayf=mouseY;
  } 
  }


//cara
   if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=538&&mouseY<=558){
    carab = true;
  }
  if (carab == true){ 
      //cara
  fill (#FCD0B4);
  ellipse (caraxf,carayf, 350, 500);
  if(mousePressed == true&&mouseX>caraxf-30&&mouseX<caraxf+30&&mouseY>carayf-30&&mouseY<carayf+30){
    caraxf=mouseX;
    carayf=mouseY;
  } 
  }
 
 
 
 
 
 //Ull esquerra
  if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=580&&mouseY<=600){
    ullesquerrab = true;
  }
  if (ullesquerrab == true){ 
    //ulls
      fill(#FFFFFF);
      stroke(#000000);
      ellipse(ullesquerraxf,ullesquerrayf,70,60);
      fill(#0070B8);
      ellipse(ullesquerraxf,ullesquerrayf,35,30);
      fill(#000000);
      ellipse(ullesquerraxf,ullesquerrayf,23,18);
  if(mousePressed == true&&mouseX>ullesquerraxf-30&&mouseX<ullesquerraxf+30&&mouseY>ullesquerrayf-30&&mouseY<ullesquerrayf+30){
    ullesquerraxf=mouseX;
    ullesquerrayf=mouseY;
  } 
    
  }
  
  //Ull dret
   if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=559&&mouseY<=579){
    ulldretb = true;
  }
  if (ulldretb == true){ 
    //ulls
      fill(#FFFFFF);
      stroke(#000000);
      ellipse(ulldretxf,ulldretyf,70,60);
      fill(#0070B8);
      ellipse(ulldretxf,ulldretyf,35,30);
      fill(#000000);
      ellipse(ulldretxf,ulldretyf,23,18);
  if(mousePressed == true&&mouseX>ulldretxf-30&&mouseX<ulldretxf+30&&mouseY>ulldretyf-30&&mouseY<ulldretyf+30){
    ulldretxf=mouseX;
    ulldretyf=mouseY;
  }
    
  }
  
  



//nas
  if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=433&&mouseY<=453){
    nas = true;
  }
  if (nas == true){ 
  //nas
  stroke(#000000);
  line(nasxf-10,nasyf+(291-340),nasxf-15,nasyf+(334-340));
  line(nasxf+10,nasyf+(291-340),nasxf+15,nasyf+(334-340));
 noFill();
  arc(nasxf, nasyf, 60, 60,PI-0.50,PI+QUARTER_PI);
  arc(nasxf, nasyf, 60, 60,TWO_PI-0.75,TWO_PI+0.45);
  arc(nasxf, nasyf+3, 40, 30,TWO_PI,TWO_PI+PI);
  if(mousePressed == true&&mouseX>nasxf-30&&mouseX<nasxf+30&&mouseY>nasyf-30&&mouseY<nasyf+30){
    nasxf=mouseX;
    nasyf=mouseY;
  }
    
  }





//Boca
     if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=412&&mouseY<=432){
    boca = true;
  }
  if (boca == true){
   //boca
    fill(#FFFFFF);
    arc(bocaxf, bocayf, 130, 80, 0, PI, OPEN);
    line(bocaxf+(235-300),bocayf+(419-420),bocaxf+(365-300),bocayf+(419-420));
  if(mousePressed == true&&mouseX>bocaxf-30&&mouseX<bocaxf+30&&mouseY>bocayf-30&&mouseY<bocayf+30){
    bocaxf=mouseX;
    bocayf=mouseY;
  }
  

    
  }

  
  
  
  //perilla
     if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=475&&mouseY<=495){
    perilla = true;
  }
  if (perilla == true){
   fill(#480C0C);
  stroke(#480C0C); 
    //Perilla esquerra
  triangle(perillaxf-39,perillayf-48,perillaxf-69,perillayf+1,perillaxf-35,perillayf+18);
  triangle(perillaxf-39,perillayf-48,perillaxf-35,perillayf+18,perillaxf,perillayf-20);
  //perilla dreta
  triangle(perillaxf+39,perillayf-48,perillaxf+69,perillayf+1,perillaxf+35,perillayf+18); 
  triangle(perillaxf+39,perillayf-48,perillaxf+35,perillayf+18,perillaxf,perillayf-20);
  //Perilla centre
  triangle(perillaxf,perillayf-20,perillaxf+35,perillayf+18,perillaxf-35,perillayf+18);
  triangle(perillaxf,perillayf+25,perillaxf+35,perillayf+18,perillaxf-35,perillayf+18);
  if(mousePressed == true&&mouseX>perillaxf-30&&mouseX<perillaxf+30&&mouseY>perillayf-30&&mouseY<perillayf+30){
    perillaxf=mouseX;
    perillayf=mouseY;
  }
    
  }
  
  
  
  
  //cabell
       if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=454&&mouseY<=474){
    cabell = true;
  }
  if (cabell == true){
    fill(#480C0C);
  stroke(#480C0C);
    //Part esquerra
  triangle(cabellxf+(143-300),cabellyf+(188-91),cabellxf+(164-300),cabellyf+(143-91),cabellxf+(182-300),cabellyf+(161-91));
  triangle(cabellxf+(164-300),cabellyf+(143-91),cabellxf+(182-300),cabellyf+(161-91),cabellxf+(198-300),cabellyf+(97-91));
  triangle(cabellxf+(182-300),cabellyf+(161-91),cabellxf+(236-300),cabellyf+(138-91),cabellxf,cabellyf);
  triangle(cabellxf+(182-300),cabellyf+(161-91),cabellxf+(198-300),cabellyf+(97-91),  cabellxf,cabellyf);
  triangle(cabellxf+(198-300),cabellyf+(97-91),  cabellxf,cabellyf,  cabellxf+(227-300),cabellyf+(73-91));
  triangle(cabellxf,cabellyf,  cabellxf,cabellyf+(129-91),  cabellxf+(236-300),cabellyf+(138-91));
  triangle(cabellxf+(262-300),cabellyf+(56-91),cabellxf+(227-300),cabellyf+(73-91),  cabellxf,cabellyf);
  triangle(cabellxf,cabellyf+(50-91),cabellxf,cabellyf,cabellxf+(262-300),cabellyf+(56-91));
  //part dreta
  triangle(cabellxf,cabellyf+(50-91),cabellxf,cabellyf,  cabellxf+(338-300),cabellyf+(56-91));
  triangle(cabellxf+(338-300),cabellyf+(56-91),cabellxf+(373-300),cabellyf+(73-91),  cabellxf,cabellyf); 
  triangle(cabellxf,cabellyf,  cabellxf,cabellyf+(129-91),  cabellxf+(364-300),cabellyf+(138-91));
  triangle(cabellxf+(402-300),cabellyf+(97-91),  cabellxf,cabellyf,  cabellxf+(373-300),cabellyf+(73-91)); 
  triangle(cabellxf+(418-300),cabellyf+(161-91),cabellxf+(402-300),cabellyf+(97-91),  cabellxf,cabellyf);
  triangle(cabellxf+(418-300),cabellyf+(161-91),cabellxf+(364-300),cabellyf+(138-91),  cabellxf,cabellyf);
  triangle(cabellxf+(436-300),cabellyf+(143-91),  cabellxf+(418-300),cabellyf+(161-91),  cabellxf+(402-300),cabellyf+(97-91));
  triangle(cabellxf+(457-300),cabellyf+(188-91),  cabellxf+(436-300),cabellyf+(143-91),  cabellxf+(418-300),cabellyf+(161-91));
  if(mousePressed == true&&mouseX>cabellxf-30&&mouseX<cabellxf+30&&mouseY>cabellyf-30&&mouseY<cabellyf+30){
    cabellxf=mouseX;
    cabellyf=mouseY;
  }
    
  }







//cella esquerra
       if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=391&&mouseY<=411){
    cellaesquerra = true;
  }
  if (cellaesquerra == true){
        fill(#480C0C);
  stroke(#480C0C);
  //Cella esquerra (de esquerra a dreta)
  triangle(cellaesquerraxf+(187-217),cellaesquerrayf+(205-210),cellaesquerraxf+(205-217),cellaesquerrayf+(218-210),cellaesquerraxf+(161-217),cellaesquerrayf+(238-210));
  triangle(cellaesquerraxf+(187-217),cellaesquerrayf+(205-210),cellaesquerraxf+(205-217),cellaesquerrayf+(218-210),cellaesquerraxf+(234-217),cellaesquerrayf+(205-210));
  triangle(cellaesquerraxf+(205-217),cellaesquerrayf+(218-210),cellaesquerraxf+(234-217),cellaesquerrayf+(205-210),cellaesquerraxf+(254-217),cellaesquerrayf+(212-210));
  triangle(cellaesquerraxf+(230-217),cellaesquerrayf+(215-210),cellaesquerraxf+(254-217),cellaesquerrayf+(212-210),cellaesquerraxf+(260-217),cellaesquerrayf+(223-210));
  if(mousePressed == true&&mouseX>cellaesquerraxf-30&&mouseX<cellaesquerraxf+30&&mouseY>cellaesquerrayf-20&&mouseY<cellaesquerrayf+20){
    cellaesquerraxf=mouseX;
    cellaesquerrayf=mouseY;
  }
    
  }

//cella dreta
       if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=370&&mouseY<=390){
    celladreta = true;
  }
  if (celladreta == true){
        fill(#480C0C);
  stroke(#480C0C);
  //cella dreta (de dreta a esquerra
  triangle(celladretaxf+(340-380),celladretayf+(223-211),celladretaxf+(346-380),celladretayf+(212-211),celladretaxf+(370-380),celladretayf+(215-211));
  triangle(celladretaxf+(346-380),celladretayf+(212-211),celladretaxf+(366-380),celladretayf+(205-211),celladretaxf+(397-380),celladretayf+(218-211));
  triangle(celladretaxf+(413-380),celladretayf+(205-211),celladretaxf+(397-380),celladretayf+(218-211),celladretaxf+(366-380),celladretayf+(205-211));
  triangle(celladretaxf+(397-380),celladretayf+(218-211),celladretaxf+(413-380),celladretayf+(205-211),celladretaxf+(439-380),celladretayf+(238-211));
  
  if(mousePressed == true&&mouseX>celladretaxf-30&&mouseX<celladretaxf+30&&mouseY>celladretayf-20&&mouseY<celladretayf+20){
    celladretaxf=mouseX;
    celladretayf=mouseY;
  }
    
  }
  
  
  
  
  //boina - Xavi Garcia
   if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=280&&mouseY<=299){
    boina = true;
  }
  //si has clickat en el nas al menú, es dibuixarà l'orella, i si pulses sobre aquest, en un rang determinat, pots moure-la
  if (boina == true){ 
  fill (0,0,0);
  stroke (0,0,0);
  ellipse (boinax,boinay+(100-81),405,135);
  fill(255,0,0);
  stroke (255,0,0);
  rect (boinax+(295-300),boinay+(65-81),10,35);
  if(mousePressed == true&&mouseX>boinax-30&&mouseX<boinax+30&&mouseY>boinay-30&&mouseY<boinay+30){
    boinax=mouseX;
    boinay=mouseY;
  } 
  }
  
  //cor esquerra - Dani Gonzalez
   if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=340&&mouseY<=359){
    coresquerra = true;
  }
  if (coresquerra == true){ 
    noStroke();
  fill(0); 
  rect(coresquerraxf+(100-135),coresquerrayf+(90-105),70,20);
  rect(coresquerraxf+(110-135),coresquerrayf+(80-105),20,40);
  rect(coresquerraxf+(140-135),coresquerrayf+(80-105),20,40);
  rect(coresquerraxf+(120-135),coresquerrayf+(120-105),30,10);
  fill(#FF0000);
  rect(coresquerraxf+(110-135),coresquerrayf+(90-105),20,20);
  rect(coresquerraxf+(140-135),coresquerrayf+(90-105),20,20);
  rect(coresquerraxf+(120-135),coresquerrayf+(100-105),30,20);
  rect(coresquerraxf+(130-135),coresquerrayf+(120-105),10,20);
  fill(0);
   rect(coresquerraxf+(130-135),coresquerrayf+(130-105),10,10);
  if(mousePressed == true&&mouseX>coresquerraxf-30&&mouseX<coresquerraxf+30&&mouseY>coresquerrayf-30&&mouseY<coresquerrayf+30){
    coresquerraxf=mouseX;
    coresquerrayf=mouseY;
  } 
  }
 
 
     //cor dret - Dani Gonzalez
   if(mousePressed == true && mouseX>=0&&mouseX<=40&&mouseY>=320&&mouseY<=339){
    cordret = true;
  }
  if (cordret == true){ 
    noStroke();
  fill(0); 
  rect(cordretxf+(100-135),cordretyf+(90-105),70,20);
  rect(cordretxf+(110-135),cordretyf+(80-105),20,40);
  rect(cordretxf+(140-135),cordretyf+(80-105),20,40);
  rect(cordretxf+(120-135),cordretyf+(120-105),30,10);
  fill(#FF0000);
  rect(cordretxf+(110-135),cordretyf+(90-105),20,20);
  rect(cordretxf+(140-135),cordretyf+(90-105),20,20);
  rect(cordretxf+(120-135),cordretyf+(100-105),30,20);
  rect(cordretxf+(130-135),cordretyf+(120-105),10,20);
  fill(0);
  rect(cordretxf+(130-135),cordretyf+(130-105),10,10);
  if(mousePressed == true&&mouseX>cordretxf-30&&mouseX<cordretxf+30&&mouseY>cordretyf-30&&mouseY<cordretyf+30){
    cordretxf=mouseX;
    cordretyf=mouseY;
  } 
  }

}
