

float AvelX;
float AruidoX = -.00718;
float AvarX;
float AvelY;
float AruidoY = .00715;
float AvarY;


float BvelX;
float BruidoX = .00666;
float BvarX;
float BvelY;
float BruidoY = -.00669;
float BvarY;


float CvelX;
float CruidoX = .00635;
float CvarX;
float CvelY;
float CruidoY = .00632;
float CvarY;


float DvelX;
float DruidoX = .00555;
float DvarX;
float DvelY;
float DruidoY = -.00543;
float DvarY;

float EvelX;
float EruidoX = .00457;
float EvarX;
float EvelY;
float EruidoY = .00458;
float EvarY;

float FvelX;
float FruidoX = -.00213;
float FvarX;
float FvelY;
float FruidoY = .00222;
float FvarY;

float GvelX;
float GruidoX = .00585;
float GvarX;
float GvelY;
float GruidoY = .00583;
float GvarY;

float HvelX;
float HruidoX = -.00890;
float HvarX;
float HvelY;
float HruidoY = .00891;
float HvarY;

float contador;
float rot;


// - - - - - setuo

void setup (){
  
 size (800,800);
  background (230,250,100);
  frameRate (60);
smooth ();

  
  
}

// - - - - - - draw

void draw (){
  

translate (width/2,height/2);
rotate(radians(rot));
rot += 45.25;
  
  //circulos screen
  
    fill (230,255,100);
    stroke (0,0);
    rectMode (CENTER);
    rect (0,0,1100,1100);
  
  
  
  
    // a ver que pasa aqui en medio
    
    fill (0);
    ellipse (BvelX,AvelY, contador%10, contador%10);
  ellipse (AvelY,CvelX, contador%12, contador%12);
  ellipse (-DvelX,-AvelY, contador%14, contador%14);
  ellipse (-AvelY,-EvelX, contador%16, contador%16);
  ellipse (-FvelX,AvelY, contador%18, contador%18);
  ellipse (-AvelY,GvelX, contador%20, contador%20);
  ellipse (HvelX,-AvelY, contador%22, contador%22);
  ellipse (AvelY,-BvelX, contador%24, contador%24);
  
   ellipse (CvelX,BvelY, contador%11, contador%11);
  ellipse (BvelY,DvelX, contador%12, contador%12);
  ellipse (-EvelX,-BvelY, contador%13, contador%13);
  ellipse (-BvelY,-FvelX, contador%14, contador%14);
  ellipse (-GvelX,BvelY, contador%15, contador%15);
  ellipse (-BvelY,HvelX, contador%16, contador%16);
  ellipse (AvelX,-BvelY, contador%17, contador%17);
  ellipse (BvelY,-CvelX, contador%18, contador%18);
  
   ellipse (DvelX,CvelY, contador%5, contador%5);
  ellipse (CvelY,EvelX, contador%7, contador%7);
  ellipse (-FvelX,-CvelY, contador%9, contador%9);
  ellipse (-CvelY,-GvelX, contador%11, contador%11);
  ellipse (-AvelX,CvelY, contador%13, contador%13);
  ellipse (-CvelY,BvelX, contador%15, contador%15);
  ellipse (DvelX,-CvelY, contador%17, contador%17);
  ellipse (CvelY,-EvelX, contador%19, contador%19);
  
   ellipse (FvelX,DvelY, contador%15, contador%15);
  ellipse (DvelY,GvelX, contador%14, contador%14);
  ellipse (-AvelX,-DvelY, contador%17, contador%17);
  ellipse (-DvelY,-BvelX, contador%18, contador%18);
  ellipse (-CvelX,DvelY, contador%19, contador%19);
  ellipse (-DvelY,EvelX, contador%20, contador%20);
  ellipse (FvelX,-DvelY, contador%23, contador%23);
  ellipse (DvelY,-GvelX, contador%25, contador%25);
  
  
   fill (0);
  ellipse (AvelX,AvelY, contador%10, contador%10);
  ellipse (AvelY,AvelX, contador%12, contador%12);
  ellipse (-AvelX,-AvelY, contador%14, contador%14);
  ellipse (-AvelY,-AvelX, contador%16, contador%16);
  ellipse (-AvelX,AvelY, contador%18, contador%18);
  ellipse (-AvelY,AvelX, contador%20, contador%20);
  ellipse (AvelX,-AvelY, contador%22, contador%22);
  ellipse (AvelY,-AvelX, contador%24, contador%24);
  
   ellipse (BvelX,BvelY, contador%11, contador%11);
  ellipse (BvelY,BvelX, contador%12, contador%12);
  ellipse (-BvelX,-BvelY, contador%13, contador%13);
  ellipse (-BvelY,-BvelX, contador%14, contador%14);
  ellipse (-BvelX,BvelY, contador%15, contador%15);
  ellipse (-BvelY,BvelX, contador%16, contador%16);
  ellipse (BvelX,-BvelY, contador%17, contador%17);
  ellipse (BvelY,-BvelX, contador%18, contador%18);
  
   ellipse (CvelX,CvelY, contador%5, contador%5);
  ellipse (CvelY,CvelX, contador%7, contador%7);
  ellipse (-CvelX,-CvelY, contador%9, contador%9);
  ellipse (-CvelY,-CvelX, contador%11, contador%11);
  ellipse (-CvelX,CvelY, contador%13, contador%13);
  ellipse (-CvelY,CvelX, contador%15, contador%15);
  ellipse (CvelX,-CvelY, contador%17, contador%17);
  ellipse (CvelY,-CvelX, contador%19, contador%19);
  
   ellipse (DvelX,DvelY, contador%15, contador%15);
  ellipse (DvelY,DvelX, contador%14, contador%14);
  ellipse (-DvelX,-DvelY, contador%17, contador%17);
  ellipse (-DvelY,-DvelX, contador%18, contador%18);
  ellipse (-DvelX,DvelY, contador%19, contador%19);
  ellipse (-DvelY,DvelX, contador%20, contador%20);
  ellipse (DvelX,-DvelY, contador%23, contador%23);
  ellipse (DvelY,-DvelX, contador%25, contador%25);
  
   ellipse (EvelX,EvelY, contador%14, contador%14);
  ellipse (EvelY,EvelX, contador%16, contador%16);
  ellipse (-EvelX,-EvelY, contador%26, contador%26);
  ellipse (-EvelY,-EvelX, contador%24, contador%24);
  ellipse (-EvelX,EvelY, contador%6, contador%6);
  ellipse (-EvelY,EvelX, contador%17, contador%17);
  ellipse (EvelX,-EvelY, contador%21, contador%21);
  ellipse (EvelY,-EvelX, contador%12, contador%12);
  
  ellipse (FvelX,FvelY, contador%4, contador%4);
  ellipse (FvelY,FvelX, contador%5, contador%5);
  ellipse (-FvelX,-FvelY, contador%6, contador%6);
  ellipse (-FvelY,-FvelX, contador%7, contador%7);
  ellipse (-FvelX,FvelY, contador%8, contador%8);
  ellipse (-FvelY,FvelX, contador%9, contador%9);
  ellipse (FvelX,-FvelY, contador%11, contador%11);
  ellipse (FvelY,-FvelX, contador%13, contador%13);
  
    ellipse (GvelX,GvelY, contador%30, contador%30);
  ellipse (GvelY,GvelX, contador%24, contador%24);
  ellipse (-GvelX,-GvelY, contador%10, contador%10);
  ellipse (-GvelY,-GvelX, contador%9, contador%9);
  ellipse (-GvelX,GvelY, contador%15, contador%15);
  ellipse (-GvelY,GvelX, contador%10, contador%10);
  ellipse (GvelX,-GvelY, contador%12, contador%12);
  ellipse (GvelY,-GvelX, contador%16, contador%16);
  
  ellipse (HvelX,HvelY, contador%10, contador%10);
  ellipse (HvelY,HvelX, contador%10, contador%10);
  ellipse (-HvelX,-HvelY, contador%10, contador%10);
  ellipse (-HvelY,-HvelX, contador%10, contador%10);
  ellipse (-HvelX,HvelY, contador%10, contador%10);
  ellipse (-HvelY,HvelX, contador%10, contador%10);
  ellipse (HvelX,-HvelY, contador%10, contador%10);
  ellipse (HvelY,-HvelX, contador%10, contador%10);
  
  
  // en blanco 
  
   fill (0);

  
   ellipse (AvelX,EvelY, contador%14, contador%14);
  ellipse (EvelY,BvelX, contador%16, contador%16);
  ellipse (-CvelX,-EvelY, contador%26, contador%26);
  ellipse (-EvelY,-DvelX, contador%24, contador%24);
  ellipse (-FvelX,EvelY, contador%6, contador%6);
  ellipse (-EvelY,GvelX, contador%17, contador%17);
  ellipse (HvelX,-EvelY, contador%21, contador%21);
  ellipse (EvelY,-AvelX, contador%12, contador%12);
  
  ellipse (BvelX,FvelY, contador%4, contador%4);
  ellipse (FvelY,CvelX, contador%5, contador%5);
  ellipse (-DvelX,-FvelY, contador%6, contador%6);
  ellipse (-FvelY,-EvelX, contador%7, contador%7);
  ellipse (-GvelX,FvelY, contador%8, contador%8);
  ellipse (-FvelY,HvelX, contador%9, contador%9);
  ellipse (AvelX,-FvelY, contador%11, contador%11);
  ellipse (FvelY,-BvelX, contador%13, contador%13);
  
    ellipse (CvelX,GvelY, contador%30, contador%30);
  ellipse (GvelY,DvelX, contador%24, contador%24);
  ellipse (-EvelX,-GvelY, contador%10, contador%10);
  ellipse (-GvelY,-FvelX, contador%9, contador%9);
  ellipse (-HvelX,GvelY, contador%15, contador%15);
  ellipse (-GvelY,AvelX, contador%10, contador%10);
  ellipse (BvelX,-GvelY, contador%12, contador%12);
  ellipse (GvelY,-CvelX, contador%16, contador%16);
  
  ellipse (DvelX,HvelY, contador%10, contador%10);
  ellipse (HvelY,EvelX, contador%10, contador%10);
  ellipse (-FvelX,-HvelY, contador%10, contador%10);
  ellipse (-HvelY,-GvelX, contador%10, contador%10);
  ellipse (-AvelX,HvelY, contador%10, contador%10);
  ellipse (-HvelY,BvelX, contador%10, contador%10);
  ellipse (CvelX,-HvelY, contador%10, contador%10);
  ellipse (HvelY,-DvelX, contador%10, contador%10);
  
 // - - - - lo -ol -o - o- o -o -l
 
  ellipse (BvelX,0, contador%10, contador%10);
  ellipse (0,CvelX, contador%12, contador%12);
  ellipse (-DvelX,-0, contador%14, contador%14);
  ellipse (-0,-EvelX, contador%16, contador%16);
  ellipse (-FvelX,0, contador%18, contador%18);
  ellipse (-0,GvelX, contador%20, contador%20);
  ellipse (HvelX,-0, contador%22, contador%22);
  ellipse (0,-BvelX, contador%24, contador%24);
  
   ellipse (CvelX,0, contador%11, contador%11);
  ellipse (0,DvelX, contador%12, contador%12);
  ellipse (-EvelX,-0, contador%13, contador%13);
  ellipse (-0,-FvelX, contador%14, contador%14);
  ellipse (-GvelX,0, contador%15, contador%15);
  ellipse (-0,HvelX, contador%16, contador%16);
  ellipse (AvelX,-0, contador%17, contador%17);
  ellipse (0,-CvelX, contador%18, contador%18);
  
   ellipse (0,CvelY, contador%5, contador%5);
  ellipse (CvelY,0, contador%7, contador%7);
  ellipse (-0,-CvelY, contador%9, contador%9);
  ellipse (-0,-GvelX, contador%11, contador%11);
  ellipse (-AvelX,0, contador%13, contador%13);
  ellipse (-0,BvelX, contador%15, contador%15);
  ellipse (DvelX,-0, contador%17, contador%17);
  ellipse (CvelY,-0, contador%19, contador%19);
  
   ellipse (FvelX,0, contador%15, contador%15);
  ellipse (0,GvelX, contador%14, contador%14);
  ellipse (-AvelX,-0, contador%17, contador%17);
  ellipse (-0,-BvelX, contador%18, contador%18);
  ellipse (-CvelX,0, contador%19, contador%19);
  ellipse (-DvelY,0, contador%20, contador%20);
  ellipse (0,-DvelY, contador%23, contador%23);
  ellipse (0,-GvelX, contador%25, contador%25);
  
  
   fill (0);
  ellipse (0,AvelY, contador%10, contador%10);
  ellipse (0,AvelX, contador%12, contador%12);
  ellipse (-0,-AvelY, contador%14, contador%14);
  ellipse (-0,-AvelX, contador%16, contador%16);
  ellipse (-0,AvelY, contador%18, contador%18);
  ellipse (-0,AvelX, contador%20, contador%20);
  ellipse (0,-AvelY, contador%22, contador%22);
  ellipse (0,-AvelX, contador%24, contador%24);
  
   ellipse (BvelX,0, contador%11, contador%11);
  ellipse (BvelY,0, contador%12, contador%12);
  ellipse (-BvelX,-0, contador%13, contador%13);
  ellipse (-BvelY,-0, contador%14, contador%14);
  ellipse (-BvelX,0, contador%15, contador%15);
  ellipse (-BvelY,0, contador%16, contador%16);
  ellipse (BvelX,-0, contador%17, contador%17);
  ellipse (BvelY,-0, contador%18, contador%18);

   ellipse (0,CvelY, contador%5, contador%5);
  ellipse (0,CvelX, contador%7, contador%7);
  ellipse (-0,-CvelY, contador%9, contador%9);
  ellipse (-0,-CvelX, contador%11, contador%11);
  ellipse (-0,CvelY, contador%13, contador%13);
  ellipse (-0,CvelX, contador%15, contador%15);
  ellipse (0,-CvelY, contador%17, contador%17);
  ellipse (0,-CvelX, contador%19, contador%19);
  
   ellipse (DvelX,0, contador%15, contador%15);
  ellipse (DvelY,0, contador%14, contador%14);
  ellipse (-DvelX,-0, contador%17, contador%17);
  ellipse (-DvelY,-0, contador%18, contador%18);
  ellipse (-DvelX,0, contador%19, contador%19);
  ellipse (-DvelY,0, contador%20, contador%20);
  ellipse (DvelX,-0, contador%23, contador%23);
  ellipse (DvelY,-0, contador%25, contador%25);
  
   ellipse (0,EvelY, contador%14, contador%14);
  ellipse (0,EvelX, contador%16, contador%16);
  ellipse (-0,-EvelY, contador%26, contador%26);
  ellipse (-0,-EvelX, contador%24, contador%24);
  ellipse (-0,EvelY, contador%6, contador%6);
  ellipse (-0,EvelX, contador%17, contador%17);
  ellipse (0,-EvelY, contador%21, contador%21);
  ellipse (0,-EvelX, contador%12, contador%12);
  
  ellipse (FvelX,0, contador%4, contador%4);
  ellipse (FvelY,0, contador%5, contador%5);
  ellipse (-FvelX,-0, contador%6, contador%6);
  ellipse (-FvelY,-0, contador%7, contador%7);
  ellipse (-FvelX,0, contador%8, contador%8);
  ellipse (-FvelY,0, contador%9, contador%9);
  ellipse (FvelX,-0, contador%11, contador%11);
  ellipse (FvelY,-0, contador%13, contador%13);
  
    ellipse (0,GvelY, contador%30, contador%30);
  ellipse (0,GvelX, contador%24, contador%24);
  ellipse (-0,-GvelY, contador%10, contador%10);
  ellipse (-0,-GvelX, contador%9, contador%9);
  ellipse (-0,GvelY, contador%15, contador%15);
  ellipse (-0,GvelX, contador%10, contador%10);
  ellipse (0,-GvelY, contador%12, contador%12);
  ellipse (0,-GvelX, contador%16, contador%16);
  
  ellipse (HvelX,0, contador%10, contador%10);
  ellipse (HvelY,0, contador%10, contador%10);
  ellipse (-HvelX,-0, contador%10, contador%10);
  ellipse (-HvelY,-0, contador%10, contador%10);
  ellipse (-HvelX,0, contador%10, contador%10);
  ellipse (-HvelY,0, contador%10, contador%10);
  ellipse (HvelX,-0, contador%10, contador%10);
  ellipse (HvelY,-0, contador%10, contador%10);
  
  
  // en blanco 
  
   fill (0);

  
   ellipse (0,EvelY, contador%14, contador%14);
  ellipse (0,BvelX, contador%16, contador%16);
  ellipse (-0,-EvelY, contador%26, contador%26);
  ellipse (-0,-DvelX, contador%24, contador%24);
  ellipse (-0,EvelY, contador%6, contador%6);
  ellipse (-0,GvelX, contador%17, contador%17);
  ellipse (0,-EvelY, contador%21, contador%21);
  ellipse (0,-AvelX, contador%12, contador%12);
  
  ellipse (0,FvelY, contador%4, contador%4);
  ellipse (0,CvelX, contador%5, contador%5);
  ellipse (-0,-FvelY, contador%6, contador%6);
  ellipse (-0,-EvelX, contador%7, contador%7);
  ellipse (-GvelX,0, contador%8, contador%8);
  ellipse (-FvelY,0, contador%9, contador%9);
  ellipse (AvelX,-0, contador%11, contador%11);
  ellipse (FvelY,-0, contador%13, contador%13);
  
    ellipse (CvelX,0, contador%30, contador%30);
  ellipse (GvelY,0, contador%24, contador%24);
  ellipse (-EvelX,-0, contador%10, contador%10);
  ellipse (-GvelY,-0, contador%9, contador%9);
  ellipse (-0,GvelY, contador%15, contador%15);
  ellipse (-0,AvelX, contador%10, contador%10);
  ellipse (0,-GvelY, contador%12, contador%12);
  ellipse (0,-CvelX, contador%16, contador%16);
  
  ellipse (DvelX,0, contador%10, contador%10);
  ellipse (HvelY,0, contador%10, contador%10);
  ellipse (-FvelX,-0, contador%10, contador%10);
  ellipse (-HvelY,-0, contador%10, contador%10);
  ellipse (-AvelX,0, contador%10, contador%10);
  ellipse (-HvelY,0, contador%10, contador%10);
  ellipse (CvelX,-0, contador%10, contador%10);
  ellipse (HvelY,-0, contador%10, contador%10);
  
  // a ver
  
  
  
  stroke(0,0); 
  fill(230,255,100,0);
  ellipse (0,0,AvelX+90,AvelX+90);
  fill(255);
  ellipse (0,0,AvelY,AvelY);
  
  
  
  
 stroke(0,0);
  fill(210,255,0);
  ellipse (0,0,BvelX+80,BvelX+80);
  fill(255);
  ellipse (0,0,BvelY,BvelY);
  
 stroke(0,0);
  fill(210,255,0);
  ellipse (0,0,CvelX+50,CvelX+50);
  fill(255);
  ellipse (0,0,CvelY,CvelY);
    
 stroke(0,0);
  fill(210,255,0);
  ellipse (0,0,DvelX+5,DvelX+35);
  fill(255);
  ellipse (0,0,DvelY,DvelY);
  
  
  
   stroke(0,0);
  fill(210,255,0);
  ellipse (0,0,EvelX+30,EvelX+30);
  fill(255);
  ellipse (0,0,EvelY,EvelY);
  
   stroke(0,0);
  fill(210,255,0);
  ellipse (0,0,FvelX+25,FvelX+25);
  fill(255);
  ellipse (0,0,FvelY,FvelY);
  

  
   stroke(0,0);
  fill(210,255,0);
  ellipse (0,0,GvelX+10,GvelX+10);
  fill(255);
  ellipse (0,0,GvelY,GvelY);
  
   stroke(0,0);
  fill(210,255,0);
  ellipse (0,0,HvelX+5,HvelX+5);
  fill(255);
  ellipse (0,0,HvelY,HvelY);
  
  
   
  
  
  contador ++;
  
  //ahora calculamos los valores de todo


  AvelX = noise(AvarX)*width/2;
  AvarX += AruidoX;
  AvelY = noise(AvarY)*width/2;
  AvarY += AruidoY;

  BvelX = noise(BvarX)*width/2;
  BvarX += BruidoX;
  BvelY = noise(BvarY)*width/2;
  BvarY += BruidoY;

  CvelX = noise(CvarX)*width/2;
  CvarX += CruidoX;
  CvelY = noise(CvarY)*width/2;
  CvarY += CruidoY;

  DvelX = noise(DvarX)*width/2;
  DvarX += DruidoX;
  DvelY = noise(DvarY)*width/2;
  DvarY += DruidoY;
  
  EvelX = noise(EvarX)*width/2;
  EvarX += EruidoX;
  EvelY = noise(EvarY)*width/2;
  EvarY += EruidoY;

  FvelX = noise(FvarX)*width/2;
  FvarX += FruidoX;
  FvelY = noise(FvarY)*width/2;
  FvarY += FruidoY;

  GvelX = noise(GvarX)*width/2;
  GvarX += GruidoX;
  GvelY = noise(GvarY)*width/2;
  GvarY += GruidoY;

  HvelX = noise(HvarX)*width/2;
  HvarX +=HruidoX;
  HvelY = noise(HvarY)*width/2;
  HvarY += HruidoY;
  




  
}



