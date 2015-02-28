
int card = 0;

PImage arrow;
PImage satyr;
PImage openning;
PImage invite;
PImage disapproves;
PImage uncool;
PImage tim;
PImage tim_tears;
PImage psychosis;
PImage enter_forest;
PImage julia;
PImage cell_phone;
PImage trapped;
PImage forest_edge;
PImage tortoise_hare;
PImage hare;
PImage hare_ho;
PImage dinner;
PImage curs; //cursor

PFont oldtimes;

float x;
float y;
float targetX, targetY;
float easing = 0.05;


void setup() {
  size (640,480);
  smooth ();
  oldtimes = loadFont ("OldStyle1HPLHS-48.vlw");
  textFont(oldtimes);
   invite= loadImage("the satyr1.2.jpg");
   curs= loadImage("satyr2.png");
   cursor(HAND);
}

void draw () { 





  
  if (card == 0) {
//    background (0);

  
   arrow = loadImage ("arrow.png");
  openning = loadImage ("the satyr.jpg");
  
  image(openning,0,0);
  image(arrow,525,240);
  
    {
targetX= mouseX;
float dx = targetX- x;
if(abs(dx) > 1) {
  x += dx * easing;
}

targetY = mouseY;
float dy = targetY - y;
if (abs(dy) > 1) {
  y += dy * easing;
}

image(curs, x,y);
}
  
    
      int left = 530;
    int right = 630;
    int top = 250;
    int bottom = 300;
    
    if ( mouseX > left && mouseX < right && mouseY > top && mouseY < bottom ){
      if ( mousePressed) {
        card = 1;
      } else {
        noStroke();
        fill (255,0,0, 100);
      }
   
    rect (530,250,100,50);
    }
    
//    }
//    fill();
//    ellipse();
//    
//    if (mousePressed) {
//      float d = dist(mouseX,mouseY, 100,400);
//      if (d < 35) {
//        card = 2;
//      }
    
    
    
  } else if (card == 1) {
    background(255);
    

image( invite, 0, 0);
    
    int left = 130;
    int right = 230;
    int top = 370;
    int bottom = 390;
    
        {
targetX= mouseX;
float dx = targetX- x;
if(abs(dx) > 1) {
  x += dx * easing;
}

targetY = mouseY;
float dy = targetY - y;
if (abs(dy) > 1) {
  y += dy * easing;
}

image(curs, x,y);
}
    
    if ( mouseX > left && mouseX < right && mouseY > top && mouseY < bottom ){
      if ( mousePressed) {
        card = 2;
      } else {
        fill (255,0,0, 100);
        noStroke();
      }
 
    rect (130,370,100,20);
    }
    
    left = 410;
    right =510;
    top =365;
    bottom = 385;
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed) {
      card = 3;}
      else{
        fill(255,0,0,100);
        noStroke();
      }
      rect (410,365,100,20);}
    
  } else if (card == 2) {
    background (255);
    disapproves = loadImage ("the satyr1.3.jpg");
    image(disapproves,0,0);
    
        {
targetX= mouseX;
float dx = targetX- x;
if(abs(dx) > 1) {
  x += dx * easing;
}

targetY = mouseY;
float dy = targetY - y;
if (abs(dy) > 1) {
  y += dy * easing;
}

image(curs, x,y);
}
    
    int left = 130;
    int right = 230;
    int top = 390;
    int bottom = 410;
    
    if ( mouseX > left && mouseX < right && mouseY > top && mouseY < bottom ){
      if ( mousePressed) {
        card = 3;
      } else {
        fill (255,0,0, 100);
        noStroke();
      }
    
    rect (130,390,100,20);
    }
    left = 415;
    right =515;
    top =390;
    bottom = 410;
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed) {
      card = 4;}
          else {
      fill (255,0,0,100);
      noStroke();
      }
      rect (415,390,100,20);
    }

  } else if ( card == 3) {
     background (255);
     tim = loadImage ("the satyr 2.jpg");
     image(tim,0,0);
     
         {
targetX= mouseX;
float dx = targetX- x;
if(abs(dx) > 1) {
  x += dx * easing;
}

targetY = mouseY;
float dy = targetY - y;
if (abs(dy) > 1) {
  y += dy * easing;
}

image(curs, x,y);
}
     
     int left = 60;
    int right = 160;
    int top = 380;
    int bottom = 400;
    
    if ( mouseX > left && mouseX < right && mouseY > top && mouseY < bottom ){
      if ( mousePressed) {
        card = 5;
      } else {
        fill (255,0,0, 100);
        noStroke();
      }
 
    rect (60,380,100,20);
    }
    left = 495;
    right =595;
    top =380;
    bottom = 400;
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed) {
      card = 6;}
      else {
      fill (255,0,0,100);
      noStroke();
      }
      rect (495,380,100,20);
      
    }    

  }else if (card == 4) {
    background (225);
   
   uncool = loadImage ("the satyr1.4.jpg");
   image(uncool,0,0);
   
       {
targetX= mouseX;
float dx = targetX- x;
if(abs(dx) > 1) {
  x += dx * easing;
}

targetY = mouseY;
float dy = targetY - y;
if (abs(dy) > 1) {
  y += dy * easing;
}

image(curs, x,y);
}
   
    int left = 125;
    int right = 225;
    int top = 360;
    int bottom = 380;
    
    if ( mouseX > left && mouseX < right && mouseY > top && mouseY < bottom ){
      if ( mousePressed) {
        card = 2;
      } else {
        fill (255,0,0, 100);
      }
    
    rect (125,360,100,20);}
    
    left = 430;
    right =530;
    top =360;
    bottom = 380;
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed) {
      card = 0;}
      else {
      fill (255,0,0,100);
      }
      rect (430,360,100,20);
      
    }  
   
    
  }else if (card == 5) {
    background (255);
    
    tim_tears = loadImage ("the satyr 3.jpg");
    image(tim_tears,0,0);
    
        {
targetX= mouseX;
float dx = targetX- x;
if(abs(dx) > 1) {
  x += dx * easing;
}

targetY = mouseY;
float dy = targetY - y;
if (abs(dy) > 1) {
  y += dy * easing;
}

image(curs, x,y);
}
    
         int left = 60;
    int right = 160;
    int top = 350;
    int bottom = 370;
    
    if ( mouseX > left && mouseX < right && mouseY > top && mouseY < bottom ){
      if ( mousePressed) {
        card = 7;
      } else {
        fill (255,0,0, 100);
      }
   
    rect (60,350,100,20);}
    
    left = 500;
    right =600;
    top =350;
    bottom = 370;
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed) {
      card = 6;}
      else {
      fill (255,0,0,100);
      }
      rect (500,350,100,20);
      
    }    
    
  }else if (card == 6) {
    background (255);
    
    enter_forest = loadImage ("the satyr4.1.jpg");
    image(enter_forest,0,0);
    
        {
targetX= mouseX;
float dx = targetX- x;
if(abs(dx) > 1) {
  x += dx * easing;
}

targetY = mouseY;
float dy = targetY - y;
if (abs(dy) > 1) {
  y += dy * easing;
}

image(curs, x,y);
}
    
    int left = 530;
    int right = 630;
    int top = 250;
    int bottom = 300;
    
    if ( mouseX > left && mouseX < right && mouseY > top && mouseY < bottom ){
      if ( mousePressed) {
        card = 8;
      } else {
        fill (255,0,0, 100);
      }
   
    rect (530,250,100,50);
    }
    
   
    
  } else if (card == 7) {
    background (255);
    
     psychosis = loadImage("the satyr4.jpg");
     image(psychosis,0,0);
     
         {
targetX= mouseX;
float dx = targetX- x;
if(abs(dx) > 1) {
  x += dx * easing;
}

targetY = mouseY;
float dy = targetY - y;
if (abs(dy) > 1) {
  y += dy * easing;
}

image(curs, x,y);
}
  
  }else if (card == 8) {
    background (255);
    
    julia = loadImage ("the satyr 5.jpg");
    image(julia,-10,0);
    
        {
targetX= mouseX;
float dx = targetX- x;
if(abs(dx) > 1) {
  x += dx * easing;
}

targetY = mouseY;
float dy = targetY - y;
if (abs(dy) > 1) {
  y += dy * easing;
}

image(curs, x,y);
}
    
    int left = 115;
    int right = 215;
    int top = 420;
    int bottom = 440;
    
    if ( mouseX > left && mouseX < right && mouseY > top && mouseY < bottom ){
      if ( mousePressed) {
        card = 9;
      } else {
        fill (255,0,0, 100);
      }
   
    rect (115,420,100,20);
    } 
    left = 430;
    right =530;
    top =420;
    bottom = 440;
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed) {
      card = 10;}
      else {
      fill (255,0,0,100);
      }
      rect (430,420,100,20);
      
    } 
    
    
  }else if (card == 9) {
    background (255);
    
    cell_phone = loadImage ("the satyr 6.jpg");
    
    image(cell_phone,0,0);
    
        {
targetX= mouseX;
float dx = targetX- x;
if(abs(dx) > 1) {
  x += dx * easing;
}

targetY = mouseY;
float dy = targetY - y;
if (abs(dy) > 1) {
  y += dy * easing;
}

image(curs, x,y);
}
    
      int left = 125;
    int right = 225;
    int top = 400;
    int bottom = 420;
    
    if ( mouseX > left && mouseX < right && mouseY > top && mouseY < bottom ){
      if ( mousePressed) {
        card = 11;
      } else {
        fill (255,0,0, 100);
      }
    
    rect (125,400,100,20);}
    
    left = 440;
    right =540;
    top =400;
    bottom = 420;
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed) {
      card = 10;}
      else {
      fill (255,0,0,100);
      }
      rect (440,400,100,20);
      
    } 
    
  }else if (card == 10) {
    background (255);
    
    forest_edge = loadImage ("the satyr7.1.jpg");
    image(forest_edge,0,0);
    
        {
targetX= mouseX;
float dx = targetX- x;
if(abs(dx) > 1) {
  x += dx * easing;
}

targetY = mouseY;
float dy = targetY - y;
if (abs(dy) > 1) {
  y += dy * easing;
}

image(curs, x,y);
}
    
        
    int left = 540;
    int right = 640;
    int top = 210;
    int bottom = 260;
    
    if ( mouseX > left && mouseX < right && mouseY > top && mouseY < bottom ){
      if ( mousePressed) {
        card = 12;
      } else {
        fill (255,0,0, 100);
      }
    
    rect (540,210,100,50);}
    
    
  }else if ( card == 11) {
    background (255);
    
    trapped = loadImage ("the satyr 7.jpg");
    image(trapped,0,0);
    
        {
targetX= mouseX;
float dx = targetX- x;
if(abs(dx) > 1) {
  x += dx * easing;
}

targetY = mouseY;
float dy = targetY - y;
if (abs(dy) > 1) {
  y += dy * easing;
}

image(curs, x,y);
}
    
    
  }else if (card == 12) {
    background (255);
    
    tortoise_hare = loadImage ("the satyr 8.jpg");
    image(tortoise_hare,0,0);
    
        {
targetX= mouseX;
float dx = targetX- x;
if(abs(dx) > 1) {
  x += dx * easing;
}

targetY = mouseY;
float dy = targetY - y;
if (abs(dy) > 1) {
  y += dy * easing;
}

image(curs, x,y);
}
     
      int left = 115;
    int right = 215;
    int top = 410;
    int bottom = 430;
    
    if ( mouseX > left && mouseX < right && mouseY > top && mouseY < bottom ){
      if ( mousePressed) {
        card = 13;
      } else {
        fill (255,0,0, 100);
      }
   
    rect (120,410,100,20);}
    
    left = 450;
    right =550;
    top =410;
    bottom = 430;
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed) {
      card = 14;}
      else {
      fill (255,0,0,100);
      }
      rect (450,410,100,20);
      
    } 
    
    
    
  }else if (card == 13) {
    background (255);
    
    hare = loadImage ("the satyr 9.jpg");
    image(hare,0,0);
    
    
       {
targetX= mouseX;
float dx = targetX- x;
if(abs(dx) > 1) {
  x += dx * easing;
}

targetY = mouseY;
float dy = targetY - y;
if (abs(dy) > 1) {
  y += dy * easing;
}

image(curs, x,y);
}
      
      int left = 115;
    int right = 215;
    int top = 390;
    int bottom = 410;
    
    if ( mouseX > left && mouseX < right && mouseY > top && mouseY < bottom ){
      if ( mousePressed) {
        card = 15;
      } else {
        fill (255,0,0, 100);
      }
   
    rect (115,390,100,20);}
    
    left = 305;
    right =405;
    top =390;
    bottom = 410;
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed) {
      card = 14;}
      else {
      fill (255,0,0,100);
      }
      rect (300,390,100,20);
      
    } 
    
    
    
  }else if (card == 14) {
    background (255);
    
    dinner = loadImage ("the satyr 11.jpg");
    image(dinner,0,0);
    
        {
targetX= mouseX;
float dx = targetX- x;
if(abs(dx) > 1) {
  x += dx * easing;
}

targetY = mouseY;
float dy = targetY - y;
if (abs(dy) > 1) {
  y += dy * easing;
}

image(curs, x,y);
}
    
  }else if (card == 15) {
    background (255);
    
    hare_ho = loadImage ("the satyr 10.jpg");
    image(hare_ho,0,0);
    
        {
targetX= mouseX;
float dx = targetX- x;
if(abs(dx) > 1) {
  x += dx * easing;
}

targetY = mouseY;
float dy = targetY - y;
if (abs(dy) > 1) {
  y += dy * easing;
}

image(curs, x,y);
}
    
  }
}
    
    

