
// hecho por ssbeltran... en serio tengo que aprender a hacer classes y arrays.
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
float EruidoY = .00658;
float EvarY;

float FvelX;
float FruidoX = -.00513;
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
float HruidoX = -.00790;
float HvarX;
float HvelY;
float HruidoY = .00891;
float HvarY;

//
float rot;

// - - - - - setuo

void setup (){
size (800,800);
background (255);
frameRate (60);
smooth ();

  
  
}

// - - - - - - draw

void draw (){
  

rotate(radians(rot));


  //circulos screen
  

    background (210,255,50);

  
  
    // a ver que pasa aqui en medio
    
    


    
fill (0);
stroke (255);
line (AvelX,AvelY, 100,800);
line (BvelX,BvelY, 200,800);
line (CvelX,CvelY, 300,800);
line (DvelX,DvelY, 400,800);
line (EvelX,EvelY, 500,800);
line (FvelX,FvelY, 600,800);
line (GvelX,GvelY, 700,800);
line (AvelX,AvelY, 100,0);
line (AvelX,AvelY, 100,0);
line (BvelX,BvelY, 200,0);
line (CvelX,CvelY, 300,0);
line (DvelX,DvelY, 400,0);
line (EvelX,EvelY, 500,0);
line (FvelX,FvelY, 600,0);
line (GvelX,GvelY, 700,0);
line (AvelX,AvelY, 0,100);
line (BvelX,BvelY, 0,200);
line (CvelX,CvelY, 0,300);
line (DvelX,DvelY, 0,400);
line (EvelX,EvelY, 0,500);
line (FvelX,FvelY, 0,600);
line (GvelX,GvelY, 0,700);
line (AvelX,AvelY, 800,100);
line (BvelX,BvelY, 800,200);
line (CvelX,CvelY, 800,300);
line (DvelX,DvelY, 800,400);
line (EvelX,EvelY, 800,500);
line (FvelX,FvelY, 800,600);
line (GvelX,GvelY, 800,700);



stroke (0,0);
fill (255,150);
beginShape (POLYGON);
vertex (AvelX,AvelY);
vertex (BvelX,BvelY);
vertex (CvelX,CvelY);
vertex (DvelX,DvelY);
vertex (EvelX,EvelY);
vertex (FvelX,FvelY);
vertex (GvelX,GvelY);
endShape ();



    stroke (0,0);
fill (0);
ellipse (AvelX,AvelY, 10,10);
ellipse (BvelX,BvelY, 10,10);
ellipse (CvelX,CvelY, 10,10);
ellipse (DvelX,DvelY, 10,10);
ellipse (EvelX,EvelY, 10,10);
ellipse (FvelX,FvelY, 10,10);
ellipse (GvelX,GvelY, 10,10);

  
  //ahora calculamos los valores de todo


  AvelX = noise(AvarX)*width;
  AvarX += AruidoX;
  AvelY = noise(AvarY)*width;
  AvarY += AruidoY;

  BvelX = noise(BvarX)*width;
  BvarX += BruidoX;
  BvelY = noise(BvarY)*width;
  BvarY += BruidoY;

  CvelX = noise(CvarX)*width;
  CvarX += CruidoX;
  CvelY = noise(CvarY)*width;
  CvarY += CruidoY;

  DvelX = noise(DvarX)*width;
  DvarX += DruidoX;
  DvelY = noise(DvarY)*width;
  DvarY += DruidoY;
  
  EvelX = noise(EvarX)*width;
  EvarX += EruidoX;
  EvelY = noise(EvarY)*width;
  EvarY += EruidoY;

  FvelX = noise(FvarX)*width;
  FvarX += FruidoX;
  FvelY = noise(FvarY)*width;
  FvarY += FruidoY;

  GvelX = noise(GvarX)*width;
  GvarX += GruidoX;
  GvelY = noise(GvarY)*width;
  GvarY += GruidoY;

  HvelX = noise(HvarX)*width;
  HvarX +=HruidoX;
  HvelY = noise(HvarY)*width;
  HvarY += HruidoY;
  




  
}



