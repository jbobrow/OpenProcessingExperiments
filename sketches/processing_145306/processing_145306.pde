
  float Ax = random (1,1000); //posicio peca x
  float By = random (1,1000); //posicio peca y
  float vA = 3;//velocitat x peca
  float vB = 3;//velocitat y peca
  float posicio = 1;
  float posicio2 = 1;
  
  
void setup (){
  size (1000, 1000) ;
}


void draw (){
  noCursor ();

  background (255, 255, 255) ; 
  
  float MovimentX = mouseX - 250;
  float MovimentY = mouseY -250;
  
  float midaColorX = map(mouseX,0,width,0,255);
  float midaColorY = map(mouseY,0,height,0,255);
  

  
//FONS

  
fill (0,0,0); 
  rect (80+posicio,80,80,40);
  rect (90+posicio,70,20,10);
  rect (130+posicio,70,20,10);
  
  fill (255,0,0); 
  rect (40+posicio,510,80,40);
  rect (50+posicio,500,20,10);
  rect (90+posicio,500,20,10);
  
  fill (155,200,0); 
  rect (10+posicio,210,80,40);
  rect (20+posicio,200,20,10);
  rect (60+posicio,200,20,10);
  
  fill (15,250,100); 
  rect (10+posicio,710,80,40);
  rect (20+posicio,700,20,10);
  rect (60+posicio,700,20,10);

  fill (255,255,255); 
  rect (10+posicio,910,80,40);
  rect (20+posicio,900,20,10);
  rect (60+posicio,900,20,10);
 
  fill (100,0,0); 
  rect (40+posicio,810,80,40);
  rect (50+posicio,800,20,10);
  rect (90+posicio,800,20,10);
  
  fill (155,155,0); 
  rect (50+posicio,610,80,40);
  rect (60+posicio,600,20,10);
  rect (100+posicio,600,20,10);
  
  fill (200,100,100); 
  rect (70+posicio,310,80,40);
  rect (80+posicio,300,20,10);
  rect (120+posicio,300,20,10);
  
  fill (160,25,0); 
  rect (10+posicio,410,80,40);
  rect (20+posicio,400,20,10);
  rect (60+posicio,400,20,10);
  
  posicio = posicio+4;
  
  if (posicio>1000){
posicio=-200;    
  }
  
  //SEGONA FILA

  fill (0,0,0); 
  rect (840+posicio2,80,80,40);
  rect (850+posicio2,70,20,10);
  rect (890+posicio2,70,20,10);
 
  fill (255,0,0); 
  rect (860+posicio2,510,80,40);
  rect (870+posicio2,500,20,10);
  rect (910+posicio2,500,20,10);
  
  fill (155,200,0); 
  rect (880+posicio2,210,80,40);
  rect (890+posicio2,200,20,10);
  rect (930+posicio2,200,20,10);
  
  fill (15,250,100); 
  rect (900+posicio2,710,80,40);
  rect (910+posicio2,700,20,10);
  rect (950+posicio2,700,20,10);
  
  fill (255,255,255); 
  rect (840+posicio2,910,80,40);
  rect (850+posicio2,900,20,10);
  rect (890+posicio2,900,20,10);
 
  fill (100,0,0); 
  rect (860+posicio2,810,80,40);
  rect (870+posicio2,800,20,10);
  rect (910+posicio2,800,20,10);
  
  fill (155,155,0); 
  rect (900+posicio2,610,80,40);
  rect (910+posicio2,600,20,10);
  rect (950+posicio2,600,20,10);
  
  fill (200,100,100); 
  rect (880+posicio2,310,80,40);
  rect (890+posicio2,300,20,10);
  rect (930+posicio2,300,20,10);
  
  fill (160,25,0); 
  rect (900+posicio2,410,80,40);
  rect (910+posicio2,400,20,10);
  rect (950+posicio2,400,20,10);
  
 posicio2 = posicio2 -4;
 
   if (posicio2<-1000){
posicio2=200;    
  }
  
    fill (random(255),random(255),random(255)); 
  rect (80+Ax,80+By,80,40);
  rect (90+Ax,70+By,20,10);
  rect (130+Ax,70+By,20,10);
  
  Ax=Ax+vA;
  By=By+vB;

  if (Ax+155>width||Ax+85<0) {
    vA=-vA;
  }
  if (By+110>height||By+70<0) {
    vB=-vB;
  }
  
  
//CAP

//RECTANGLE CLIP
fill (255, 247, 0) ;
  //mouse clicat canvia a enfadat (color vermell)
  if (mousePressed == true) {
    fill(252, 59, 59);
  }
noStroke () ;
rect ((MovimentX)+218,(MovimentY)+50, 60, 20) ; 

//RECTANGLE BASE CAP
fill (255, 247, 0) ;
  //mouse clicat canvia a enfadat (color vermell)
  if (mousePressed == true) {
    fill(252, 59, 59);
  }
noStroke () ;
rect ((MovimentX)+200,(MovimentY)+70, 100, 100) ; 

//REDONDEJOS
fill (255, 247, 0) ;
  //mouse clicat canvia a enfadat (color vermell)
  if (mousePressed == true) {
    fill(252, 59, 59);
  }
noStroke () ;
ellipse ((MovimentX)+200,(MovimentY)+85, 30, 30);
fill (255, 247, 0) ;
  //mouse clicat canvia a enfadat (color vermell)
  if (mousePressed == true) {
    fill(252, 59, 59);
  }
noStroke () ;
ellipse ((MovimentX)+295,(MovimentY)+85, 30, 30);
fill (255, 247, 0) ;
  //mouse clicat canvia a enfadat (color vermell)
  if (mousePressed == true) {
    fill(252, 59, 59);
  }
noStroke () ;
ellipse ((MovimentX)+200,(MovimentY)+155, 30, 30);
fill (255, 247, 0) ;
  //mouse clicat canvia a enfadat (color vermell)
  if (mousePressed == true) {
    fill(252, 59, 59);
  }
noStroke () ;
ellipse ((MovimentX)+295,(MovimentY)+155, 30, 30);

//RECTANGLES COMPLEMENTARIS
fill (255, 247, 0) ;
  //mouse clicat canvia a enfadat (color vermell)
  if (mousePressed == true) {
    fill(252, 59, 59);
  }
noStroke () ;
rect ((MovimentX)+185,(MovimentY)+90, 50, 60) ; 
fill (255, 247, 0) ;
  //mouse clicat canvia a enfadat (color vermell)
  if (mousePressed == true) {
    fill(252, 59, 59);
  }
noStroke () ;
rect ((MovimentX)+260,(MovimentY)+90, 50, 60) ; 

//RECTANGLE COLL
fill (255, 247, 0) ;
  //mouse clicat canvia a enfadat (color vermell)
  if (mousePressed == true) {
    fill(252, 59, 59);
  }
noStroke () ;
rect ((MovimentX)+208, (MovimentY)+165, 80, 20) ; 

//BOCA
fill (0, 0, 0) ;
noStroke () ;
ellipse ((MovimentX)+250, (MovimentY)+135, 50, 50) ;
fill (255, 247, 0) ;
  //mouse clicat canvia a enfadat (color vermell)
  if (mousePressed == true) {
    fill(252, 59, 59);
  }
noStroke () ;
ellipse ((MovimentX)+250, (MovimentY)+135, 40, 40) ;
fill (255, 247, 0) ;
  //mouse clicat canvia a enfadat (color vermell)
  if (mousePressed == true) {
    fill(252, 59, 59);
  }
noStroke () ;
rect ((MovimentX)+220, (MovimentY)+92, 60, 60) ;
fill (0, 0, 0) ;
noStroke () ;
ellipse ((MovimentX)+235, (MovimentY)+152, 7, 5) ;
fill (0, 0, 0) ;
noStroke () ;
ellipse ((MovimentX)+265, (MovimentY)+152, 7, 5) ;

//ULLS
fill (0, 0, 0) ;
noStroke () ;
ellipse ((MovimentX)+230, (MovimentY)+110, 15, 15) ;
fill (0, 0, 0) ;
noStroke () ;
ellipse ((MovimentX)+270, (MovimentY)+110, 15, 15) ;
fill (255, 255, 255) ;
noStroke () ;
ellipse ((MovimentX)+272, (MovimentY)+108, 5, 5) ;
fill (255, 255, 255) ;
noStroke () ;
ellipse ((MovimentX)+232, (MovimentY)+108, 5, 5) ;

//COS



//BRAÇOS
fill (midaColorX, 0, 0) ;
noStroke () ;
ellipse ((MovimentX)+170, (MovimentY)+220, 50, 50) ;
fill (midaColorX, 0, 0) ;
noStroke () ;
ellipse ((MovimentX)+325, (MovimentY)+220, 50, 50) ;
fill (midaColorX, 0, 0) ;
beginShape();
vertex((MovimentX)+146, (MovimentY)+210);
vertex((MovimentX)+170, (MovimentY)+208);
vertex((MovimentX)+155, (MovimentY)+330);
vertex((MovimentX)+130, (MovimentY)+330);
endShape(CLOSE);
fill (midaColorX, 0, 0) ;
beginShape();
vertex((MovimentX)+349, (MovimentY)+210);
vertex((MovimentX)+320,(MovimentY)+208);
vertex((MovimentX)+340, (MovimentY)+330);
vertex((MovimentX)+365, (MovimentY)+330);
endShape(CLOSE);

//MANS
fill (255, 247, 0) ;
  //mouse clicat canvia a enfadat (color vermell)
  if (mousePressed == true) {
    fill(252, 59, 59);
  }
ellipse ((MovimentX)+142, (MovimentY)+348, 30, 30) ;
fill (255, 255, 255) ;
ellipse ((MovimentX)+142, (MovimentY)+348, 15, 15) ;
fill (255, 255, 255) ;
ellipse ((MovimentX)+142, (MovimentY)+350, 15, 15) ;
fill (255, 255, 255) ;
ellipse ((MovimentX)+142, (MovimentY)+352, 15, 15) ;
fill (255, 255, 255) ;
ellipse ((MovimentX)+142, (MovimentY)+354, 15, 15) ;
fill (255, 255, 255) ;
ellipse ((MovimentX)+142, (MovimentY)+356, 15, 15) ;
fill (255, 255, 255) ;
ellipse ((MovimentX)+142, (MovimentY)+358, 15, 15) ;
fill (255, 255, 255) ;
ellipse ((MovimentX)+142, (MovimentY)+360, 15, 15) ;

fill (255, 247, 0) ;
  //mouse clicat canvia a enfadat (color vermell)
  if (mousePressed == true) {
    fill(252, 59, 59);
  }
ellipse ((MovimentX)+354, (MovimentY)+348, 30, 30) ;
fill (255, 255, 255) ;
ellipse ((MovimentX)+354, (MovimentY)+348, 15, 15) ;
fill (255, 255, 255) ;
ellipse ((MovimentX)+354, (MovimentY)+350, 15, 15) ;
fill (255, 255, 255) ;
ellipse ((MovimentX)+354, (MovimentY)+352, 15, 15) ;
fill (255, 255, 255) ;
ellipse ((MovimentX)+354, (MovimentY)+354, 15, 15) ;
fill (255, 255, 255) ;
ellipse ((MovimentX)+354, (MovimentY)+356, 15, 15) ;
fill (255, 255, 255) ;
ellipse ((MovimentX)+354, (MovimentY)+358, 15, 15) ;
fill (255, 255, 255) ;
ellipse ((MovimentX)+354, (MovimentY)+360, 15, 15) ;

//CANELLS
fill (255, 247, 0) ;
  //mouse clicat canvia a enfadat (color vermell)
  if (mousePressed == true) {
    fill(252, 59, 59);
  }
rect ((MovimentX)+135, (MovimentY)+330, 15, 5) ;
fill (255, 247, 0) ;
  //mouse clicat canvia a enfadat (color vermell)
  if (mousePressed == true) {
    fill(252, 59, 59);
  }
rect ((MovimentX)+345, (MovimentY)+330, 15, 5) ;

//BASE COS
fill (midaColorY, 152, 31) ;
stroke (100) ;
beginShape();
vertex((MovimentX)+170, (MovimentY)+185);
vertex((MovimentX)+325, (MovimentY)+185);
vertex((MovimentX)+335, (MovimentY)+350);
vertex((MovimentX)+160, (MovimentY)+350);
endShape(CLOSE);

//LLETRES
textSize (40) ;
fill (0,0,0) ;
// cambia el color del text de LEGO al passar la meitat
  if ((MovimentX)+230<width/2) {
    fill(250, 253, 24);
  }
text ("LEGO", (MovimentX)+200, (MovimentY)+250);



//CAMES
//CAMES
fill (midaColorX, 0, 0) ;
noStroke () ;
rect ((MovimentX)+160, (MovimentY)+370, 80, 100) ; 
fill (midaColorX, 0, 0) ;
noStroke () ;
rect ((MovimentX)+260, (MovimentY)+370, 75, 100) ; 

//PEUS
fill (midaColorX, 0, 0) ;
stroke (100) ;
rect ((MovimentX)+260, (MovimentY)+460, 75, 30) ; 
fill (midaColorX, 0, 0) ;
stroke (100) ;
rect ((MovimentX)+160, (MovimentY)+460, 80, 30) ; 

//RECTANGLECINTURO
fill (midaColorX, 0, 0) ;
stroke (100) ;
rect ((MovimentX)+160, (MovimentY)+350, 175, 20) ; 

//RECTANGLEGIRCAMES
fill (midaColorX, 0, 0) ;
stroke (100) ;
rect ((MovimentX)+240, (MovimentY)+370, 20, 50) ; 

}





 






