
int size = 20;     
float xpos, ypos;     
float xspeed = random(5,6);
float yspeed = random(0,4);
int fehler1=0;
int fehler2=0;
int playerpos1;
int playerpos2;

void setup()
{
 size(640, 400);
 noStroke();
 frameRate(30);
 smooth();
 playerpos1 =height/2;
 playerpos2 =height/2;
 xpos = 45;
 ypos = playerpos1;
}

void draw()
{
 background(277);
 xspeed *= 1.001;
 xpos += xspeed;
 ypos += yspeed;

 if (ypos > height-size/2 || ypos < 0+size/2) {
 yspeed *= -1;
 }

 if ( xpos <= 30+size/2) {
    if (ypos > playerpos1-50 && ypos < playerpos1+50){
       xspeed *= -1;
       yspeed += (ypos-playerpos1)/5;
    }
 }
 if (xpos <= 0){
    fehler1 += 1;
    if (fehler1 <= 4){
       xpos = 50;
       ypos = playerpos1;
       xspeed = random(5,6);
       //xspeed *= -1;
       yspeed = 0;  
       println("Punkte: "+ str(fehler2)+":"+str(fehler1) );
    }
     if (fehler1 ==5) {
          println("Spieler 2 gewinnt 5:"+ str(fehler2));
       }
 }

 if ( xpos >= width-30-size/2) {
    if (ypos > playerpos2-50 && ypos < playerpos2+50){
       xspeed *= -1;
       yspeed += (ypos-playerpos2)/5;
    }
 }
 if (xpos >= width){
    fehler2 +=1 ;
    if (fehler2 <= 4){
       xpos = width-50;
       ypos = playerpos2;
       xspeed = -random(5,6);
       //xspeed *= -1;
       yspeed = 0;  
       println("Punkte: "+ str(fehler2)+":"+str(fehler1) );
    }
       if (fehler2 ==5) {
          println("Spieler 1 gewinnt 5:"+ str(fehler1));
       }
 }
 
 ellipse(xpos, ypos, size, size);
 rect (10, playerpos1-50,20,100);
 rect (width-30, playerpos2-50,20,100);


 if (keyPressed) {
    if (key == 'w') {
      if (playerpos1 >=50)
       playerpos1 = playerpos1 - 8;
    }
    if (key == 'y') {
      if (playerpos1 <=height-50)
       playerpos1 = playerpos1 + 8;
    }
 }
 if (keyPressed) {
    if (key == '7') 
    {
      if (playerpos2 >=50)
       playerpos2 = playerpos2 - 8;
       }
    if (key == '1') {
      if (playerpos2 <=height-50)
       playerpos2 = playerpos2 + 8;
       }
    }
    
}

