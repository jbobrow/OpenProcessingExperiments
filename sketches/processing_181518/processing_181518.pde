
PImage foto1, foto2, foto3, foto4, foto5;
Boto b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11;
int pantalla = 4;


void setup(){
  size(947, 540);
  foto1 = loadImage("foto1.PNG");
  foto2 = loadImage("foto2.PNG");
  foto3 = loadImage("foto3.PNG");
  foto4 = loadImage("inicio.jpg");
  foto5 = loadImage("fin.jpg");
  foto6 = loadImage("next.jpg");
  
  
  b1 = new Boto(343, 252, color(0, 0, 255, 0), 15, 20, 1, 2);
  b2 = new Boto(471, 271, color(0, 0, 255, 0), 44, 20, 1, 2);
  b3 = new Boto(493, 430, color(0, 0, 255, 0), 20, 20, 1, 2);
  
  b4 = new Boto(412, 331, color(0, 0, 255, 0), 33, 20, 2, 3);
  b5 = new Boto(217, 212, color(0, 0, 255, 0), 80, 20, 2, 3);
  b6 = new Boto(340, 369, color(0, 0, 255, 0), 70, 20, 2, 3);
  
  b7 = new Boto(452, 108, color(0, 0, 255, 0), 30, 20, 3, 5);
  b8 = new Boto(628, 350, color(0, 0, 255, 0), 20, 20, 3, 5);
  b9 = new Boto(384, 430, color(0, 0, 255, 0), 20, 20, 3, 5);
  
  b10 = new Boto(400, 308, color(0, 0, 255, 0), 146, 48, 4, 1);
  
  b11 = new Boto(0, 0, color(0, 0, 255, 0), 0, 0, 5, 4);

}
void draw(){
  println(mouseX + " : " + pmouseY);
  
  
  switch(pantalla){
    case 1: nivell1();break;
    case 2: nivell2();break;
    case 3: nivell3();break;
    case 4: inicio();break;
    case 5: fin();break;
    
  }
  if(pantalla == 1){
  b1.apreta1();
  b2.apreta1();
  b3.apreta1();
  }
  if(pantalla == 2){
  b4.apreta2();
  b5.apreta2();
  b6.apreta2();
  }
  if(pantalla == 3){
  b7.apreta3();
  b8.apreta3();
  b9.apreta3();
  }
  if(pantalla == 4){
  b10.apreta4();
  }
  if(pantalla == 5){
  b11.apreta5();
  }
  
  
  
}
void mousePressed(){

  
}




class Boto {
  float xPos;
  float yPos;
  color c;
  float widthB;
  float heightB;
  int pantallaActual;
  int pantallaDesti; 
  PFont fonBoto;
  
  boolean error1 = false;
  boolean error2 = false;
  boolean error3 = false;
  boolean error4 = false;
  boolean error5 = false;
  boolean error6 = false;
  boolean error7 = false;
  boolean error8 = false;
  boolean error9 = false;
  
  boolean clic1 = false;
  boolean clic2 = false;
  boolean clic3 = false;
  boolean clic4 = false;
  boolean clic5 = false;
  boolean clic6 = false;
  boolean clic7 = false;
  boolean clic8 = false;
  boolean clic9 = false;
  
  boolean inicio = false;
  
  boolean fin = false;
  
  boolean next1 = false;
  boolean next2 = false;
  
  
  
  Boto(){
    xPos = width/2;
    yPos = height/2;
    c = color(255, 0, 0, 0);
    widthB = 50;
    heightB = 25;
    pantallaActual = 1;
    pantallaDesti = 2;
    
  }
  Boto(float x, float y, color col, float w, float h, int inici, int fi){
    
    xPos = x;
    yPos = y;
    c = col;   
    widthB = w;
    heightB = h;
    pantallaActual = inici;
    pantallaDesti = fi;
    
  }
  
  void dibuixa(){
    noStroke();
    fill(c, 0);
    rect(xPos, yPos, widthB, heightB, 5);
   
  }
  
  
  
  void apreta1(){

    if ((mouseX >= 343 && mouseX <= 343 + 15) && (mouseY >= 252 && mouseY <= 252 + 20) && pantalla == pantallaActual && mousePressed){
      error1 = true; 
      
    }
    
    
    if ((mouseX >= 471 && mouseX <= 471 + 44) && (mouseY >= 271 && mouseY <= 271 + 20) && pantalla == pantallaActual && mousePressed){
      error2 = true;
    }
    
    if ((mouseX >= 493 && mouseX <= 493 + 20) && (mouseY >= 430 && mouseY <= 430 + 20) && pantalla == pantallaActual && mousePressed){
      error3 = true;
    }
    //next lvl1
    if (error1 == true && error2 == true && error3 == true ){
      image(foto6, 700, 0);
        if ((mouseX >= 721 && mouseX <= 721 + 200) && (mouseY >= 53 && mouseY <= 53 + 48) && pantalla == pantallaActual && mousePressed){
           next1 = true;
        }
        
    }
    
    if(next1 == true){
      pantalla = pantallaDesti;
    }
    if(error1 == true){
     strokeWeight(3);
     stroke(0, 255, 0);
     line(368, 260, 371, 264);
     line(371, 264, 377, 257);
     }
     
      if(error2 == true){
     strokeWeight(3);
     stroke(0, 255, 0);
     line(520, 280, 523, 284);
     line(523, 284, 529, 277);
     }
     
      if(error3 == true){
     strokeWeight(3);
     stroke(0, 255, 0);
     line(730, 440, 733, 444);
     line(733, 444, 739, 437);
     }
  
      
  
  }
  
  
  void apreta2(){
    
    if ((mouseX >= 412 && mouseX <= 412 + 33) && (mouseY >= 331 && mouseY <= 331 + 20) && pantalla == pantallaActual && mousePressed){
      error4 = true;
    }
    
    if ((mouseX >= 217 && mouseX <= 217 + 80) && (mouseY >= 212 && mouseY <= 212 + 20) && pantalla == pantallaActual && mousePressed){
      error5 = true;
    }
    
    if ((mouseX >= 340 && mouseX <= 340 + 70) && (mouseY >= 369 && mouseY <= 369 + 20) && pantalla == pantallaActual && mousePressed){
      error6 = true;
    }

    
     //next lvl2
    if (error4 == true && error5 == true && error6 == true ){
      image(foto6, 700, 0);
        if ((mouseX >= 721 && mouseX <= 721 + 200) && (mouseY >= 53 && mouseY <= 53 + 48) && pantalla == pantallaActual && mousePressed){
           next2 = true;
        }
    }
    
    if(next2 == true){
      pantalla = pantallaDesti;
    }
    if(error4 == true){
     strokeWeight(3);
     stroke(0, 255, 0);
     line(488, 338, 491, 342);
     line(491, 342, 497, 335);
     }
     
      if(error5 == true){
     strokeWeight(3);
     stroke(0, 255, 0);
     line(426, 218, 429, 222);
     line(429, 222, 435, 215);
     }
     
      if(error6 == true){
     strokeWeight(3);
     stroke(0, 255, 0);
     line(412, 377, 415, 381);
     line(415, 381, 421, 374);
     }
  
  }
  
  
  void apreta3(){
    
    if ((mouseX >= 452 && mouseX <= 452 + 30) && (mouseY >= 108 && mouseY <= 108 + 20) && pantalla == pantallaActual && mousePressed){
      error7 = true;
    }
    
    if ((mouseX >= 628 && mouseX <= 628 + 20) && (mouseY >= 350 && mouseY <= 350 + 20) && pantalla == pantallaActual && mousePressed){
      error8 = true;
    }
    
    if ((mouseX >= 384 && mouseX <= 384 + 20) && (mouseY >= 430 && mouseY <= 430 + 20) && pantalla == pantallaActual && mousePressed){
      error9 = true;
    }
    if (error7 == true && error8 == true && error9 == true ){
      pantalla = pantallaDesti;
    }
    
    if(error7 == true){
     strokeWeight(3);
     stroke(0, 255, 0);
     line(570, 117, 573, 121);
     line(573, 121, 579, 114);
     }
     
      if(error8 == true){
     strokeWeight(3);
     stroke(0, 255, 0);
     line(695, 356, 698, 360);
     line(698, 360, 704, 353);
     }
     
      if(error9 == true){
     strokeWeight(3);
     stroke(0, 255, 0);
     line(623, 439, 626, 443);
     line(626, 443, 632, 435);
     }
  }
  
  //pagina de inicio
  void apreta4(){
    
    if ((mouseX >= 400 && mouseX <= 400 + 146) && (mouseY >= 308 && mouseY <= 308 + 48) && pantalla == pantallaActual && mousePressed){
      inicio = true;
    }
    if (inicio == true ){
      pantalla = pantallaDesti;

    }
  }
  
  //fin
  void apreta5(){

    if ((mouseX >= 0 && mouseX <= 0 + 0) && (mouseY >= 0 && mouseY <= 0 + 0) && pantalla == pantallaActual && mousePressed){

      pantalla = pantallaDesti;
        
    }
   
  }
    
}
void fin(){
  image(foto5, 0, 0);
  b11.dibuixa();
  
}
void inicio(){
  image(foto4, 0, 0);
  b10.dibuixa();
  
}
void nivell1(){
  image(foto1, 0, 0);
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();   
}
void nivell2(){
  image(foto2, 0, 0);
  b4.dibuixa();
  b5.dibuixa();
  b6.dibuixa();
  
}
void nivell3(){
  image(foto3, 0, 0);
  b7.dibuixa();
  b8.dibuixa();
  b9.dibuixa();
  
}


