
int t=0; //Variable del texto

void setup (){
  size (500,500);
  background (#E65F00);
}

void draw (){
  
  //Cara
  if (t >= 0 && t < 30){
  fill (#FCD0B4);
  stroke (#DCB0A4);
  ellipse (250,250, 210,250);
  }else{
  fill (#FF6347);
  stroke (#DF4327);
  ellipse (250,250, 210,250);  
  }
  
  //Ojo izquierdo
  stroke (0);
  noFill();
  strokeWeight(1);
  fill (#FFFFFF);
  stroke (0);
  ellipse (210,210, 50,35);
  
  //Ojo derecho
  stroke (0);
  noFill();
  strokeWeight(1);
  fill (#FFFFFF);
  ellipse (290,210, 50,35);  
  
  //Ojo izquierdo movimiento
  float ojoA = map(mouseX, 0, width, 198, 223);
  
  //Ojo derecho movimiento
  float ojoB = map(mouseX, 0, width, 278, 303);
  
  //Eje central
  float ojoX = map(mouseY, 0, height, 205, 215);
  
    if (t >= 0 && t < 30){
    //Iris izquierdo
    fill (#773525);
    stroke (#773525);
    ellipse (ojoA,ojoX, 25,25);
    
    //Iris derecho
    fill (#773525);
    stroke (#773525);
    ellipse (ojoB,ojoX, 25,25);
    
      //Pupila izquierda
      fill (#000000);
      ellipse (ojoA,ojoX, 10,10);
      
      //Pupila derecha
      fill (#000000);
      ellipse (ojoB,ojoX, 10,10);
      
    }else{
    //Iris izquierdo enfado
    fill (#FF0000);
    stroke (#773525);
    ellipse (ojoA,ojoX, random (25,20), random (25,20));
    
    //Iris derecho enfado
    fill (#FF0000);
    stroke (#773525);
    ellipse (ojoB,ojoX, random (25,20), random (25,20));
    
      //Pupila izquierda enfado
      fill (#000000);
      ellipse (ojoA,ojoX, 10,10);
      
      //Pupila derecha enfado
      fill (#000000);
      ellipse (ojoB,ojoX, 10,10);
      //ellipse (ojoX,ojoY, 10,10);
    }
        
  //Nariz
  stroke (0);
  noFill();
  strokeWeight(1);
  line (265,230, 265,275);
  line (235,230, 235,275);
  stroke (0,0,0);
  noFill();
  strokeWeight(1);
  arc (250,275, 30,30, 0, PI, OPEN);
  
  //Boca
  if (t >= 0 && t < 15){
  fill (#000000);
  stroke (0);
  arc (250, 310, 100, 80, 0, PI, OPEN);
  
  //Boca seria
  //(canvia si se ha pulsado 15 veces el LMB)
  }else if (t >= 15 && t < 30){
  stroke (0);
  strokeWeight (5);
  line (200, 320, 300,320);
  
  //Boca enfado
  //(canvia si se ha pulsado 30 veces el LMB)
  }else{
  fill (#FFFFFF);
  stroke (0);
  strokeWeight (5);
  rect (200,310, 100,40);
  
  line (200,330, 300,330);
  line (225,310, 225,350);
  line (250,310, 250,350);
  line (275,310, 275,350);
  }
  
  //Orejas
  if (t >= 0 && t < 30){
  stroke (#FCD0B4);
  fill (#FCD0B4);
  
  //Oreja izquierda
  ellipse (140,240, 35, 70);
  
  //Oreja derecha
  ellipse (360,240, 35, 70);
  }else{
  stroke (#FF6347);
  fill (#FF6347);
  }
  
  //Orejas enfado
  //Izquierda
  ellipse (140,240, 35, 70);
  //Derecha
  ellipse (360,240, 35, 70);
    
  //Cejas
  if (t >= 0 && t < 30){
  stroke (0);
  noFill();
  strokeWeight(4);
  strokeCap(SQUARE);
  
  //Ceja izquierda
  arc (199,180, 60,30, TWO_PI-PI/2, TWO_PI);
  arc (201,180, 60,30, PI, TWO_PI-PI/2);
  
  //Ceja derecha
  arc (299,180, 60,30, TWO_PI-PI/2, TWO_PI);
  arc (301,180, 60,30, PI, TWO_PI-PI/2);
  
  //Cejas enfado
  }else{  
  fill (#000000);
  stroke (0);
  
  //Izquierda
  triangle (180,160, 230,180, 180,170);
  
  //Derecha
  triangle (270,180, 320,160, 320,170);
  }  
  
  //Perilla
  fill (140,30,0);
  stroke (140,30,0);
  triangle (230,372, 270,372, 250,402);
  
  //Cabello
  fill (140,30,0);
  stroke (140,30,0);
  quad (225,130, 205,75, 295,75, 275,130);
  
  //Vena cabreo
  if (t >= 20){
  stroke (0);
  strokeWeight (2);
  //Esq. sup. izq.
  line (305,130, 305,120);
  line (305,130, 295,130);
  //Esq. inf. izq.
  line (305,140, 305,150);
  line (305,140, 295,140);
  //Esq. sup. der.
  line (315,130, 315,120);
  line (315,130, 325,130);
  //Esq. inf. der.
  line (315,140, 315,150);
  line (315,140, 325,140);
  
  }
  
  //Coordenadas
  println(mouseX+","+mouseY);
}

void mousePressed(){
  if (t==0){
    t=t+1;
  }else if (t==1){
    t=t+1;
  }else if (t==2){
    t=t+1;
  }else if (t==3){
    t=t+1;
  }else if (t==4){
    textSize (30);
    fill (#000000);
    text ("¡Ayyy, para!", 310,45);
    t=t+1;
  }else if (t==5){
    t=t+1;
  }else if (t==6){
    t=t+1;
  }else if (t==7){
    t=t+1;
  }else if (t==8){
    t=t+1;
  }else if (t==9){
    background (#E65F00);
    textSize (25);
    fill (#000000);
    text ("¡Que pesado!", 310,45);
    t=t+1;
  }else if (t==10){
    t=t+1;
  }else if (t==11){
    t=t+1;
  }else if (t==12){
    t=t+1;
  }else if (t==13){
    t=t+1;
  }else if (t==14){
    background (#E65F00);
    textSize (20);
    fill (#000000);    
    text ("Ya está bien...", 330,45);
    t=t+1;
  }else if (t==15){
    t=t+1;
  }else if (t==16){
    t=t+1;
  }else if (t==17){
    t=t+1;
  }else if (t==18){
    t=t+1;
  }else if (t==19){
    background (#E65F00);
    textSize (20);
    fill (#000000);    
    text ("¿Te cuesta entender?", 275,45);
    t=t+1;
  }else if (t==20){
    t=t+1;
  }else if (t==21){
    t=t+1;
  }else if (t==22){
    t=t+1;
  }else if (t==23){
    t=t+1;
  }else if (t==24){
    background (#E65F00);    
    textSize (35);
    fill (#000000);
    text ("...", 400,45);    
    t=t+1;
  }else if (t==25){
    t=t+1;
  }else if (t==26){
    t=t+1;
  }else if (t==27){
    t=t+1;
  }else if (t==28){
    t=t+1;
  }else if (t==29){
    t=t+1;
    background (#E65F00);    
    textSize (45);
    fill (#DD0000);
    text ("¡¡Déjame ya!!", 200,45);    
  }
}


