
Temps cronometre = new Temps();
int x = 40;
int y = 150;
color gris = color (121,114,114);
color rojo = color (255, 0,0);
color negro = color (0,0,0);

  void draw(){
    textFont(f,18);
    background(0,170,228);
    
    // Depenen del que valgui la variable nombrePantalla, canviarem de pantalla
    // Les pantalles estan definides en l'altre fitxer pantalles.pde
    if (nombrePantalla == 1) pantalla1();
    if (nombrePantalla == 2) pantalla2();
    if (nombrePantalla == 3) pantalla3();
    if (nombrePantalla == 4) bombero();
    if (nombrePantalla == 5) pantalla5();
    
    
  }
    void validar(){
      
      int i=0;
      //respuestas
      respuestas [0]=" 4/5";
      respuestas [1]=" 2/4";
      respuestas [2]=" 12/20";
      respuestas [3]=" 8/3";
      respuestas [4]=" 4/2";
      respuestas [5]=" 2/6";
      respuestas [6]=" 12/20";
      respuestas [7]=" 12/32";

      //validacion
      println(":"+typedText+": ");
      println(":"+respuestas[pregunta]+":");
      if(typedText.equals(respuestas[pregunta])){
          System.out.print("Has acertado");
          pregunta = (int)random(8);
          dispararAgua =true;
      }else{
        // HAS FALLADO!!!!!
        for (int j =0; j<ha_encertat.length;j++){
          ha_encertat[j] = false;
      }
        System.out.print("has fallado");                
  }
}

void bombero(){
  fill(250);
    text (preguntas[pregunta], 150, 20);
    text(typedText+(frameCount/10 % 2 == 0 ? "_" : ""), 250, 380);
    //suelo
  fill(74,74,74);
  rect(0,400,600,200);
  //edificio
  stroke(0);
  fill(158,40,28);
  rect(450,50,200,350);
  //puerta
   fill(255,255,0);
  rect(505,350,40,50);
  //ventana puerta
  fill(41,115,184);
  rect(510,355,30,20);
  //pomo puerta
  fill(0);
  rect(536,385,2,2);
   //ventanas
  Ventana1();
  Ventana2();
  Ventana3();
  Ventana4();
  Ventana5();
  Ventana6();
  Ventana7();
  Ventana8();
  //BOMBER
  //cara
  noStroke();
  fill(255,255,0);
  rect(40,40,15,15);
  rect(52,48,6,1);
  fill(0);
  rect(48,44,3,3);
  rect(49,51,6,1);
  //pantalons
  fill(0);
  rect(40,75,7,20);
  rect(51,75,7,20);
  //cos
  fill(255,233,0);
  rect(70,60,5,5);
  fill(255,0,0);
  rect(37,55,23,30);
  rect(50,60,20,5);
  //gorro
  rect(35,39,27,3);
  arc(48,39,18,15,3.14,6.30);
  fill(0);
  rect(55,36,2,3);
  //zapatos
  fill(255,0,0);
  rect(40,95,7,7);
  rect(51,95,7,7);
  //manguera
  stroke(170,0,0);
  strokeWeight(5);
  line(6,74,80,65);
  line(5,74,5,370);
  line(5,370,30,370);
  stroke(122,122,122);
  line(76,66,80,65);
  //GRUA
  stroke(0);
  strokeWeight(20);
  line(x+10,y+120,x+40,y+150);  
  line(x+10,y+120,x+40,y+100);  
  line(x+40,y+100,x+10,y+70); 
  line(x+10,y+70,x+40,y+50);
  line(x+40,y+50,x+10,y+20);
  line(x+10,y+20,x+40,y);
  line(x+40,y,x+10,y-30); 
  stroke(80,80,80);
  strokeWeight(10);
  line(x+10,y+120,x+40,y+150);  
  line(x+10,y+120,x+40,y+100);  
  line(x+40,y+100,x+10,y+70); 
  line(x+10,y+70,x+40,y+50);
  line(x+40,y+50,x+10,y+20);
  line(x+10,y+20,x+40,y);
  line(x+40,y,x+10,y-30); 
  strokeWeight(5);
  stroke(0);
  fill(80,80,80);
  rect(10,99,100,20);
  noStroke();
  stroke(0);
  strokeWeight(2);
  line(10,80,110,80);
  line(11,80,11,100);
  line(20,80,20,100);
  line(30,80,30,100);
  line(39,80,39,100);
  line(49,80,49,100);
  line(59,80,59,100);
  line(70,80,70,100);
  line(80,80,80,100);
  line(90,80,90,100);
  line(100,80,100,100);
  line(109,80,109,100);
  noStroke();

  //CAMIO
  //estructura
  fill(255,0,0);
  rect (x-10, y+150, 140, 80);
  rect (x-10, y+163, 180, 80);
  fill (252,26,5);
  //ruedas
  fill (30,30,30);
  ellipse (x+20, y+248, 28, 25);
  ellipse (x+90, y+246, 28, 25);
  ellipse (x+150, y+246, 28, 25);
  fill (74,74,74);
  ellipse (x+20, y+248, 15, 15);
  ellipse (x+90, y+246, 15, 15);
  ellipse (x+150, y+246, 15, 15);
  //cuadro herramientas.
  fill(74,74,74);
  rect (x, y+163, 100, 30);
  //escalera
  fill(165,102,93);
  rect (x+10, y+166, 80, 3);
  rect (x+10, y+186, 80, 3);
  rect (x+13, y+166, 3, 23);
  rect (x+23, y+166, 3, 23);
  rect (x+33, y+166, 3, 23);
  rect (x+43, y+166, 3, 23);
  rect (x+53, y+166, 3, 23);
  rect (x+63, y+166, 3, 23);
  rect (x+73, y+166, 3, 23);
  rect (x+83, y+166, 3, 23);
  //linia vertical
  rect (x+128,y+150, 2, 93);
  fill(0);
  rect (x+135,y+170, 30, 30);
  //mostra cronometre
  //
  textSize(35);
  fill(255, 0, 0);
  int x =cronometre.segonsEnrera();
  if (cronometre.segonsEnrera() < 0){
    x = 0;
  }
  //Imprimim una comptaEnrera que és de trenta segons
  text(cronometre.minutsEnrera()+":"+x, 520, 120+350);
  //EXPULSA AIGUA
  
  if (dispararAgua== true){
     ventanaApagada();
    if (mousePressed && mouseX >450){
      stroke(255);
      strokeWeight(2);
      fill(0,255,255);
      bezier(80,65,mouseX-80,mouseY-80,mouseX-40,mouseY-40,mouseX,mouseY);
      noStroke();
    }  
  } 
 
 
  textSize(12);
  fill(255,255,0);
  strokeWeight(2);
  stroke(0);
  rect (10,430,110,60);
  noStroke();
  fill(0);
  text("TORNAR",40,465);
  
  if (mousePressed && mouseX >10 && mouseX <120 && mouseY>430 && mouseY<490){
    nombrePantalla = 1;
  }
  }

  void mouseReleased(){
  background(0,170,228); 
  draw();
  }



