
//ThainÃ¡ Pimentel - S53
//O trabalho Mundo de ThainÃ¡ Pimentel estÃ¡ licenciado com uma LicenÃ§a Creative Commons - AtribuiÃ§Ã£o 4.0 Internacional. Baseado no trabalho disponÃ­vel em http://www.openprocessing.org/sketch/136145.

int [][] MUNDO = {
  {
    60, 90, 40, 60
  }
  , 
  {
    120, 140, 20, 20
  }
  , 
  {
    100, 130, 20, 20
  }
  , 
  {
    140, 140, 100, 100
  }
  , 
  {
    180, 220, 50, 50
  }
  , 
  {
    240, 150, 20, 100
  }
  , 
  {
    260, 135, 40, 70
  }
  , 
  {
    300, 135, 20, 20
  }
  , 
  {
    300, 155, 20, 20
  }
  , 
  {
    320, 80, 20, 50
  }
  , 
  {
    340, 35, 60, 65
  }
  , 
  {
    170, 240, 50, 30
  }
  , 
  {
    200, 270, 60, 20
  }
  , 
  {
    240, 295, 80, 15
  }
  , 
  {
    260, 310, 60, 60
  }
  , 
  {
    320, 335, 40, 75
  }
  , 
  {
    280, 370, 35, 100
  }
  , 
  {
    280, 470, 20, 20
  }
  , 
  {
    270, 532, 20, 35
  }
  , 
  {
    80, 570, 220, 30
  }
  , 
  {
    480, 55, 40, 15
  }
  , 
  {
    460, 115, 20, 20
  }
  , 
  {
    480, 95, 40, 40
  }
  , 
  {
    500, 250, 50, 100
  }
  , 
  {
    460, 115, 20, 20
  }
  , 
  {
    480, 95, 40, 40
  }
  , 
  {
    495, 138, 25, 72
  }
  , 
  {
    460, 155, 30, 35
  }
  , 
  {
    440, 175, 20, 20
  }
  , 
  {
    420, 190, 20, 20
  }
  , 
  {
    460, 155, 30, 35
  }
  , 
  {
    440, 175, 20, 20
  }
  , 
  {
    420, 190, 20, 20
  }
  , 
  {
    460, 190, 20, 20
  }
  , 
  {
    490, 210, 20, 20
  }
  , 
  {
    520, 110, 175, 120
  }
  , 
  {
    560, 70, 20, 40
  }
  , 
  {
    590, 90, 200, 30
  }
  , 
  {
    700, 120, 60, 90
  }
  , 
  {
    520, 230, 200, 20
  }
  , 
  {
    420, 230, 100, 170
  }
  , 
  {
    440, 310, 80, 60
  }
  , 
  {
    480, 370, 40, 60
  }
  , 
  {
    520, 290, 20, 80
  }
  , 
  {
    540, 255, 15, 35
  }
  , 
  {
    560, 250, 20, 20
  }
  , 
  {
    595, 255, 120, 15
  }
  , 
  {
    660, 280, 30, 30
  }
  , 
  {
    699, 310, 20, 20
  }
  , 
  {
    740, 330, 30, 20
  }
  , 
  {
    720, 380, 50, 50
  }
  , 
  {
    750, 430, 20, 20
  }
};



PFont font;



void setup() {
  size (800, 600);
  frameRate(10);

  for (int i=0; i<MUNDO.length;i++)
    rect (MUNDO[i][0], MUNDO[i][1], MUNDO[i][2], MUNDO[i][3]);

  font = loadFont("AgencyFB-Reg-48.vlw");

  textFont(font, 32);
  ;
}

char letter= 'a';

void keyPressed(){
letter=key;
}


void draw() {
  background (255);
  fill (255, 0, 0);
  noStroke();
     
  for (int i=0; i<MUNDO.length;i++)
    {
      rect (MUNDO[i][0], MUNDO[i][1], MUNDO[i][2], MUNDO[i][3]);
    }
  fill (0);

  

switch(letter){
case 'X':
case 'x':
fill(255);
rect(0,0,width,height);
fill(255,0,0);
for (int i=0; i<MUNDO.length;i++){
rect(random(width), random(height), MUNDO[i][2], MUNDO[i][3]);
}
}

fill(0);
text("Que mundo queremos construir?", mouseX, mouseY);

}
