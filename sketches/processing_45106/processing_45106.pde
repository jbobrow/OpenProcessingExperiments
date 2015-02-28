

float AvelX;
float AruidoX = .00718;
float AvarX;
float AvelY;
float AruidoY = .00715;
float AvarY;


float BvelX;
float BruidoX = .00666;
float BvarX;
float BvelY;
float BruidoY = .00669;
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
float DruidoY = .00543;
float DvarY;

float EvelX;
float EruidoX = .00457;
float EvarX;
float EvelY;
float EruidoY = .00458;
float EvarY;

float FvelX;
float FruidoX = .00213;
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
float HruidoX = .00890;
float HvarX;
float HvelY;
float HruidoY = .00891;
float HvarY;

float contador;


// - - - - - setuo

void setup (){
  
 size (800,800);
  background (230,255,100);
  frameRate (60);
smooth ();

  
  
}

// - - - - - - draw

void draw (){
  
  

  
  
  //circulos screen
  
    background (255);
  
  stroke(0,0); 
  fill(210,255,0);
  ellipse (400,400,AvelX+20,AvelX+20);
  fill(255);
  ellipse (400,400,AvelY,AvelY);
  
 stroke(0,0);
  fill(210,255,0);
  ellipse (400,400,BvelX+50,BvelX+50);
  fill(255);
  ellipse (400,400,BvelY,BvelY);
  
 stroke(0,0);
  fill(210,255,0);
  ellipse (400,400,CvelX+80,CvelX+80);
  fill(255);
  ellipse (400,400,CvelY,CvelY);
    
 stroke(0,0);
  fill(210,255,0);
  ellipse (400,400,DvelX+10,DvelX+10);
  fill(255);
  ellipse (400,400,DvelY,DvelY);
  
   stroke(0,0);
  fill(210,255,0);
  ellipse (400,400,EvelX+5,EvelX+5);
  fill(255);
  ellipse (400,400,EvelY,EvelY);
  
   stroke(0,0);
  fill(210,255,0);
  ellipse (400,400,FvelX+30,FvelX+30);
  fill(255);
  ellipse (400,400,FvelY,FvelY);
  
   stroke(0,0);
  fill(210,255,0);
  ellipse (400,400,GvelX+50,GvelX+50);
  fill(255);
  ellipse (400,400,GvelY,GvelY);
  
   stroke(0,0);
  fill(210,255,0);
  ellipse (400,400,HvelX+10,HvelX+10);
  fill(255);
  ellipse (400,400,HvelY,HvelY);
  
  
  
  contador ++;
  
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



