
float x = 200;
float xSpeed = random(3, 4);
float y=0;
float ySpeed = random(5, 6) ;
float playerScoure = 0 ;
float a = 100;
float aSpeed = random(1, 2);
float b=0;
float bSpeed = random(1, 2) ;
float c = 0;
float cSpeed = random(1, 2);
float d=  0;
float dSpeed = random(3, 4) ;
void setup() {

  size(600, 600);
}


void draw() {
  background(14, (frameCount/15)%180, 100);

  rect(mouseX, 500, 50, 30);
  noStroke();
  rect(x, y, 10, 10, 75);
  textSize(20);
  text("player scoure : " + playerScoure, 50, 50, 75);
  textSize(10);
  text( " touch top +1 mark, touch floor -2 marks", 45, 90, 75);



  x = x + xSpeed;
  y= y + ySpeed;
  /* rigth */
  if (x > width-10) {
    xSpeed = -xSpeed;
  }
  /* below */
  if (y > width-10) {
    ySpeed = -ySpeed;
    playerScoure = playerScoure - 2 ;
  }
  /* left */
  if (x <0) {
    xSpeed = -xSpeed ;
  }
  /* top */
  if (y <0) {
    ySpeed = -ySpeed ;
  }

  if (y > mouseY && x > mouseX+10 && x < (mouseX+60) ) { 

    ySpeed = -ySpeed;
  }
  if (y < 0 ) { 
    playerScoure =  playerScoure + 1 ;
  }

  if ( playerScoure > 4 ) {  
    /* level 2 */
    textSize(100); 
    text("Level 2", 220, 300) ;
    noStroke();
    rect(a, b, 10, 10, 75);



    a = a + aSpeed;
    b= b + bSpeed;
    /* rigth */
    if (a > width-10) {
      aSpeed = -aSpeed;
    }
    /* below */
    if (b > width-10) {
      bSpeed = -bSpeed;
      playerScoure = playerScoure - 2 ;
    }
    /* left */
    if (a <0) {
      aSpeed = -aSpeed ;
    }
    /* top */
    if (b <0) {
      bSpeed = -bSpeed ;
    }

    if (b > mouseY && a > mouseX+10 && a < (mouseX+70) ) { 

      bSpeed = -bSpeed;
    }
    if (b < 0 ) { 
      playerScoure =  playerScoure + 1 ;
    }
  }
  /* level 2 end */
  if ( playerScoure > 9 ) {  
    textSize(150);
    text("Level 3 ", 70, 450) ;
    noStroke();
    rect(c, d, 10, 10, 75);




    c = c + cSpeed;
    d= d + dSpeed;
    /* rigth */
    if (c > width-10) {
      cSpeed = -cSpeed;
    }
    /* below */
    if (d > width-10) {
      dSpeed = -dSpeed;
      playerScoure = playerScoure - 2 ;
    }
    /* left */
    if (c <0) {
      cSpeed = -cSpeed ;
    }
    /* top */
    if (d <0) {
      dSpeed = -dSpeed ;
    }

    if (d > mouseY && c > mouseX+10 && c < (mouseX+60) ) { 

      dSpeed = -dSpeed;
    }
    if (d < 0 ) { 
      playerScoure =  playerScoure + 1 ;
    }
  }
  if ( playerScoure > 29 ) { 
    background(14, (frameCount/10)%256, 100);
    
    textSize(60);
    text(" Well Done !", 120, 300 ) ;
  }
}



