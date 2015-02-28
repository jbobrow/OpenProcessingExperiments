
//set up the refferances for the two objects

Bot b;
// level 1 walls / goal
Wall w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, e1;

//level 2 walls / goal
Wall w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31, w32, w33, w34, e2; 
int enemyX, enemyY, enemy2X, enemy2Y;

//level 3 walls / finish
Wall w41, w42, w43, w44, w45, w46, w47, w48, w49, e3, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14; 
int enemy3X, enemy3Y, enemy4X, enemy4Y, enemy5X, enemy5Y, enemy6X, enemy6Y, enemy7X, enemy7Y, enemy8X, enemy8Y;
int enemy9X, enemy9Y, enemy10X, enemy10Y, enemy11X, enemy11Y, enemy12X, enemy12Y, enemy13X, enemy13Y, enemy14X, enemy14Y ;
int enemy15X, enemy15Y, enemy16X, enemy16Y;
boolean downwards3 = false, upwards3 = false;
boolean downwards4 = false, upwards4 = false;
boolean downwards5 = false, upwards5 = false;
boolean downwards6 = false, upwards6 = false;
boolean downwards7 = false, upwards7 = false;
boolean downwards8 = false, upwards8 = false;
boolean downwards9 = false, upwards9 = false;
boolean downwards10 = false, upwards10 = false;
boolean downwards11 = false, upwards11 = false;
boolean downwards12 = false, upwards12 = false;
boolean downwards13 = false, upwards13 = false;
boolean downwards14 = false, upwards14 = false;
boolean downwards15 = false, upwards15 = false;
boolean downwards16 = false, upwards16 = false;
boolean left1 = false, right1 = false;
boolean left2 = false, right2 = false;
boolean left3 = false, right3 = false;
boolean left4 = false, right4 = false;


boolean gameover = false;
boolean startscreen = true;
boolean level1 = false;
boolean level2 = false;
boolean level3 = false;
boolean winner = false;
boolean upwards, downwards, upwards2, downwards2;
void setup() {

  size(600, 600);
  b = new Bot(60, 60, 8);
  
  enemyX = 15;
  enemyY = 550;
  enemy2X = 70;
  enemy2Y = 410;
  enemy3Y = 160;
  enemy3X = 15;
  
  //level3
  enemy4Y = 420;
  enemy4X = 40;
  enemy5Y = 160;
  enemy5X = 65;
  enemy6Y = 420;
  enemy6X = 90;
  enemy7Y = 160;
  enemy7X = 115;
  enemy8Y = 420;
  enemy8X = 140;
  enemy9Y = 160;
  enemy9X = 165;
  enemy10Y = 420;
  enemy10X = 215;
  enemy11Y = 360;
  enemy11X = 260;
  enemy12Y = 410;
  enemy12X = 285;
  enemy13Y = 150;
  enemy13X = 15;
  enemy14Y = 180;
  enemy14X = 200;
  enemy15Y = 210;
  enemy15X = 15;
  enemy16Y = 240;
  enemy16X = 200;
  
  
}

void draw() {
  
   if (startscreen == true){
     text("Click to Start >>>>>>>>>", 370, 55);
    rect(550, 40, 20,20);
    
    if ( (mousePressed) &&(mouseY > 40) && (mouseY < 60) && (mouseX < 570) && (mouseX >550)){
      level1 = true;
      startscreen = false;
      
    }
  }
  if (level1 == true) {
    noStroke();
    background(0);
  w1 = new Wall(0,0,10,600);
  w2 = new Wall(0,0,600,10);
  w3 = new Wall(590,0,10,600);
  w4 = new Wall(0,590,600,10);
  w5 = new Wall(50,100,60,300);
  w6 = new Wall(170, 200, 600, 100);
  w7 = new Wall(400,420, 200, 200);
  w8 = new Wall(450, 0, 70, 150);
  w9 = new Wall(100,100, 200, 50);
  w10 = new Wall(170,200, 100, 250);
  w11 = new Wall(0, 500, 150, 70);
  e1 = new Wall(550, 300, 50, 120);
  b.render();
  w1.render();
  w2.render();
  w3.render();
  w4.render();
  w5.render();
  w6.render();
  w7.render();
  w8.render();
  w9.render();
  w10.render();
  w11.render();
  fill(100, 46, 50);
  e1.render();

  boolean Collision1 =w1.collision(mouseX, mouseY, b.getR());
  boolean Collision2 =w2.collision(mouseX, mouseY, b.getR());
  boolean Collision3 =w3.collision(mouseX, mouseY, b.getR());
  boolean Collision4 =w4.collision(mouseX, mouseY, b.getR());
  boolean Collision5 =w5.collision(mouseX, mouseY, b.getR());
  boolean Collision6 =w6.collision(mouseX, mouseY, b.getR());
  boolean Collision7 =w7.collision(mouseX, mouseY, b.getR());
  boolean Collision8 =w8.collision(mouseX, mouseY, b.getR());
  boolean Collision9 =w9.collision(mouseX, mouseY, b.getR());
  boolean Collision10 =w10.collision(mouseX, mouseY, b.getR());
  boolean Collision11 =w11.collision(mouseX, mouseY, b.getR());
  boolean Collision12 =e1.collision(mouseX, mouseY, b.getR());
   if (Collision1) {
    gameover = true;
}
  
   if (Collision1) {
    gameover = true;
}
 if (Collision2) {
    gameover = true;
}
 if (Collision3) {
    gameover = true;
}
 if (Collision4) {
    gameover = true;
}
 if (Collision5) {
    gameover = true;
}
 if (Collision6) {
    gameover = true;
}
 if (Collision7) {
    gameover = true;
}
 if (Collision8) {
    gameover = true;
}
 if (Collision9) {
    gameover = true;
}
 if (Collision10) {
    gameover = true;
}
 if (Collision11) {
    gameover = true;
}

if(Collision12){
  level1=false;
  level2 = true;
}
 if (gameover == true){
    background (0);
    fill(#FFFFFF);
    text("GAME OVER",50,50);
    text("Click to restart", 50, 100);
    if(mousePressed){
      level1 = false;
      gameover = false;
      startscreen = true;
    }
  }
}

if (level2 == true) {
    noStroke();
    background(0);
    
   
   if (enemyY >= 550){
     upwards = true;
     downwards = false;
   } 
   if (enemyY <= 410){
   upwards = false;
   downwards = true;
   }
 if (downwards == true){
 enemyY+=3;
 } 
 if (upwards == true){
   enemyY-=3;
 }
 
    if (enemy2Y >= 550){
     upwards2 = true;
     downwards2 = false;
   } 
   if (enemy2Y <= 410){
   upwards2 = false;
   downwards2 = true;
   }
 if (downwards2 == true){
 enemy2Y+=3;
 } 
 if (upwards2 == true){
   enemy2Y-=3;
 }
   
     
   
   
   
   
  w20 = new Wall(0,0,10,600);
  w21 = new Wall(0,0,600,10);
  w22 = new Wall(590,0,10,600);
  w23 = new Wall(0,590,600,10);
  w24 = new Wall(50,100,60,300);
  w25 = new Wall(150, 200, 600, 100);
  w26 = new Wall(200,420, 400, 35);
  w27 = new Wall(110, 150, 50, 400);
  w28 = new Wall(150,510, 400, 40);
  w29 = new Wall(450,0, 70, 150);
  w30 = new Wall(100, 100, 60, 50);
  w31 = new Wall(220, 0, 60, 140);
  w32 = new Wall(330, 60, 60, 150);
  w33 = new Wall(enemyX, enemyY, 30, 30);
  w34 = new Wall(enemy2X, enemy2Y, 30, 30);
  e2 = new Wall(570,40,20,20);
  b.render();
  w20.render();
  w21.render();
  w22.render();
  w23.render();
  w24.render();
  w25.render();
  w26.render();
  w27.render();
  w28.render();
  w29.render();
  w30.render();
  w31.render();
  w32.render();
  w33.render();
  w34.render();
   fill(100, 46, 50);
  e2.render();
  

  boolean Collision20 =w20.collision(mouseX, mouseY, b.getR());
  boolean Collision21 =w21.collision(mouseX, mouseY, b.getR());
  boolean Collision22 =w22.collision(mouseX, mouseY, b.getR());
  boolean Collision23 =w23.collision(mouseX, mouseY, b.getR());
  boolean Collision24 =w24.collision(mouseX, mouseY, b.getR());
  boolean Collision25 =w25.collision(mouseX, mouseY, b.getR());
  boolean Collision26 =w26.collision(mouseX, mouseY, b.getR());
  boolean Collision27 =w27.collision(mouseX, mouseY, b.getR());
  boolean Collision28 =w28.collision(mouseX, mouseY, b.getR());
  boolean Collision29 =w29.collision(mouseX, mouseY, b.getR());
  boolean Collision30 =w30.collision(mouseX, mouseY, b.getR());
  boolean Collision31 =w31.collision(mouseX, mouseY, b.getR());
  boolean Collision32 =w32.collision(mouseX, mouseY, b.getR());
  boolean Collision33 =w33.collision(mouseX, mouseY, b.getR());
  boolean Collision34 =w34.collision(mouseX, mouseY, b.getR());
   boolean Collision35 =e2.collision(mouseX, mouseY, b.getR());
   if (Collision20) {
    gameover = true;
}
  
   if (Collision21) {
    gameover = true;
}
 if (Collision22) {
    gameover = true;
}
 if (Collision23) {
    gameover = true;
}
 if (Collision24) {
    gameover = true;
}
 if (Collision25) {
    gameover = true;
}
 if (Collision26) {
    gameover = true;
}
 if (Collision27) {
    gameover = true;
}
 if (Collision28) {
    gameover = true;
}
 if (Collision29) {
    gameover = true;
}
 if (Collision30) {
    gameover = true;
}
 if (Collision31) {
    gameover = true;
}
 if(Collision32){
  gameover = true;
}
if(Collision32){
  gameover = true;
}
if(Collision33){
  gameover = true;
}
if(Collision34){
  gameover = true;
}

if(Collision35){
  level2 = false;
  level3 = true;
}
  if (gameover == true){
    background (0);
    fill(#FFFFFF);
    text("GAME OVER",50,50);
    text("Click to restart", 50, 100);
    if(mousePressed){
      gameover = false;
      startscreen = true;
      level2 = false;
    }
  }
}

if (level3 == true) {
    noStroke();
    background(0);
  
    
    if (enemy3Y >= 420){
     upwards3 = true;
     downwards3 = false;
   } 
   if (enemy3Y <= 160){
  upwards3 = false;
   downwards3 = true;
   }
 if (downwards3 == true){
 enemy3Y+=4;
 } 
 if (upwards3 == true){
   enemy3Y-=6;
 }
 
     if (enemy4Y >= 420){
     upwards4 = true;
     downwards4 = false;
   } 
   if (enemy4Y <= 160){
  upwards4 = false;
   downwards4 = true;
   }
 if (downwards4 == true){
 enemy4Y+=5;
 } 
 if (upwards4 == true){
   enemy4Y-=3;
 }
 
  if (enemy5Y >= 420){
  upwards5 = true;
  downwards5 = false;
  } 
  if (enemy5Y <= 160){
  upwards5 = false;
  downwards5 = true;
  }
  if (downwards5 == true){
  enemy5Y+=1;
  } 
  if (upwards5 == true){
  enemy5Y-=4;
  }
  
  if (enemy6Y >= 420){
  upwards6 = true;
  downwards6 = false;
  } 
  if (enemy6Y <= 160){
  upwards6 = false;
  downwards6 = true;
  }
  if (downwards6 == true){
  enemy6Y+=2;
  } 
  if (upwards6 == true){
  enemy6Y-=2;
  }
  
    if (enemy7Y >= 420){
  upwards7 = true;
  downwards7 = false;
  } 
  if (enemy7Y <= 160){
  upwards7 = false;
  downwards7 = true;
  }
  if (downwards7 == true){
  enemy7Y+=3;
  } 
  if (upwards7 == true){
  enemy7Y-=2;
  }
  
    if (enemy8Y >= 420){
  upwards8 = true;
  downwards8 = false;
  } 
  if (enemy8Y <= 160){
  upwards8 = false;
  downwards8 = true;
  }
  if (downwards8 == true){
  enemy8Y+=3;
  } 
  if (upwards8 == true){
  enemy8Y-=2;
  }
  
    if (enemy9Y >= 420){
  upwards9 = true;
  downwards9 = false;
  } 
  if (enemy9Y <= 160){
  upwards9 = false;
  downwards9 = true;
  }
  if (downwards9 == true){
  enemy9Y+=4;
  } 
  if (upwards9 == true){
  enemy9Y-=4;
  }
  
    if (enemy10Y >= 420){
  upwards10 = true;
  downwards10 = false;
  } 
  if (enemy10Y <= 360){
  upwards10 = false;
  downwards10 = true;
  }
  if (downwards10 == true){
  enemy10Y+=3;
  } 
  if (upwards10 == true){
  enemy10Y-=2;
  }
  
   if (enemy11Y >= 410){
  upwards11 = true;
  downwards11 = false;
  } 
  if (enemy11Y <= 360){
  upwards11 = false;
  downwards11 = true;
  }
  if (downwards11 == true){
  enemy11Y+=3;
  } 
  if (upwards11 == true){
  enemy11Y-=2;
  }
  
   if (enemy12Y >= 410){
  upwards12 = true;
  downwards12 = false;
  } 
  if (enemy12Y <= 360){
  upwards12 = false;
  downwards12 = true;
  }
  if (downwards12 == true){
  enemy12Y+=3;
  } 
  if (upwards12 == true){
  enemy12Y-=4;
  }
  
    if (enemy13X >= 200){
  left1 = true;
  right1 = false;
  } 
  if (enemy13X <= 15){
  left1 = false;
  right1 = true;
  }
  if (left1 == true){
  enemy13X-=5;
  } 
  if (right1 == true){
  enemy13X+=3;
  }
  
  
    if (enemy14X >= 200){
  left2 = true;
  right2 = false;
  } 
  if (enemy14X <= 15){
  left2 = false;
  right2 = true;
  }
  if (left2 == true){
  enemy14X-=4;
  } 
  if (right2 == true){
  enemy14X+=5;
  }
  
    if (enemy15X >= 200){
  left3 = true;
  right3 = false;
  } 
  if (enemy15X <= 15){
  left3 = false;
  right3 = true;
  }
  if (left3 == true){
  enemy15Y-=2;
  } 
  if (right3 == true){
  enemy15Y+=4;
  }
  
    if (enemy16X >= 200){
  left4 = true;
  right4 = false;
  } 
  if (enemy16X <= 15){
  left4 = false;
  right4 = true;
  }
  if (left4 == true){
  enemy16X-=5;
  } 
  if (right4 == true){
  enemy16X+=3;
  }
    
  w41 = new Wall(0,0,10,600);
  w42 = new Wall(0,0,600,10);
  w43 = new Wall(590,0,10,600);
  w44 = new Wall(0,590,600,10);
  
  w45 = new Wall(450, 0, 70, 200);
  w46 = new Wall(250, 300, 450, 70);
  w47 = new Wall(250, 100 ,70 , 230);
  w48 = new Wall(10,450,450,70);
  w49 = new Wall(100,100, 200, 50);
  b1 = new Wall(enemy3X, enemy3Y, 20,20);
  b2 = new Wall(enemy4X, enemy4Y, 20,20);
  b3 = new Wall(enemy5X, enemy5Y, 20,20);
  b4 = new Wall(enemy6X, enemy6Y, 20,20);
  b5 = new Wall(enemy7X, enemy7Y, 20,20);
  b6 = new Wall(enemy8X, enemy8Y, 20,20);
  b7 = new Wall(enemy9X, enemy9Y, 20,20);
  b8 = new Wall(enemy10X, enemy10Y, 20,20);
  b9 = new Wall(enemy11X, enemy11Y, 20,20);
  b10 = new Wall(enemy12X, enemy12Y, 20,20);
  b11 = new Wall(enemy13X, enemy3Y, 20,20);
  b12 = new Wall(enemy14X, enemy14Y, 20,20);
  b13 = new Wall(enemy15X, enemy15Y, 20,20);
  b14 = new Wall(enemy16X, enemy16Y, 20,20);
 
 
  
  
  e3= new Wall(0,520, 70, 70);
  b.render();
  w41.render();
  w42.render();
  w43.render();
  w44.render();
  w45.render();
  w46.render();
  w47.render();
  w48.render();
  w49.render();
  b1.render();
  b2.render();
  b3.render();
  b4.render();
  b5.render();
  b6.render();
  b7.render();
  b8.render();
  b9.render();
  b10.render();
  b11.render();
  b12.render();
  b13.render();
  b14.render();

  fill(100, 46, 50);
  e3.render();

  boolean Collision1 =w41.collision(mouseX, mouseY, b.getR());
  boolean Collision2 =w42.collision(mouseX, mouseY, b.getR());
  boolean Collision3 =w43.collision(mouseX, mouseY, b.getR());
  boolean Collision4 =w44.collision(mouseX, mouseY, b.getR());
  boolean Collision5 =w45.collision(mouseX, mouseY, b.getR());
  boolean Collision6 =w46.collision(mouseX, mouseY, b.getR());
  boolean Collision7 =w47.collision(mouseX, mouseY, b.getR());
  boolean Collision8 =w48.collision(mouseX, mouseY, b.getR());
  boolean Collision9 =w49.collision(mouseX, mouseY, b.getR());
  boolean Collision12 =e3.collision(mouseX, mouseY, b.getR());
  boolean Collision13 =b1.collision(mouseX, mouseY, b.getR());
  boolean Collision14 =b2.collision(mouseX, mouseY, b.getR());
  boolean Collision15 =b3.collision(mouseX, mouseY, b.getR());
  boolean Collision16 =b4.collision(mouseX, mouseY, b.getR());
  boolean Collision17 =b5.collision(mouseX, mouseY, b.getR());
  boolean Collision18 =b6.collision(mouseX, mouseY, b.getR());
  boolean Collision19 =b7.collision(mouseX, mouseY, b.getR());
  boolean Collision20 =b8.collision(mouseX, mouseY, b.getR());
  boolean Collision21 =b9.collision(mouseX, mouseY, b.getR());
  boolean Collision22 =b10.collision(mouseX, mouseY, b.getR());
  boolean Collision23 =b11.collision(mouseX, mouseY, b.getR());
  boolean Collision24 =b12.collision(mouseX, mouseY, b.getR());
  boolean Collision25 =b13.collision(mouseX, mouseY, b.getR());
  boolean Collision26 =b14.collision(mouseX, mouseY, b.getR());

  
  
   if (Collision1) {
    gameover = true;
}
 if (Collision2) {
    gameover = true;
}
 if (Collision3) {
    gameover = true;
}
 if (Collision4) {
    gameover = true;
}
 if (Collision5) {
    gameover = true;
}
 if (Collision6) {
    gameover = true;
}
 if (Collision7) {
    gameover = true;
}
 if (Collision8) {
    gameover = true;
}
 if (Collision9) {
    gameover = true;
}
if (Collision13) {
    gameover = true;
}

if (Collision14) {
    gameover = true;
}

if (Collision15) {
    gameover = true;
}
if (Collision16) {
    gameover = true;
}

if (Collision17) {
    gameover = true;
}
if (Collision18) {
    gameover = true;
}

if (Collision19) {
    gameover = true;
}
if (Collision20) {
    gameover = true;
}

if (Collision21) {
    gameover = true;
}
if (Collision22) {
    gameover = true;
}
if (Collision23) {
    gameover = true;
}

if (Collision24) {
    gameover = true;
}
if (Collision25) {
    gameover = true;
}

if (Collision26) {
    gameover = true;
}

if(Collision12){
  level3 = false;
  winner = true;
}


 
if (gameover == true){
 
    background (0);
    fill(#FFFFFF);
    text("GAME OVER",50,50);
    text("Click to restart", 50, 100);
    if(mousePressed){
    gameover = false;
    startscreen = true;
    level3 = false;
    }
  }
 if (winner == true){
   background(0);
   text("I can't believe you actually did it. Nice one.", 250,290);
 }
   
}
}

class Wall {
  //dimention attributes
  int x;
  int y;
  int w;
  int h;
 
  //constructor this is used when we instanciate the object and set the values of all of the wall attributes
  //based on the paramaters passed you may wish to introduce colour and other attributes
  public Wall(int x, int y, int w, int h) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
  }
  
   boolean collision(int botX, int botY, int botR) {
    if ( botX - botR < x+w &&
      botY - botR < y+h &&
      botX + botR > x &&
      botY + botR > y)
    {
      fill(255, 30, 30);
      return true;
    }
    else {
      fill(255);
      return false;
    } 
 }
 void render(){
   rect(x,y,w,h);
 }
}
   

class Bot {
  //bot attributers position and radious
  int x;
  int y;
  int r;
   
  //bot constructor to initilise all those attributes when you instanciate an object
  public Bot(int x, int y, int r) {
    this.x=x;
    this.y=y;
    this.r=r;
  }
   
  //accesor methods for the attributes ofthe class
  // this is a mechanisme to grab a copy of the attributes
  int getX() {
    return x;
  }
  int getY() {
    return y;
  }
  int getR() {
    return r;
  }

 
  // this fucntion is used to draw the bot
  void render() {
    
     this.x = mouseX;
     this.y = mouseY;
     ellipse(this.x, this.y, this.r*2, this.r*2);
  }
}


