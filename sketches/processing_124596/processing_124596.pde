
PImage fons1, fons2, fons3, fons4, fons5;
Boto b1, b2, b3, b4, b5, b6, b7, b8, b9;
int pantalla=1;

void setup(){
  size(900, 700);
  fons1 = loadImage("1995.jpg");
  fons2 = loadImage("4.jpg"); 
  fons3 = loadImage("11111.jpg"); 
  fons4 = loadImage("11113.jpg"); 
  fons5 = loadImage("11112.jpg");
  b1 = new Boto(178, 270, color(0,0,255), 82, 37, 1, 2, "   GAME");
  b2 = new Boto(10, 645, color(0,0,255), 81, 27, 2, 1, "ANTERIOR");
  b3 = new Boto(378, 270, color(0,0,255), 82, 37, 1, 3, " HISTORY"); 
  b4 = new Boto(10, 630, color(0,0,255), 82, 27, 3, 1, "ANTERIOR"); 
  b5 = new Boto(740, 630, color(0,0,255), 81, 27, 4, 5, "SIGUIENTE"); 
  b6 = new Boto(740, 630, color(0,0,255), 81, 27, 3, 4, "SIGUIENTE"); 
  b7 = new Boto(10, 630, color(0,0,255), 81, 27, 4, 3, "ANTERIOR"); 
  b8 = new Boto(10, 630, color(0,0,255), 81, 27, 5, 4, "ANTERIOR"); 
  
}

void draw(){
  background(100);
  switch(pantalla){
    case 1: grup();break;
    case 2: altavoces();break; 
    case 3: juego3();break; 
    case 4: juego4();break; 
    case 5: juego5();break;
  }
}
void mousePressed(){
  b1.apreta();
  b2.apreta(); 
  b3.apreta(); 
  b4.apreta(); 
  b5.apreta(); 
  b6.apreta(); 
  b7.apreta();  
  b8.apreta();
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
  String texte;
  
  Boto(){
    xPos = width/2;
    yPos = height/2;
    c = color(255,0,0);
    widthB = 50;
    heightB = 25;
    pantallaActual = 1;
    pantallaDesti = 2;
    fonBoto = createFont("Georgia", 12);
    textFont(fonBoto);
    texte = "Boto";
  }
  Boto(float x, float y, color col, float w, float h, int inici, int fi, String t){
    fonBoto = createFont("Georgia", 12);
    textFont(fonBoto);
    xPos = x;
    yPos = y;
    c = col;
    widthB = w;
    heightB = h;
    pantallaActual = inici;
    pantallaDesti = fi;
    texte = t;
  }
  
  void dibuixa(){
    fill(c, 100);
    rect(xPos, yPos, widthB, heightB, 5);
    fill(255);
    text (texte, xPos + 10, yPos + 20);
  }
  
  void apreta(){
    if ((xPos <= mouseX && mouseX <= xPos + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual){
      pantalla = pantallaDesti;
    }
  }

}
void juego3(){
  image(fons3, 0, 0);
  b4.dibuixa(); 
  b6.dibuixa(); 
  
 
}
void juego4(){ 
 image(fons4, 0, 0); 
 b7.dibuixa();
 b5.dibuixa();   
}
void juego5(){ 
 image(fons5, 0, 0); 
 b8.dibuixa();
}   
void grup(){
  image(fons1, 0, 0);
  b1.dibuixa(); 
  b3.dibuixa(); 
  
}
  int move_nave;
  int valor_tiro=350;
  int totalPts = 300;
  float steps = totalPts + 1;

void altavoces(){
   
     
     frameRate(4);
     background(0); 
      b2.dibuixa();
      
         float rand = 0;
         for (int i = 1; i < steps; i++)
         {
           stroke(5,57,255);
           
           ellipse((width/steps) * i, (height/2) + random(-rand, rand), 5 ,5 );
           point( (width/steps) * i, (height/2) + random(-rand, rand) );
           rand += random(-250, 250);
         }
     
     fill(141 , 141 ,141);
    
     rect(move_nave,600, 20, 30);
     
     textSize(8);
     
     fill(0);
     
     text("Estrella de la muerte", move_nave+2, 377);
     text("Falcon", move_nave+6, 385);
     
     fill(94,95,93);
     
     arc(200, 50, 80, 80, 0, PI+PI);
     line(167 , 70 , 240 , 50);
     fill(165,165,165);
     ellipse(183 , 43 , 15 ,15);
     
 }
 
 void mouseClicked()
 {
     
     while( valor_tiro > 0)
     {
       
       fill(255,0,0);
       
       ellipse( move_nave+20,  valor_tiro+15 , 10 , 10);
        valor_tiro -=1;
         
         if(valor_tiro == 50 && move_nave >= 125 && move_nave <= 225)
         {
           background(0);
           textSize(32);
           fill(255,255,0);
           text("GAME OVER", 100, 250);
           noLoop();
         }
     }
   valor_tiro=350;
 }
 void keyPressed()
 {
   if (key == CODED)
   {
     if (keyCode == RIGHT)
     {
       move_nave += 3;
     }
     if (keyCode == LEFT)
     {
       move_nave -= 3;
     }
   }
   else if(keyPressed){
     if (key == 'r' || key == 'R')
      {
        loop();
      }
    }
 }



