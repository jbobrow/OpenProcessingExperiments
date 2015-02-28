

int size = 20;       // diametro de el balon
float xpos, ypos,x2pos, y2pos;    // posicion de el balon 
float xspeed = random(5,6);  // velocidad del balon en x
float yspeed = random(0,4);  // velocidad del balon en y
float x2speed = random(5,6);  // velocidad del balon2 en x
float y2speed = random(0,4);  // velocidad del balon2 en y
int error1=0;  // limite de el numero de perdida de los balones
int error2=0;
int playerpos1;
int playerpos2;
int puntos=0;
int punto2=0;
void setup()
{
 size(700, 400);
 noStroke();  // para que no haya contorno
 frameRate(30);
 smooth();
 playerpos1 =height/2;
 playerpos2 =height/2;
 xpos = 45;
 ypos = playerpos1;
  x2pos = 655;
 y2pos =  playerpos2 =height/2;
}


void draw()
{
 background(0);
 // movimiento del balon
 xspeed *= 1.004;
 x2speed *= 1.004;
 xpos += xspeed;
 ypos += yspeed;
 x2pos += x2speed;
 y2pos += y2speed;
 
 
 //rebote con las paredes
 if (ypos > height-size/2 || ypos < 0+size/2) {
 yspeed *= -1;

 }
 
 // rebote izquierdo bola 1
 if ( xpos <= 30+size/2) {
    if (ypos > playerpos1-50 && ypos < playerpos1+50){
       xspeed *= -1;
       yspeed += (ypos-playerpos1)/5;
       
    }
    
 }
 //cuando la pelota 1 no golpea a la raqueta izquierda entonces esta aparece al frente de la barra donde esta se perdio
 if (xpos <= 0){
  error1 += 1;
    if (error1 <= 1000){
       xpos = 50;
       ypos = playerpos1;
       xspeed = random(5,6);
       //xspeed *= -1;
       yspeed = 0; 
       punto2 ++;
     }
     
 }  
  // rebote derecho bola 1
 if ( xpos >= width-30-size/2) {
    if (ypos > playerpos2-50 && ypos < playerpos2+50){
       xspeed *= -1;
       yspeed += (ypos-playerpos2)/5;
       
       
    }
    
 }

 //cuando la pelota no golpea a la barra entonces esta aparece al frente de la barra donde esta se perdio
 if (xpos >= width){
    error2 +=1 ;
    if (error2 <= 1000){
       xpos = width-50;
       ypos = playerpos2;
       xspeed = -random(5,6);
       //xspeed *= -1;
       yspeed = 0; 
      puntos ++;
        
    }
     
      
 }
 
 ////////////////////////////////
 //rebote con las paredes 2
 if (y2pos > height-size/2 || y2pos < 0+size/2) {
 y2speed *= -1;
 }
  // rebote izquierdo bola 2
 if ( x2pos <= 37) {
    if (y2pos > playerpos1-50 && y2pos < playerpos1+50){
       x2speed *= -1;
       y2speed += (y2pos-playerpos1)/15;
       
       }
 } 
 //si la pelota 2 pasa la raqueta 1
 if (x2pos <= 5){
  error1 += 1;
    if (error1 <= 1000){
       x2pos = 50;
       y2pos = playerpos1;
       x2speed = random(5,6);
       //xspeed *= -1;
       y2speed = 0; 
       punto2 ++;
     }    
 }  
  // rebote  derecho bola 2
 if ( x2pos >= 655) {
    if (y2pos > playerpos2-50 && y2pos < playerpos2+50){
       x2speed *= -1;
       y2speed += (y2pos-playerpos2)/15; 
           
    }    
 }
 //si la pelota 2 pasa la raqueta derecha
 if (x2pos >= 695){
    error2 +=1 ;
    if (error2 <= 1000){
       x2pos = width-50;
       y2pos = playerpos2;
       x2speed = -random(5,6);
       //xspeed *= -1;
       y2speed = 0; 
      puntos ++;        
    }   
  } 
  
  
  
 // dibujando el balon  y las raquetas
 
 background(98, 150, 237); // 
 fill(255, 255, 255);
rect (360,0,6,400);
fill(255, 255, 255);
rect(0, 200, 700, 3);



 fill (255, 255, 255);
 ellipse(xpos, ypos, size, size);
 fill (250,255,0);
 strokeWeight(12);
 ellipse(x2pos, y2pos, size, size);
 fill(0, 0, 0);
 ellipse (30, playerpos1-50,50,100);
 fill(255, 0, 0);
 ellipse (width-30, playerpos2-50,50,100);

 
// Movimiento de las raquetas
 if (keyPressed) {
    if (key == 'w') {
      if (playerpos1 >=50)
       playerpos1 = playerpos1 - 16;
    }
    if (key == 's') {
      if (playerpos1 <=height-50)
       playerpos1 = playerpos1 + 16;
    }
 }
 if (keyPressed && (key == CODED)) {
    if (keyCode == UP)
    {
      if (playerpos2 >=50)
       playerpos2 = playerpos2 - 16;
       }
    if (keyCode == DOWN) {
      if (playerpos2 <=height-50);
       playerpos2 = playerpos2 + 16;
       }
    }
    
   fill(0,0, 0);
  text("Player1=  " + puntos,10,15);
  
  fill(255,0,0);
  text("Player2=  "+punto2,600,15);
{
if(puntos==5){noLoop(); PFont gameover = loadFont("gameover.vlw" ); textFont(gameover, 25); fill(255,255,255); text("WINNER PLAYER 1",300,200);} 
if(punto2==5){noLoop(); PFont gameover = loadFont("gameover.vlw" ); textFont(gameover, 25); fill(255,0,0); text("WINNER PLAYER 2",300,200);}
}
     
}

