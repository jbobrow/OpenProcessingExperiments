
int ballsize = 20;       
float xpos, ypos;    

int fehler1=0;
int fehler2=0;
int playerpos1;
int playerpos2;
float xspeed = random(5, 6);  
float yspeed = random(0, 4);  

void setup() {
    size(800, 600);
    frameRate(30);
    noStroke();
    smooth();
    playerpos1 =height/2;
    playerpos2 =height/2;
    xpos = 60;
    ypos = playerpos1;
}

void draw() {
  background(255, 0, 125);

  xspeed *= 1.001;
  xpos += xspeed;
  ypos += yspeed;


if (ypos > height-ballsize/2 || ypos < 0+ballsize/2) {
    yspeed *= -1;
  }


if ( xpos <= 30+ballsize/2) {
if (ypos > playerpos1-50 && ypos < playerpos1+50) {
   xspeed *= -1;
   yspeed += (ypos-playerpos1)/5;
    }
  }

if (xpos <= 0) {
 fehler1 += 1;
if (fehler1 <= 4) {
      xpos = 50;
      ypos = playerpos1;
      xspeed = random(5, 6);

      yspeed = 0;  
      println("Spielstand: "+ str(fehler2)+":"+str(fehler1) );
    }
if (fehler1 ==5) {
      println("Spieler 2 gewinnt 5:"+ str(fehler2));
    }
  }

if ( xpos >= width-30-ballsize/2) {
if (ypos > playerpos2-50 && ypos < playerpos2+50) {
      xspeed *= -1;
      yspeed += (ypos-playerpos2)/5;
    }
  }
if (xpos >= width) {
  fehler2 +=1 ;
if (fehler2 <= 4) {
      xpos = width-50;
      ypos = playerpos2;
      xspeed = -random(5, 6);

      yspeed = 0;  
      println("Spielstand: "+ str(fehler2)+":"+str(fehler1) );
    }
if (fehler2 ==5) {
      println("Spieler 1 gewinnt 5:"+ str(fehler1));
    }
  }


  ellipse(xpos, ypos, ballsize, ballsize);
  rect (10, playerpos1-50, 20, 100);
  rect (width-30, playerpos2-50, 20, 100);



if (keyPressed) {
if (key == 'w') {
if (playerpos1 >=50)
        playerpos1 = playerpos1 - 9;
    }
if (key == 's') {
if (playerpos1 <=height-50)
        playerpos1 = playerpos1 + 9;
    }
  }
if (keyPressed) {
if (key == 'o') 
    {
if (playerpos2 >=50)
        playerpos2 = playerpos2 - 9;
    }
if (key == 'l') {
if (playerpos2 <=height-50)
        playerpos2 = playerpos2 + 9;
    }
  }
}

